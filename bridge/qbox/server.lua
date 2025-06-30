Framework = "QBOX"
QBCore = exports['qb-core']:GetCoreObject()

function ShowNotification(target, text)
	TriggerClientEvent(GetCurrentResourceName()..":showNotification", target, text)
end

function GetIdentifier(source)
    local xPlayer = QBCore.Functions.GetPlayer(source).PlayerData
    return xPlayer.citizenid 
end

function SetPlayerMetadata(source, key, data)
    QBCore.Functions.GetPlayer(source).Functions.SetMetaData(key, data)
end

function AddMoney(source, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddMoney('cash', count, 'Dude Consumables Line 19')
end

function RemoveMoney(source, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveMoney('cash', count, 'Dude Consumables Line 24')
end

function GetMoney(source)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    return xPlayer.PlayerData.money.cash
end

function CheckPermission(source, permission)
    local xPlayer = QBCore.Functions.GetPlayer(source).PlayerData
    local name = xPlayer.job.name
    local rank = xPlayer.job.grade.level
    if permission.jobs[name] and permission.jobs[name] <= rank then 
        return true
    end
    for i=1, #permission.groups do 
        if QBCore.Functions.HasPermission(source, permission.groups[i]) then 
            return true 
        end
    end
end

-- Status
function ExecuteStatus(source, statuses)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return end
    
    DebugPrint("^2[dude_consumables] Executing status effects for player: " .. source .. "^0")
    
    -- Debug log all statuses
    for k, v in pairs(statuses) do
        DebugPrint("^2[dude_consumables] Status found: " .. k .. " = " .. v .. "^0")
        if k == "sobriety" then
            DebugPrint("^1[dude_consumables] WARNING: Sobriety found in ExecuteStatus, should be handled directly^0")
        end
    end
    
    -- Create a copy of the statuses table to avoid modification issues
    local statusesCopy = {}
    for k, v in pairs(statuses) do
        -- Skip sobriety as we handle it directly
        if k ~= "sobriety" then
            statusesCopy[k] = v
        end
    end
    
    -- Handle alcohol separately
    if statusesCopy.alcohol then
        DebugPrint("^2[dude_consumables] Sending alcohol update: " .. statusesCopy.alcohol .. "^0")
        TriggerClientEvent("dude_consumables:addAlcohol", source, statusesCopy.alcohol)
        statusesCopy.alcohol = nil  -- Remove from copy to prevent duplicate processing
    end
    
    -- Process other statuses
    for k,v in pairs(statusesCopy) do 
        if Config.MaxValues[k] then
            local value = (0.01 * v) * Config.MaxValues[k]
            DebugPrint("^2[dude_consumables] Sending status update: " .. k .. " = " .. value .. "^0")
            
            -- Update the player's metadata on the server
            if k == "hunger" or k == "thirst" or k == "stress" then
                local currentValue = xPlayer.PlayerData.metadata[k] or (k == "stress" and 0 or 100)
                local newValue = currentValue + value
                
                -- Apply limits based on the status type
                if k == "stress" then
                    newValue = math.max(0, newValue)
                else
                    newValue = math.min(100, newValue)
                end
                
                xPlayer.Functions.SetMetaData(k, newValue)
                DebugPrint("^2[dude_consumables] Updated player metadata: " .. k .. " from " .. currentValue .. " to " .. newValue .. "^0")
            end
            
            -- Send to client for HUD update
            TriggerClientEvent("dude_consumables:executeStatus", source, k, value)
        else
            Config.ExternalStatus(source, k, v)
        end
    end
end

-- Inventory Fallback
-- Make sure the RegisterUsableItem function is properly defined and called
CreateThread(function()
    Wait(100)
    
    if not UsableItem then 
        function RegisterUsableItem(name, cb)
            QBCore.Functions.CreateUseableItem(name, function(source, data)
                local item = data
                if item.info then
                    item.metadata = data.info
                    item.info = nil
                end
                cb(source, item.metadata, item.slot)
            end)
        end
    end

    -- Add debug print to confirm this section is running
    DebugPrint("^2[dude_consumables] Initializing item registration...^0")
    
    if InitializeInventory then 
        InitializeInventory() 
        DebugPrint("^2[dude_consumables] Inventory initialized!^0")
    else
        DebugPrint("^1[dude_consumables] InitializeInventory function not found!^0")
    end
end)


RegisterNetEvent("dude_consumables:initializePlayer", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Send initial status values to client
    TriggerClientEvent('hud:client:UpdateNeeds', source, Player.PlayerData.metadata.hunger, Player.PlayerData.metadata.thirst)
    TriggerClientEvent('hud:client:UpdateStress', source, Player.PlayerData.metadata.stress)
end)