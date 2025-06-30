Players = {}

function EquipItem(source, item, refund)
    if Players[source] then 
        if refund then
            Inventory.AddItem(source, item.itemKey, 1, {itemKey = item.itemKey, uses = item.uses}, item.slot)
        end
        return
    end
    Players[source] = item
    TriggerClientEvent("dude_consumables:equipItem", source, item.itemKey, item)
end

function GiveRewards(source, rewards)
    for i=1, #rewards do 
        local reward = rewards[i]
        local amount = (type(reward.amount) == "table" and math.random(reward.amount[1], reward.amount[2]) or reward.amount)
        if not reward.type or reward.type == "item" then
            Inventory.AddItem(source, reward.name, amount)
        elseif reward.type == "money" then
            AddMoney(source, amount)
        end
    end
end



CreateThread(function()
    Wait(1000)
    DebugPrint("^2[dude_consumables] Registering usable items...^0")
    local itemCount = 0
    
    for k,v in pairs(Config.Normal_Items) do
        Config.Items[k] = v 
        RegisterUsableItem(k, function(source, metadata, slot)
			DebugClient(source, "Attempting to use item: " .. k)
            DebugPrint("^3[dude_consumables] Item used: " .. k .. "^0")
            if Players[source] then 
                DebugPrint("^1[dude_consumables] Player already has an item equipped!^0")
                return 
            end
            local metadata = metadata or {}
            if not metadata.itemKey then
                metadata.itemKey = k 
                metadata.uses = v.uses
                metadata.slot = slot
            end
            Inventory.RemoveItem(source, metadata.itemKey, 1, slot)
            EquipItem(source, metadata, false)
        end)
        itemCount = itemCount + 1
    end

    for k,v in pairs(Config.Glasses) do 
        Config.Items[k] = v
        RegisterUsableItem(k, function(source, metadata, slot)
			DebugClient(source, "Attempting to use item: " .. k)
            DebugPrint("^3[dude_consumables] Glass used: " .. k .. "^0")
            if Players[source] then 
                DebugPrint("^1[dude_consumables] Player already has an item equipped!^0")
                return 
            end
            local metadata = metadata or {}
            if not metadata.itemKey then
                metadata.itemKey = k 
                metadata.uses = v.uses
                metadata.slot = slot
                metadata.isglass = true
            end
            Inventory.RemoveItem(source, metadata.itemKey, 1, slot)
            EquipItem(source, metadata, false)
        end)
        itemCount = itemCount + 1
    end
    
    DebugPrint("^2[dude_consumables] Registered " .. itemCount .. " usable items!^0")
end)

lib.callback.register("dude_consumables:useItem", function(source)
    DebugPrint("^3[dude_consumables] Use item callback triggered for source: " .. source .. "^0")
    
    if not Players[source] then 
        DebugPrint("^1[dude_consumables] No active item for player: " .. source .. "^0")
        return false, 0 
    end
    
    local metadata = Players[source]
    local cfg = Config.Items[metadata.itemKey]
    
    DebugPrint("^3[dude_consumables] Processing item: " .. metadata.itemKey .. " with uses: " .. metadata.uses .. "^0")

    if metadata.mixed then
        cfg.status[metadata.mixedwith] = metadata.refillvalue
    end

    -- Extract sobriety value once
    local sobrietyValue = nil
    if cfg and cfg.status and cfg.status.sobriety then
        sobrietyValue = cfg.status.sobriety
        DebugPrint("^3[dude_consumables] Found sobriety value: " .. sobrietyValue .. "^0")
    end

    -- Special handling for glasses
    if Config.Glasses[metadata.itemKey] then
        -- If it's an empty glass (0 uses), don't allow consumption
        if metadata.uses <= 0 then 
            ShowNotification(source, locale("no_uses_left"))
            return false, metadata.uses
        end
        
        -- Reduce uses for filled glass
        metadata.uses = metadata.uses - 1
        DebugPrint("^3[dude_consumables] Glass uses left after consumption: " .. metadata.uses .. "^0")
        
        -- Apply status effects (drinking)
        if cfg and cfg.status then
            -- Create a copy without sobriety
            local statusCopy = {}
            for k, v in pairs(cfg.status) do
                if k ~= "sobriety" then
                    statusCopy[k] = v
                end
            end
            
            -- Apply other statuses
            if next(statusCopy) then
                ExecuteStatus(source, statusCopy)
            end
        end
        
        -- Apply sobriety effect if present
        if sobrietyValue then
            DebugPrint("^3[dude_consumables] Applying sobriety effect: " .. sobrietyValue .. "^0")
            TriggerClientEvent("dude_consumables:reducealcohol", source, sobrietyValue)
        end
        
        return true, metadata.uses
    end
    
    -- Normal item handling
    if metadata.uses < 1 then 
        ShowNotification(source, locale("no_uses_left"))
        return false, metadata.uses
    end
    
    metadata.uses = metadata.uses - 1
    DebugPrint("^3[dude_consumables] Uses left after consumption: " .. metadata.uses .. "^0")
    
    if metadata.uses < 1 and not metadata.isglass then 
        Players[source] = nil
    end
    
    -- Apply direct effects
    if cfg then
        if cfg.effect then
            DebugPrint("^3[dude_consumables] Applying effect: " .. cfg.effect.name .. "^0")
            TriggerClientEvent("dude_consumables:applyEffect", source, cfg.effect)
        end
        
        if cfg.rewards then
            GiveRewards(source, cfg.rewards)
        end
        
        if cfg.status then
            -- Create a copy without sobriety
            local statusCopy = {}
            for k, v in pairs(cfg.status) do
                if k ~= "sobriety" then
                    statusCopy[k] = v
                end
            end
            
            -- Apply other statuses
            if next(statusCopy) then
                ExecuteStatus(source, statusCopy)
            end
        end
    end
    
    -- Apply custom metadata statuses if present
    if metadata.status then
        -- Create a copy without sobriety
        local statusCopy = {}
        for k, v in pairs(metadata.status) do
            if k ~= "sobriety" then
                statusCopy[k] = v
            end
        end
        
        -- Apply other statuses
        if next(statusCopy) then
            ExecuteStatus(source, statusCopy)
        end
    end
    
    -- Apply sobriety effect if present (do this last, only once)
    if sobrietyValue then
        DebugPrint("^3[dude_consumables] Applying sobriety effect: " .. sobrietyValue .. "^0")
        TriggerClientEvent("dude_consumables:reducealcohol", source, sobrietyValue)
    end
    
    return true, metadata.uses
end)

RegisterNetEvent("dude_consumables:returnItem", function(destroy)
    local source = source
    if not Players[source] then return end
    local item = Players[source]
    if not destroy then
        Inventory.AddItem(source, item.itemKey, 1, item, item.slot)
    end
    Players[source] = nil
end)

function DebugClient(source, message)
    TriggerClientEvent("dude_consumables:debug", source, message)
end