Config = Config or {}
Config.Debug = false -- Set to true when you need debugging, false in production

Config.Language = "en" -- Language to use.

Config.RenderDistance = 100.0 -- Scenario display Radius.

Config.InteractDistance = 2.0 -- Interact Radius

Config.UseTarget = true -- When set to true, it'll use targeting instead of key-presses to interact.

Config.NoModelTargeting = true -- When set to true and using Target, it'll spawn a small invisible prop so you can third-eye when no entity is defined.

Config.Marker = { -- This will only be used if enabled, not using target, and no model is defined in the interaction.
    enabled = true,
    id = 2,
    scale = 0.25, 
    color = {255, 255, 255, 127},
}

-- DRUNK SYSTEM -- 
Config.DrunkSystem = {
    TesterItem = 'breathalyzer',
    ResultTime = 5,
    Driving = false,
    DisableSprint = false, -- Or false, your preference
    Ragdoll = true,     -- Or false, your preference (this code has the actual ragdoll effect commented out for now)
    MaxDrunk = 100.0,
    DecreaseRate = 0.5,
    RandomVehicleInteraction = {
        {interaction = 7, time = 300}, -- Steer Left (INPUT_VEH_MOVE_LEFT_ONLY)
        {interaction = 8, time = 300}, -- Steer Right (INPUT_VEH_MOVE_RIGHT_ONLY)
        {interaction = 7, time = 500},
        {interaction = 8, time = 500},
    },
    DrivingCheckInterval = 1500,          -- ADD THIS (milliseconds)
    MinStageForDrivingEffects = 2,      -- ADD THIS
    DrivingEffectChanceMultiplier = 0.10, -- ADD THIS
    MinStageForSprintDisable = 3,       -- ADD THIS
}

Config.Effects = {
    ["drunk"] = {
        canOverlap = false,
        process = function(data)
            -- Get alcohol amount from data or use default
            local amount = data.amount or 5.0
            
            -- Add alcohol to player's system using our new function
            exports[GetCurrentResourceName()]:AddAlcohol(amount)
            
            -- Log that we're using the new system
            DebugPrint("^3[dude_consumables] Using new alcohol system, added: " .. amount .. "^0")
        end
    },
    ["high"] = {
        canOverlap = false,
        process = function(data)
            local time = data.time or 5000
            local intensity = data.intensity or 1.0
            local player = PlayerId()
            local ped = PlayerPedId()
            RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") 
            while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
                Wait(0)
            end    
            SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", 1.0)
            SetPedMotionBlur(ped, true)
            SetPedIsDrunk(ped, true)
            SetTimecycleModifier("spectator6")
            for i=1, 100 do 
                SetTimecycleModifierStrength(i * 0.01)
                ShakeGameplayCam("DRUNK_SHAKE", i * 0.01)
                Wait(10)
            end
            Wait(time)
            for i=1, 100 do 
                SetTimecycleModifierStrength(1.0 - (i * 0.01))
                ShakeGameplayCam("DRUNK_SHAKE", (1.0 - (i * 0.01)))
                Wait(10)
            end
            SetPedMoveRateOverride(player, 1.0)
            SetRunSprintMultiplierForPlayer(player, 1.0)
            SetPedIsDrunk(ped, false)
            SetPedMotionBlur(ped, false)
            ResetPedMovementClipset(ped, 1.0)
        end
    }
}

Config.ExternalStatus = function(source, name, amount) -- (Server-Sided) Implement custom exports and events for external status resources.
    if amount == 0 then return end
    if amount > 0 then -- Add Status
        if amount > 200 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", amount)
        else
            TriggerEvent("evidence:client:SetStatus", "alcohol", amount)
        end
        if GetResourceState("ps_buffs") == "started" then
            local amount = math.abs(amount)
            exports.ps_buffs:AddBuff(source, GetIdentifier(source), name, amount)
        end
    else -- Remove Status
        if GetResourceState("ps_buffs") == "started" then
            local amount = math.abs(amount)
            exports.ps_buffs:RemoveBuff(source, GetIdentifier(source), name)
        end
    end
end

Config.Options = { -- Item Options
    drop = {
        despawnTime = 240, -- Seconds until it deletes the entity after dropping it.
    },
    throwing = { 
        despawnTime = 30, -- Seconds until it deletes the entity after throwing it.
        power = 20, -- The amount of power to use when throwing the entity.
    }
}

Config.MaxValues = { -- If you want a custom maximum for a value, change -1 to the number. This is already handled in the bridge.
    hunger  = 100,
    thirst  = 100,
    stress  = 100,
    armor   = 100,
    stamina = 100
}

Config.Items = {} -- leave this blank

function DebugPrint(...)
    if Config.Debug then
        print("[DEBUG]", ...)
    end
end