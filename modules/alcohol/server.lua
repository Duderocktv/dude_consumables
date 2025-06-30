-- Register the breathalyzer item if it doesn't exist
CreateThread(function()
    Wait(1000)
    
    -- Register the breathalyzer item if it's in the config
    if Config.DrunkSystem and Config.DrunkSystem.TesterItem then
        RegisterUsableItem(Config.DrunkSystem.TesterItem, function(source, metadata, slot)
            local src = source
            local target = lib.callback.await('dude_consumables:getClosestPlayer', src)
            
            if not target then
                return ShowNotification(src, "No player nearby to test")
            end
            
            -- Start breathalyzer animation for both players
            TriggerClientEvent('dude_consumables:startBreathalyzerTest', src, target)
        end)
        
        DebugPrint("^2[dude_consumables] Registered breathalyzer item: " .. Config.DrunkSystem.TesterItem .. "^0")
    end
end)

-- Callback to get alcohol test results
lib.callback.register('dude_consumables:getAlcoholLevel', function(source, target)
    -- Request the alcohol level from the target player
    return lib.callback.await('dude_consumables:getMyAlcoholLevel', target)
end)

-- Notify the tested player about breathalyzer results
RegisterNetEvent('dude_consumables:notifyBreathalyzerResult', function(target, bac, description, color)
    TriggerClientEvent('lib.notify', target, {
        title = 'Breathalyzer Test',
        description = "Your BAC: " .. bac .. "% - " .. description,
        type = color,
        duration = Config.DrunkSystem.ResultTime * 1000
    })
end)