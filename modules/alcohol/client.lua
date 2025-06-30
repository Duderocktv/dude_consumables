local lastVehicle = nil
-- Alcohol state tracking
local STATE = {
    ALCOHOL_LEVEL = 0.0,  -- Current alcohol level (0.0-100.0)
    DRUNK_EFFECT_ACTIVE = false,  -- Is a drunk effect currently being displayed?
    DRUNK_THREAD_ACTIVE = false,  -- Is the drunk management thread running?
    CURRENT_DRUNK_STAGE = 0  -- Current stage of drunkenness (0-5)
}

-- Drunk stages configuration
local DRUNK_STAGES = {
    -- Stage 1: Slight buzz (10-24%)
    [1] = {
        min = 10,
        walkStyle = nil,  -- No walk style change yet
        screenEffect = "drug_flying_02",
        screenEffectStrength = 0.3,
        cameraShake = "DRUNK_SHAKE",
        cameraShakeIntensity = 0.3
    },
    -- Stage 2: Tipsy (25-44%)
    [2] = {
        min = 25,
        walkStyle = "MOVE_M@DRUNK@SLIGHTLYDRUNK", 
        screenEffect = "drug_flying_02",
        screenEffectStrength = 0.5,
        cameraShake = "DRUNK_SHAKE",
        cameraShakeIntensity = 0.5
    },
    -- Stage 3: Drunk (45-64%)
    [3] = {
        min = 45,
        walkStyle = "MOVE_M@DRUNK@MODERATEDRUNK",
        screenEffect = "drug_wobbly",
        screenEffectStrength = 0.7,
        cameraShake = "DRUNK_SHAKE",
        cameraShakeIntensity = 0.7
    },
    -- Stage 4: Very drunk (65-84%)
    [4] = {
        min = 65,
        walkStyle = "MOVE_M@DRUNK@VERYDRUNK",
        screenEffect = "drug_wobbly",
        screenEffectStrength = 0.9,
        cameraShake = "DRUNK_SHAKE",
        cameraShakeIntensity = 0.9
    },
    -- Stage 5: Wasted (85-100%)
    [5] = {
        min = 85,
        walkStyle = "MOVE_M@DRUNK@VERYDRUNK",
        screenEffect = "drug_wobbly",
        screenEffectStrength = 1.0,
        cameraShake = "DRUNK_SHAKE", 
        cameraShakeIntensity = 1.0,
        ragdoll = true  -- Random ragdoll chance when at this level
    }
}

-- Function to get the current drunk stage based on alcohol level
local function GetDrunkStage(alcoholLevel)
    local stage = 0
    for i = 5, 1, -1 do
        if alcoholLevel >= DRUNK_STAGES[i].min then
            stage = i
            break
        end
    end
    return stage
end

-- Function to smoothly transition between timecycle modifiers
local function TransitionTimecycle(fromEffect, toEffect, fromStrength, toStrength)
    -- If the effects are the same, just adjust the strength
    if fromEffect == toEffect then
        local steps = 10
        local strengthDiff = toStrength - fromStrength
        local strengthStep = strengthDiff / steps
        
        for i = 1, steps do
            local newStrength = fromStrength + (strengthStep * i)
            SetTimecycleModifierStrength(newStrength)
            Wait(30) -- 300ms total transition
        end
        return
    end
    
    -- If effects are different, we need to blend them
    -- First, gradually reduce the strength of the current effect
    local steps = 5
    for i = 1, steps do
        local newStrength = fromStrength * (1 - (i / steps))
        SetTimecycleModifierStrength(newStrength)
        Wait(30) -- 150ms fade out
    end
    
    -- Switch to the new effect
    SetTimecycleModifier(toEffect)
    
    -- Gradually increase the strength of the new effect
    for i = 1, steps do
        local newStrength = toStrength * (i / steps)
        SetTimecycleModifierStrength(newStrength)
        Wait(30) -- 150ms fade in
    end
end

-- Apply drunk effects based on current stage
local function ApplyDrunkEffects(stage, previousStage)
    local ped = PlayerPedId()
    
    if stage == 0 then
        -- Clear all effects
        ShakeGameplayCam("DRUNK_SHAKE", 0.0)
        SetPedIsDrunk(ped, false)
        SetPedMotionBlur(ped, false)
        
        -- Gradually fade out the effect
        if STATE.DRUNK_EFFECT_ACTIVE then
            local steps = 10
            for i = 1, steps do
                local newStrength = (1.0 - (i / steps))
                SetTimecycleModifierStrength(newStrength)
                Wait(50) -- 500ms total fade out
            end
        end
        
        ClearTimecycleModifier()
        ResetPedMovementClipset(ped, 0.0)
        STATE.DRUNK_EFFECT_ACTIVE = false
        return
    end

    local stageData = DRUNK_STAGES[stage]
    
    -- Apply walk style if different from current
    if stageData.walkStyle then
        if not HasAnimSetLoaded(stageData.walkStyle) then
            RequestAnimSet(stageData.walkStyle)
            while not HasAnimSetLoaded(stageData.walkStyle) do
                Wait(0)
            end
        end
        SetPedMovementClipset(ped, stageData.walkStyle, 1.0)
    end
    
    -- Apply drunk state
    SetPedIsDrunk(ped, true)
    SetPedMotionBlur(ped, true)
    
    -- Apply screen effects with smooth transition
    if STATE.DRUNK_EFFECT_ACTIVE and previousStage then
        local prevData = DRUNK_STAGES[previousStage]
        TransitionTimecycle(
            prevData.screenEffect, 
            stageData.screenEffect,
            prevData.screenEffectStrength,
            stageData.screenEffectStrength
        )
    else
        -- First time applying effect
        SetTimecycleModifier(stageData.screenEffect)
        
        -- Fade in effect
        local steps = 10
        for i = 1, steps do
            local strength = (i / steps) * stageData.screenEffectStrength
            SetTimecycleModifierStrength(strength)
            ShakeGameplayCam(stageData.cameraShake, strength * stageData.cameraShakeIntensity)
            Wait(50) -- 500ms total fade in
        end
    end
    
    -- Set camera shake
    ShakeGameplayCam(stageData.cameraShake, stageData.cameraShakeIntensity)
    
    -- Set flag that effects are active
    STATE.DRUNK_EFFECT_ACTIVE = true
    
    -- Handle random ragdoll for highest drunk stage
    if stageData.ragdoll and stage == 5 then
        CreateThread(function()
            while STATE.CURRENT_DRUNK_STAGE == 5 do
                Wait(math.random(5000, 15000))  -- Random interval
                if math.random() < 0.3 and not IsPedRagdoll(ped) and not IsPedInAnyVehicle(ped, true) then  -- 30% chance to fall
                    SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 0, 0, 0, 0)
                end
                Wait(5000)  -- Cooldown between ragdoll checks
            end
        end)
    end
end

-- Function to add alcohol to the player's system
function AddAlcohol(amount)
    -- Ensure amount is positive
    if amount <= 0 then return end
    
    -- Get old level and stage
    local oldLevel = STATE.ALCOHOL_LEVEL
    local oldStage = GetDrunkStage(oldLevel)
    
    -- Add to current level with upper limit of 100
    STATE.ALCOHOL_LEVEL = math.min(100.0, STATE.ALCOHOL_LEVEL + amount)
    
    -- Get new stage
    local newStage = GetDrunkStage(STATE.ALCOHOL_LEVEL)
    
    -- Start the drunk management thread if not already running
    if not STATE.DRUNK_THREAD_ACTIVE then
        StartDrunkThread()
    end
    
    -- Apply effects immediately if stage changed
    if newStage ~= oldStage then
        local previousStage = STATE.CURRENT_DRUNK_STAGE
        STATE.CURRENT_DRUNK_STAGE = newStage
        ApplyDrunkEffects(newStage, previousStage)
        DebugPrint("^3[dude_consumables] Drunk stage changed to: " .. newStage .. "^0")
    end
    
    -- Debug output
    DebugPrint("^3[dude_consumables] Added alcohol: " .. amount .. ", New level: " .. STATE.ALCOHOL_LEVEL .. "^0")
end

-- Function to start the drunk management thread
function StartDrunkThread()
    if STATE.DRUNK_THREAD_ACTIVE then return end
    
    STATE.DRUNK_THREAD_ACTIVE = true
    
    -- Apply initial effects
    local newStage = GetDrunkStage(STATE.ALCOHOL_LEVEL)
    STATE.CURRENT_DRUNK_STAGE = newStage
    ApplyDrunkEffects(newStage)
    DebugPrint("^3[dude_consumables] Initial drunk stage set to: " .. newStage .. "^0")
    
    CreateThread(function()
        while STATE.ALCOHOL_LEVEL > 0 do
            -- Check what stage we should be at
            local newStage = GetDrunkStage(STATE.ALCOHOL_LEVEL)
            
            -- If stage changed, update effects
            if newStage ~= STATE.CURRENT_DRUNK_STAGE then
                local previousStage = STATE.CURRENT_DRUNK_STAGE
                STATE.CURRENT_DRUNK_STAGE = newStage
                ApplyDrunkEffects(newStage, previousStage)
                DebugPrint("^3[dude_consumables] Drunk stage changed to: " .. newStage .. "^0")
            end
            
            -- Gradually decrease alcohol level over time
            Wait(10000)  -- Check every 10 seconds
            STATE.ALCOHOL_LEVEL = math.max(0.0, STATE.ALCOHOL_LEVEL - Config.DrunkSystem.DecreaseRate)
            
            -- Debug output every minute
            if math.floor(STATE.ALCOHOL_LEVEL * 10) % 50 == 0 then
                DebugPrint("^3[dude_consumables] Current alcohol level: " .. STATE.ALCOHOL_LEVEL .. "^0")
            end
        end
        
        -- Once alcohol level reaches 0, clear all effects
        ApplyDrunkEffects(0)
        STATE.CURRENT_DRUNK_STAGE = 0
        STATE.DRUNK_THREAD_ACTIVE = false
        DebugPrint("^3[dude_consumables] Alcohol effects cleared^0")
    end)
end

-- Function to get the current alcohol level (for breathalyzer)
function GetCurrentAlcoholLevel()
    return STATE.ALCOHOL_LEVEL
end

-- Clear drunk effects on player death
AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkEntityDamage' then
        local victim = args[1]
        local isDead = args[4] == 1
        
        if victim == PlayerPedId() and isDead then
            -- Just pause the visual effects while dead
            -- Don't clear the alcohol level
            ShakeGameplayCam("DRUNK_SHAKE", 0.0)
            ClearTimecycleModifier()
            
            -- Flag that we need to reapply effects after revival
            STATE.DRUNK_EFFECT_ACTIVE = false
            
            DebugPrint("^3[dude_consumables] Paused drunk effects due to player death^0")
        end
    end
end)

-- Function to reapply drunk effects (can be called from external scripts)
function ReapplyDrunkEffects()
    if STATE.ALCOHOL_LEVEL > 0 then
        local stage = GetDrunkStage(STATE.ALCOHOL_LEVEL)
        if stage > 0 then
            -- Schedule multiple attempts to reapply the effect, but with smoother transitions
            CreateThread(function()
                -- First attempt immediately
                ApplyDrunkVisualEffects(stage, true)
                
                -- One additional attempt after a delay to ensure it sticks
                Wait(1000)
                ApplyDrunkVisualEffects(stage, false)
            end)
            
            DebugPrint("^3[dude_consumables] Reapplied drunk effects: Stage " .. stage .. "^0")
        end
    end
end

-- Function specifically for applying visual effects (separate from walk style)
function ApplyDrunkVisualEffects(stage, firstAttempt)
    if stage <= 0 then return end
    
    local stageData = DRUNK_STAGES[stage]
    local ped = PlayerPedId()
    
    -- Apply walk style
    if stageData.walkStyle and firstAttempt then
        if not HasAnimSetLoaded(stageData.walkStyle) then
            RequestAnimSet(stageData.walkStyle)
            while not HasAnimSetLoaded(stageData.walkStyle) do
                Wait(0)
            end
        end
        SetPedMovementClipset(ped, stageData.walkStyle, 1.0)
    end
    
    -- Only clear on first attempt
    if firstAttempt then
        ClearTimecycleModifier()
    end
    
    -- Apply drunk state
    SetPedIsDrunk(ped, true)
    SetPedMotionBlur(ped, true)
    
    -- Apply the visual effect
    SetTimecycleModifier(stageData.screenEffect)
    
    -- Fade in the effect if it's the first attempt
    if firstAttempt then
        for i = 1, 10 do
            local strength = (i / 10) * stageData.screenEffectStrength
            SetTimecycleModifierStrength(strength)
            ShakeGameplayCam(stageData.cameraShake, strength * stageData.cameraShakeIntensity)
            Wait(30)  -- 300ms total fade in
        end
    else
        -- Just set to full strength if it's a follow-up attempt
        SetTimecycleModifierStrength(stageData.screenEffectStrength)
        ShakeGameplayCam(stageData.cameraShake, stageData.cameraShakeIntensity)
    end
    
    -- Update state
    STATE.CURRENT_DRUNK_STAGE = stage
    STATE.DRUNK_EFFECT_ACTIVE = true
    
    if firstAttempt then
        DebugPrint("^3[dude_consumables] Applied visual effects for stage " .. stage .. "^0")
    end
end

-- Register this as an export so other scripts can call it
exports('ReapplyDrunkEffects', ReapplyDrunkEffects)

-- Command to manually reapply drunk effects (for testing)
RegisterCommand('reapplydrunk', function()
    ReapplyDrunkEffects()
end, false)

-- Remove all the event listeners except playerSpawned
AddEventHandler('playerSpawned', function()
    -- Wait a bit for the player to fully spawn
    Wait(2000)
    ReapplyDrunkEffects()
end)

-- Event to receive alcohol status updates
RegisterNetEvent("dude_consumables:addAlcohol", function(amount)
    AddAlcohol(amount)
end)

-- Event to apply effects directly
RegisterNetEvent("dude_consumables:applyEffect", function(effectData)
    if effectData.name == "drunk" then
        -- Use our alcohol system
        local amount = effectData.amount or 5.0
        AddAlcohol(amount)
        DebugPrint("^3[dude_consumables] Using new alcohol system, added: " .. amount .. "^0")
    elseif Config.Effects[effectData.name] then
        -- Use the standard effect system for other effects
        Config.Effects[effectData.name].process(effectData)
    end
end)

-- Drunk driving effects
-- CreateThread(function()
--     while true do
--         Wait(1000)
        
--         -- Only apply if drunk and Config allows it
--         if STATE.CURRENT_DRUNK_STAGE >= 2 and Config.DrunkSystem.Driving then
--             local ped = PlayerPedId()
            
--             -- Check if player is driving
--             if IsPedInAnyVehicle(ped, false) then
--                 local vehicle = GetVehiclePedIsIn(ped, false)
                
--                 -- Store the current vehicle
--                 lastVehicle = vehicle
                
--                 -- Only apply effects if player is the driver
--                 if GetPedInVehicleSeat(vehicle, -1) == ped then
--                     -- Frequency of effects increases with drunkenness
--                     local checkInterval = math.max(1, 5 - STATE.CURRENT_DRUNK_STAGE) * 1000
--                     Wait(checkInterval)
                    
--                     -- Double-check player is still in the same vehicle and driving
--                     if IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) == vehicle and GetPedInVehicleSeat(vehicle, -1) == ped then
--                         -- Random chance to trigger effect based on drunk level
--                         if math.random() < (STATE.CURRENT_DRUNK_STAGE * 0.15) then
--                             -- Get random interaction from config
--                             local interaction = Config.DrunkSystem.RandomVehicleInteraction[math.random(#Config.DrunkSystem.RandomVehicleInteraction)]
                            
--                             -- Apply the vehicle control effect
--                             if interaction.interaction == 10 then
--                                 -- Turn left
--                                 TaskVehicleTempAction(ped, vehicle, 7, interaction.time)
--                             elseif interaction.interaction == 11 then
--                                 -- Turn right
--                                 TaskVehicleTempAction(ped, vehicle, 8, interaction.time)
--                             end
                            
--                             -- Notify player they're having trouble controlling the vehicle
--                             if math.random() < 0.3 then
--                                 lib.notify({
--                                     title = 'Drunk Driving',
--                                     description = 'You\'re having trouble controlling the vehicle',
--                                     type = 'error',
--                                     duration = 3000
--                                 })
--                             end
--                         end
--                     end
--                 end
--             elseif lastVehicle ~= nil then
--                 -- Player has exited a vehicle, make sure to clear any vehicle tasks
--                 if DoesEntityExist(lastVehicle) then
--                     -- Clear any active vehicle tasks
--                     ClearVehicleTasks(lastVehicle)
--                     SetVehicleEngineOn(lastVehicle, true, true, false)
--                 end
--                 lastVehicle = nil
--             end
--         end
        
--         -- Only run this thread when necessary
--         if STATE.ALCOHOL_LEVEL <= 0 then
--             Wait(5000)  -- Longer wait when sober
--         end
--     end
-- end)

-- Add an event handler for when the player exits a vehicle
AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkPlayerEnteredVehicle' then
        local playerId = args[1]
        local vehicle = args[2]
        
        if playerId == PlayerId() then
            lastVehicle = vehicle
        end
    elseif name == 'CEventNetworkPlayerLeftVehicle' then
        local playerId = args[1]
        local vehicle = args[2]
        
        if playerId == PlayerId() and lastVehicle == vehicle then
            -- Player has exited a vehicle, make sure to clear any vehicle tasks
            if DoesEntityExist(vehicle) then
                -- Clear any active vehicle tasks
                ClearVehicleTasks(vehicle)
                SetVehicleEngineOn(vehicle, true, true, false)
            end
            lastVehicle = nil
        end
    end
end)

-- Helper function to clear vehicle tasks
function ClearVehicleTasks(vehicle)
    -- Clear AI tasks for the vehicle
    ClearPedTasks(GetPedInVehicleSeat(vehicle, -1))
    
    -- Reset vehicle controls
    SetVehicleSteeringAngle(vehicle, 0.0)
    SetVehicleForwardSpeed(vehicle, 0.0)
    
    -- Make sure the vehicle is properly stationary if it should be
    if GetEntitySpeed(vehicle) < 0.5 then
        SetVehicleBrake(vehicle, true)
        SetVehicleHandbrake(vehicle, true)
        Wait(100)
        SetVehicleHandbrake(vehicle, false)
    end
end

-- Disable sprint when drunk if configured
CreateThread(function()
    while true do
        Wait(0)
        
        if STATE.CURRENT_DRUNK_STAGE >= 3 and Config.DrunkSystem.DisableSprint then
            DisableControlAction(0, 21, true) -- Disable sprint
            
            -- Also make player stumble occasionally
            if IsControlJustPressed(0, 32) or IsControlJustPressed(0, 33) or IsControlJustPressed(0, 34) or IsControlJustPressed(0, 35) then
                if math.random() < 0.2 then
                    SetPedToRagdoll(PlayerPedId(), 1500, 1500, 0, 0, 0, 0)
                end
            end
        end
        
        -- Only run this thread when necessary
        if STATE.ALCOHOL_LEVEL <= 0 then
            Wait(1000)  -- Longer wait when sober
        end
    end
end)

-- More detailed breathalyzer test
RegisterNetEvent('dude_consumables:startBreathalyzerTest', function(target)
    local ped = PlayerPedId()
    
    -- Play animation for officer
    lib.progressBar({
        duration = 5000,
        label = 'Performing breathalyzer test',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = "anim@amb@nightclub@peds@",
            clip = "rcmme_amanda1_stand_loop_cop"
        },
    })
    
    -- Get target's alcohol level
    local alcoholLevel = lib.callback.await('dude_consumables:getAlcoholLevel', false, target)
    
    -- Find the appropriate result description
    local resultDescription = "SOBER - No alcohol detected"
    
    for _, result in ipairs(Config.BreathalyzerResults) do
        if alcoholLevel >= result.min and alcoholLevel <= result.max then
            resultDescription = result.description
            break
        end
    end
    
    -- Format BAC percentage (Blood Alcohol Content)
    local bacPercentage = string.format("%.2f", alcoholLevel / 100)
    
    -- Determine result color
    local resultColor = "green"
    if alcoholLevel >= 8.0 then
        resultColor = "red"
    elseif alcoholLevel >= 5.0 then
        resultColor = "orange"
    end
    
    -- Show result to officer with detailed information
    lib.notify({
        title = 'Breathalyzer Result',
        description = "BAC: " .. bacPercentage .. "% - " .. resultDescription,
        type = resultColor,
        duration = Config.DrunkSystem.ResultTime * 1000
    })
    
    -- Also notify the tested player
    TriggerServerEvent('dude_consumables:notifyBreathalyzerResult', target, bacPercentage, resultDescription, resultColor)
end)

-- Callback to provide my alcohol level to server
lib.callback.register('dude_consumables:getMyAlcoholLevel', function()
    return STATE.ALCOHOL_LEVEL
end)

-- Get closest player for breathalyzer
lib.callback.register('dude_consumables:getClosestPlayer', function()
    local playerId = GetClosestPlayer()
    if playerId ~= -1 then
        return GetPlayerServerId(playerId)
    end
    return nil
end)

-- Command to clear all drunk effects for testing
RegisterCommand('cleardrunk', function()
    ResetPedMovementClipset(PlayerPedId(), 0)
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetPedIsDrunk(PlayerPedId(), false)
    SetPedMotionBlur(PlayerPedId(), false)
    ClearTimecycleModifier()
    AnimpostfxStopAll()
    STATE.ALCOHOL_LEVEL = 0
    STATE.DRUNK_EFFECT_ACTIVE = false
    STATE.CURRENT_DRUNK_STAGE = 0
    DebugPrint("^3[dude_consumables] Cleared all drunk effects^0")
end, false)


-- Function to reduce alcohol level (for coffee, water, etc.)
function ReduceAlcohol(amount)
    -- Ensure amount is positive
    if amount <= 0 then return end
    
    -- Get current level
    local oldLevel = STATE.ALCOHOL_LEVEL
    local oldStage = GetDrunkStage(oldLevel)
    
    -- Reduce alcohol level but don't go below 0
    STATE.ALCOHOL_LEVEL = math.max(0.0, STATE.ALCOHOL_LEVEL - amount)
    
    -- Get new stage
    local newStage = GetDrunkStage(STATE.ALCOHOL_LEVEL)
    
    -- Apply effects if stage changed
    if newStage ~= oldStage then
        local previousStage = STATE.CURRENT_DRUNK_STAGE
        STATE.CURRENT_DRUNK_STAGE = newStage
        ApplyDrunkEffects(newStage, previousStage)
        DebugPrint("^3[dude_consumables] Drunk stage changed to: " .. newStage .. " (sobering up)^0")
    end
    
    -- Debug output
    DebugPrint("^3[dude_consumables] Reduced alcohol by: " .. amount .. ", New level: " .. STATE.ALCOHOL_LEVEL .. "^0")
    
    -- If alcohol level is now 0, stop the drunk thread
    if STATE.ALCOHOL_LEVEL <= 0 and STATE.DRUNK_THREAD_ACTIVE then
        ApplyDrunkEffects(0)
        STATE.CURRENT_DRUNK_STAGE = 0
        STATE.DRUNK_THREAD_ACTIVE = false
        DebugPrint("^3[dude_consumables] Alcohol effects cleared (sobered up)^0")
    end
end

-- Debounce for sobriety events
local lastSobrietyTime = 0
local sobrietyDebounceTime = 500 -- ms

-- Event to receive sobriety status updates
RegisterNetEvent("dude_consumables:reducealcohol", function(amount)
    -- Get current time for debounce
    local currentTime = GetGameTimer()
    
    -- Debug info
    DebugPrint("^3[dude_consumables] Received reducealcohol event with amount: " .. amount .. "^0")
    
    -- Check if we should process this event (debounce)
    if currentTime - lastSobrietyTime < sobrietyDebounceTime then
        DebugPrint("^3[dude_consumables] Debounced reducealcohol event (too soon after previous)^0")
        return
    end
    
    -- Update last sobriety time
    lastSobrietyTime = currentTime
    
    -- Process the sobriety effect
    ReduceAlcohol(amount)
end)

-- Register export
exports('ReduceAlcohol', ReduceAlcohol)

-- Test command for sobriety
RegisterCommand('testsobering', function(source, args)
    local amount = tonumber(args[1]) or 5
    DebugPrint("^3[dude_consumables] Testing sobriety with amount: " .. amount .. "^0")
    ReduceAlcohol(amount)
end, false)

-- Register exports
exports('AddAlcohol', AddAlcohol)
exports('GetCurrentAlcoholLevel', GetCurrentAlcoholLevel)