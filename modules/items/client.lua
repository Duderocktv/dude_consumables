EquippedItem = nil
ItemData = nil
local AttachedProp
local AttachedPropNo2
local PerformingAction
local ProcessingEffect

function DisableControls(denied)
    for i=1, #denied do 
        DisableControlAction(0, denied[i], true)
    end
end

function RemoveAttachedProp()
    if AttachedProp and DoesEntityExist(AttachedProp) then
        DeleteEntity(AttachedProp)
    end
    AttachedProp = nil

    if AttachedPropNo2 and DoesEntityExist(AttachedPropNo2) then
        DeleteEntity(AttachedPropNo2)
    end
    AttachedPropNo2 = nil
end

function AttachProp(name)
    RemoveAttachedProp()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local cfg = Config.Items[name]
    local prop = cfg.prop

    if Config.Glasses[name] then
        if ItemData.uses < 1 then
            AttachedProp = CreateProp(prop.Main.Model.null, coords.x, coords.y, coords.z, true, true, false)
            SetEntityCollision(AttachedProp, false, true)
            AttachEntityToEntity(AttachedProp, ped, GetPedBoneIndex(ped, prop.Main.BoneID), 
            prop.Main.Offset.x, prop.Main.Offset.y, prop.Main.Offset.z, 
            prop.Main.Rot.x, prop.Main.Rot.y, prop.Main.Rot.z, false, false, false, true, 2, true)
        else
            AttachedProp = CreateProp(prop.Main.Model.full, coords.x, coords.y, coords.z, true, true, false)
            SetEntityCollision(AttachedProp, false, true)
            AttachEntityToEntity(AttachedProp, ped, GetPedBoneIndex(ped, prop.Main.BoneID), 
            prop.Main.Offset.x, prop.Main.Offset.y, prop.Main.Offset.z, 
            prop.Main.Rot.x, prop.Main.Rot.y, prop.Main.Rot.z, false, false, false, true, 2, true)
        end
    else
        AttachedProp = CreateProp(prop.Main.Model, coords.x, coords.y, coords.z, true, true, false)
        SetEntityCollision(AttachedProp, false, true)
        AttachEntityToEntity(AttachedProp, ped, GetPedBoneIndex(ped, prop.Main.BoneID), 
        prop.Main.Offset.x, prop.Main.Offset.y, prop.Main.Offset.z, 
        prop.Main.Rot.x, prop.Main.Rot.y, prop.Main.Rot.z, false, false, false, true, 2, true)
    end
    
    if prop.Second then
        AttachedPropNo2 = CreateProp(prop.Second.Model, coords.x, coords.y, coords.z, true, true, false)
        SetEntityCollision(AttachedPropNo2, false, true)
        AttachEntityToEntity(AttachedPropNo2, ped, GetPedBoneIndex(ped, prop.Second.BoneID), 
        prop.Second.Offset.x, prop.Second.Offset.y, prop.Second.Offset.z, 
        prop.Second.Rot.x, prop.Second.Rot.y, prop.Second.Rot.z, false, false, false, true, 2, true)
    end
end

function ConsumeItem(name)
    if PerformingAction then return end
    PerformingAction = "consume"
    local cfg = Config.Items[name]
    local anim = cfg.animation
    local ped = PlayerPedId()
    
    DebugPrint("^3[dude_consumables] Starting consumption of: " .. name .. "^0")
    
    CreateThread(function()
        local timeLeft = anim.time
        
        -- Send UI message to show interaction
        SendNUIMessage({
            type = "holdInteract",
            bool = true
        })
        DebugPrint("^3[dude_consumables] Sent holdInteract NUI message^0")
        
        while PerformingAction == "consume" and timeLeft > 0 do
            if anim.time - timeLeft > 100 and not IsEntityPlayingAnim(ped, anim.dict, anim.anim, 13) then
                timeLeft = timeLeft - 100
                
                -- Use upper body only animation flags
                PlayAnim(ped, anim.dict, anim.anim, 
                    anim.params[1] or 1.0,  -- Speed
                    anim.params[2] or -1.0, -- Duration
                    anim.params[3] or -1,   -- Last frame
                    48,                     -- Flag 48 = upper body only + don't interrupt
                    anim.params[5] or 0,    -- Priority
                    anim.params[6],         -- Additional params
                    anim.params[7], 
                    anim.params[8])
                
                Wait(100)
            else
                timeLeft = timeLeft - 10
                Wait(10)
            end
            
            -- Disable the Y key during consumption to prevent options menu from appearing
            DisableControlAction(0, 246, true)
        end
        
        -- Send UI message to hide interaction
        SendNUIMessage({
            type = "holdInteract",
            bool = false
        })
        DebugPrint("^3[dude_consumables] Sent holdInteract false NUI message^0")
        
        if timeLeft > 0 and anim.time - timeLeft <= 100 then
            PerformingAction = nil
        elseif timeLeft <= 0 then
            lib.callback("dude_consumables:useItem", "", function(result, uses)
                DebugPrint("^3[dude_consumables] Use item callback result: " .. tostring(result) .. ", uses: " .. tostring(uses) .. "^0")
                
                if not result then
                    PerformingAction = nil
                    return
                end
                
                if Config.Effects[cfg.effect?.name or ""] then
                    CreateThread(function()
                        if ProcessingEffect and not Config.Effects[cfg.effect.name].canOverlap then return end
                        ProcessingEffect = true
                        Config.Effects[cfg.effect.name].process(cfg.effect)
                        ProcessingEffect = false
                    end)
                end

                -- Handle nil uses case (protect against errors)
                if uses == nil then uses = 0 end
                ItemData.uses = uses
                
                -- For glasses, check if it's now empty
                if Config.Glasses[name] then
                    if uses <= 0 then
                        -- Update the prop to show empty glass
                        RemoveAttachedProp()
                        local coords = GetEntityCoords(PlayerPedId())
                        AttachedProp = CreateProp(cfg.prop.Main.Model.null, coords.x, coords.y, coords.z, true, true, false)
                        SetEntityCollision(AttachedProp, false, true)
                        AttachEntityToEntity(AttachedProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), cfg.prop.Main.BoneID), 
                        cfg.prop.Main.Offset.x, cfg.prop.Main.Offset.y, cfg.prop.Main.Offset.z, 
                        cfg.prop.Main.Rot.x, cfg.prop.Main.Rot.y, cfg.prop.Main.Rot.z, false, false, false, true, 2, true)
                    end
                    
                    -- Always update the UI for glasses
                    SendNUIMessage({
                        type = "displayApp",
                        data = { quantity = uses, time = cfg.animation.time }
                    })
                    
                    PerformingAction = nil
                    return
                end
                
                -- For regular items
                if uses < 1 then
                    return RemoveItem()
                end
                
                SendNUIMessage({
                    type = "displayApp",
                    data = { quantity = uses, time = cfg.animation.time }
                })
                DebugPrint("^3[dude_consumables] Sent displayApp NUI message with uses: " .. uses .. "^0")
                
                PerformingAction = nil
            end)
        else
            PerformingAction = nil
        end
    end)
end

function RemoveItem()
    local ped = PlayerPedId()
    SendNUIMessage({
        type = "hideApp",
    })
    RemoveAttachedProp()
    EquippedItem = nil
    ItemData = nil
    
    -- Clear only upper body animations (48 flag)
    if IsEntityPlayingAnim(ped, "anim@djs@food@chips", "djs_food_chips_idle", 3) then
        StopAnimTask(ped, "anim@djs@food@chips", "djs_food_chips_idle", 1.0)
    end
    
    if IsEntityPlayingAnim(ped, "amb@code_human_wander_drinking@male@base", "static", 3) then
        StopAnimTask(ped, "amb@code_human_wander_drinking@male@base", "static", 1.0)
    end
	
	if IsEntityPlayingAnim(ped, "anim@eat@fork", "fork_clip", 3) then
        StopAnimTask(ped, "anim@eat@fork", "fork_clip", 1.0)
    end
    
    -- Note: We don't clear alcohol effects here since they should persist
    -- even after the item is put away
    
    PerformingAction = nil
end

function ItemThread(name, metadata)
    if EquippedItem then return end
    EquippedItem = name
    ItemData = metadata
    AttachProp(name)
    local cfg = Config.Items[name]
    SendNUIMessage({
        type = "displayApp",
        data = { quantity = ItemData.uses, time = cfg.animation.time }
    })
    DebugPrint("^3[dude_consumables] Sent initial displayApp NUI message with uses: " .. ItemData.uses .. "^0")
    
    -- Play the idle animation once at the beginning
    local idleAnimPlayed = false
    
    CreateThread(function()
        local pressTime = 0
        local holding = false
        
        -- Start the idle animation once if it exists
        if cfg.idle then
            local anim = cfg.idle
            PlayAnim(PlayerPedId(), anim.dict, anim.anim, 
                anim.params[1] or 1.0,  -- Speed
                anim.params[2] or -1.0, -- Duration (set to -1 for looping)
                anim.params[3] or -1,   -- Last frame
                50,                     -- Flag 50 = upper body only + loop + don't interrupt
                anim.params[5] or 0,    -- Priority
                anim.params[6],         -- Additional params
                anim.params[7], 
                anim.params[8])
            idleAnimPlayed = true
        end
        
        while EquippedItem == name do
            local ped = PlayerPedId()
            
            -- R key to put away item
            if IsControlJustPressed(1, 45) then
                TriggerServerEvent("dude_consumables:returnItem")
                RemoveItem()
                break
            -- E key to consume the item
            elseif IsControlPressed(1, 191) or IsControlPressed(1, 51) then
                if not PerformingAction then
                    -- Stop the idle animation before consuming
                    if cfg.idle and idleAnimPlayed then
                        StopAnimTask(ped, cfg.idle.dict, cfg.idle.anim, 1.0)
                        idleAnimPlayed = false
                    end
                    ConsumeItem(name)
                end
            -- Y key for options menu
            elseif IsControlJustPressed(1, 246) then
                if not PerformingAction then
                    OptionsMenu()
                end
            elseif PerformingAction then
                PerformingAction = nil
            end
            
            -- Only restart the idle animation if it's not already playing and we're not performing an action
            if cfg.idle and not idleAnimPlayed and not PerformingAction then
                local anim = cfg.idle
                PlayAnim(ped, anim.dict, anim.anim, 
                    anim.params[1] or 1.0,  -- Speed
                    anim.params[2] or -1.0, -- Duration (set to -1 for looping)
                    anim.params[3] or -1,   -- Last frame
                    50,                     -- Flag 50 = upper body only + loop + don't interrupt
                    anim.params[5] or 0,    -- Priority
                    anim.params[6],         -- Additional params
                    anim.params[7], 
                    anim.params[8])
                idleAnimPlayed = true
            end
            
            if GetEntityHealth(ped) < 1 then 
                local coords = GetEntityCoords(AttachedProp)
                local _, zCoords = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z)
                RemoveItem()
                TriggerServerEvent("dude_consumables:drop:createDrop", vector3(coords.x, coords.y, zCoords + 1.0))
            end
            if insideMenu then 
                DisableControls({1, 2, 24, 69, 70, 92, 114, 140, 141, 142, 257, 263, 264})
            else
                DisableControls({24, 69, 70, 92, 114, 140, 141, 142, 257, 263, 264})
            end
            Wait(0)
        end
    end)
end

RegisterNetEvent("dude_consumables:equipItem", function(name, metadata)
    if not Config.Items[name] then return DebugPrint("^1ERROR: This item is not configured.^0") end
    if EquippedItem then return ShowNotification(locale("item_active")) end
    ItemThread(name, metadata)
end)

RegisterNetEvent("dude_consumables:removeItem", function()
    RemoveItem()
end)

AddEventHandler("onResourceStop", function(name)
    if name ~= GetCurrentResourceName() then return end
    TransitionFromBlurred(0)
    RemoveAttachedProp()
end)

-- Debug event
RegisterNetEvent("dude_consumables:debug", function(message)
    DebugPrint("^3[dude_consumables] " .. message .. "^0")
end)