QBCore = exports['qb-core']:GetCoreObject()

function ShowNotification(text)
	QBCore.Functions.Notify(text)
end

function GetPlayersInArea(coords, radius)
    local coords = coords or GetEntityCoords(PlayerPedId())
    local radius = radius or 3.0
    local list = QBCore.Functions.GetPlayersFromCoords(coords, radius)
    local players = {}
    for _, player in pairs(list) do 
        if player ~= PlayerId() then
            players[#players + 1] = player
        end
    end
    return players
end

RegisterNetEvent(GetCurrentResourceName()..":showNotification", function(text)
    ShowNotification(text)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- Add a small delay to ensure player data is fully loaded
    Citizen.Wait(1000)
    TriggerServerEvent("dude_consumables:initializePlayer")
end)

-- Get current player status
local function GetCurrentPlayerStatus()
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.metadata then
        return 100, 100, 0 -- Default values if data not available
    end
    
    local hunger = playerData.metadata.hunger or 100
    local thirst = playerData.metadata.thirst or 100
    local stress = playerData.metadata.stress or 0
    
    return hunger, thirst, stress
end

-- Status updates
-- Create a local cache for tracking status values
local statusCache = {
    hunger = 100,
    thirst = 100,
    stress = 0
}

-- Status updates
RegisterNetEvent("dude_consumables:executeStatus", function(status, value)
    DebugPrint("^2[dude_consumables] Updating status: " .. status .. " by " .. value .. "^0")
    
    -- Get current values safely
    local playerData = QBCore.Functions.GetPlayerData()
    if not playerData or not playerData.metadata then
        DebugPrint("^1[dude_consumables] Player data not available yet^0")
        return
    end
    
    local currentHunger = playerData.metadata.hunger
    local currentThirst = playerData.metadata.thirst
    local currentStress = playerData.metadata.stress
    
    -- Set defaults if values are nil
    if currentHunger == nil then currentHunger = 100 end
    if currentThirst == nil then currentThirst = 100 end
    if currentStress == nil then currentStress = 0 end
    
    -- Use the specific HUD event for your server based on status type
    if status == "hunger" then
        -- Calculate new value with limits
        local newHunger = math.min(100, currentHunger + value)
        
        -- For hunger updates: TriggerEvent('hud:client:UpdateNeeds', newHunger, currentThirst)
        TriggerEvent('hud:client:UpdateNeeds', newHunger, currentThirst)
        DebugPrint("^2[dude_consumables] Updated hunger from " .. tostring(currentHunger) .. " to " .. tostring(newHunger) .. "^0")
    elseif status == "thirst" then
        -- Calculate new value with limits
        local newThirst = math.min(100, currentThirst + value)
        
        -- For thirst updates: TriggerEvent('hud:client:UpdateNeeds', currentHunger, newThirst)
        TriggerEvent('hud:client:UpdateNeeds', currentHunger, newThirst)
        DebugPrint("^2[dude_consumables] Updated thirst from " .. tostring(currentThirst) .. " to " .. tostring(newThirst) .. "^0")
    elseif status == "stress" then
        -- Calculate new value with limits
        local newStress = math.max(0, currentStress + value)
        
        -- Stress uses a different event
        TriggerEvent('hud:client:UpdateStress', newStress)
        DebugPrint("^2[dude_consumables] Updated stress from " .. tostring(currentStress) .. " to " .. tostring(newStress) .. "^0")
    elseif status == "alcohol" then
        -- Handle alcohol status if needed
        DebugPrint("^2[dude_consumables] Updated alcohol level by " .. value .. "^0")
    else
        DebugPrint("^3[dude_consumables] Unknown status type: " .. status .. "^0")
    end
end)

-- Initialize status cache from server on resource start
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- Add a small delay to ensure player data is fully loaded
    Citizen.Wait(1000)
    
    -- Get current status values from player data
    local hunger, thirst, stress = GetCurrentPlayerStatus()
    
    statusCache.hunger = hunger
    statusCache.thirst = thirst
    statusCache.stress = stress
    
    DebugPrint("^2[dude_consumables] Initialized status cache: hunger=" .. tostring(statusCache.hunger) .. 
               ", thirst=" .. tostring(statusCache.thirst) .. 
               ", stress=" .. tostring(statusCache.stress) .. "^0")
end)

-- Update cache when HUD updates from other sources
RegisterNetEvent('hud:client:UpdateNeeds', function(hunger, thirst)
    statusCache.hunger = hunger or statusCache.hunger
    statusCache.thirst = thirst or statusCache.thirst
    DebugPrint("^2[dude_consumables] Updated status cache from HUD: hunger=" .. tostring(hunger) .. 
               ", thirst=" .. tostring(thirst) .. "^0")
end)

RegisterNetEvent('hud:client:UpdateStress', function(stress)
    statusCache.stress = stress or statusCache.stress
    DebugPrint("^2[dude_consumables] Updated status cache from HUD: stress=" .. tostring(stress) .. "^0")
end)

-- Inventory Fallback
CreateThread(function()
    Wait(100)
    if InitializeInventory then return InitializeInventory() end -- Already loaded through inventory folder.
end)