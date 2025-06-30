function CreateBlip(data)
    local x,y,z = table.unpack(data.coords)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, data.id or 1)
    SetBlipDisplay(blip, data.display or 4)
    SetBlipScale(blip, data.scale or 1.0)
    SetBlipColour(blip, data.color or 1)
    if (data.rotation) then 
        SetBlipRotation(blip, math.ceil(data.rotation))
    end
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.label)
    EndTextCommandSetBlipName(blip)
    return blip
end

function CreateVeh(modelHash, ...)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    local veh = CreateVehicle(modelHash, ...)
    SetModelAsNoLongerNeeded(modelHash)
    if Config.GiveKeys then 
        Config.GiveKeys(veh)
    end
    return veh
end

function CreateNPC(modelHash, ...)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    local ped = CreatePed(26, modelHash, ...)
    SetModelAsNoLongerNeeded(modelHash)
    return ped
end

function CreateProp(modelHash, x, y, z, isNetwork, isScriptHostObj, dynamic)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    
    -- Default parameters if not provided
    isNetwork = isNetwork ~= false  -- Default to true for network sync
    isScriptHostObj = isScriptHostObj ~= false  -- Default to true for script host objects
    dynamic = dynamic == true  -- Default to false for dynamic
    
    local obj = CreateObject(modelHash, x, y, z, isNetwork, isScriptHostObj, dynamic)
    
    -- Apply essential persistence flags
    SetEntityAsMissionEntity(obj, true, true)
    SetEntityDynamic(obj, false)
    
    -- Release the model
    SetModelAsNoLongerNeeded(modelHash)
    
    return obj
end

function PlayAnim(ped, dict, ...)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    
    local args = {...}
    local anim = args[1]
    local blendInSpeed = args[2] or 8.0
    local blendOutSpeed = args[3] or -8.0
    local duration = args[4] or -1
    local flag = args[5] or 0
    local playbackRate = args[6] or 1.0
    local lockX = args[7] or false
    local lockY = args[8] or false
    local lockZ = args[9] or false
    
    -- For looping idle animations, use flag 50 (upper body + loop + don't interrupt)
    -- For eating animations, use flag 48 (upper body + don't interrupt)
    TaskPlayAnim(ped, dict, anim, blendInSpeed, blendOutSpeed, duration, flag, playbackRate, lockX, lockY, lockZ)
    
    -- Debug output
    DebugPrint("^3[dude_consumables] Playing animation: " .. dict .. " - " .. anim .. " with flag: " .. flag .. "^0")
end

function PlayEffect(dict, particleName, entity, off, rot, scale, networked)
    RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(0)
    end
    UseParticleFxAssetNextCall(dict)
    local off = off or vector3(0.0, 0.0, 0.0)
    local rot = rot or vector3(0.0, 0.0, 0.0)
    local handle = StartParticleFxLoopedOnEntity(particleName, entity, off.x, off.y, off.z, rot.x, rot.y, rot.z, scale or 1.0)
    if networked then 
        TriggerServerEvent("pickle_consumables:startEffect", ObjToNet(entity), dict, particleName, off, rot, scale)
    end
    return handle
end

function GetClosestVehicleDoor(vehicle, coords)
    local coords = coords or GetEntityCoords(PlayerPedId())
    local bones = {
        "door_dside_f",
        "door_dside_r",
        "door_pside_f",
        "door_pside_r",
        "bonnet",
        "boot"
    }
    local doors = {
        0,
        2,
        1,
        3,
        4,
        5
    }
    local closest
    for i=1, #bones do 
        local boneID = GetEntityBoneIndexByName(vehicle, bones[i])
        if boneID ~= -1 then
            local vcoords = GetWorldPositionOfEntityBone(vehicle, boneID)
            local dist = #(coords - vcoords) 
            if (not closest or closest.dist > dist) and dist < 3.0 then
                closest = {door = doors[i], coords = vcoords, dist = dist}
            end
        end
    end
    if closest then 
        return closest.door, closest.dist
    end
end

function GetNearestEntity(pool, coords, radius, model) 
    local coords = coords or GetEntityCoords(PlayerPedId())
    local radius = radius or 3.0
    local pool = GetGamePool(pool)
    local closest
    for i=1, #pool do 
        local vcoords = GetEntityCoords(pool[i]) 
        local dist = #(coords - vcoords) 
        if (not closest or closest.dist > dist) and (not model or GetEntityModel(pool[i]) == model) then
            closest = {entity = pool[i], dist = dist}
        end
    end
    if closest then 
        return closest.entity, closest.dist
    end
end

function GetNearestVehicle(coords, radius) 
    return GetNearestEntity('CVehicle', coords, radius)
end

function GetNearestEntityModel(model, coords, radius) 
    local entity = GetNearestEntity('CVehicle', coords, radius, model)
    if entity then return entity end
    local entity = GetNearestEntity('CPed', coords, radius, model)
    if entity then return entity end
    local entity = GetNearestEntity('CObject', coords, radius, model)
    if entity then return entity end
end

function GetClosestPlayer(coords, radius)
    local coords = coords or GetEntityCoords(PlayerPedId())
    local radius = radius or 3.0
    local players = GetPlayersInArea(coords, radius)
    local closest
    for i=1, #players do 
        local pcoords = GetEntityCoords(GetPlayerPed(players[i])) 
        local dist = #(coords - pcoords) 
        if not closest or closest.dist > dist then 
            closest = {id = GetPlayerServerId(players[i]), dist = dist}
        end
    end
    if closest then 
        return closest.id, closest.dist
    end
end

local interactTick = 0
local interactCheck = false
local interactText = nil

function ShowInteractText(text)
    local timer = GetGameTimer()
    interactTick = timer
    if interactText == nil or interactText ~= text then 
        interactText = text
        lib.showTextUI(text)
    end
    if interactCheck then return end
    interactCheck = true
    CreateThread(function()
        Wait(150)
        local timer = GetGameTimer()
        interactCheck = false
        if timer ~= interactTick then 
            lib.hideTextUI()
            interactText = nil
            interactTick = 0
        end
    end)
end

local Interactions = {}
EnableInteraction = true

function FormatOptions(index, data) -- 'data' here is the one from CreateInteraction, containing data.dropID
    local options = data.options -- These are predefined sub-options, usually not used for simple pickup.
    local list = {}
    local itemName = data.itemName or "Item"

    -- This is the path taken for the "Pickup" option since data.options is usually nil/empty for it
    if not options or #options == 0 then -- Changed from < 2 to == 0, or check if nil
        list[1] = {
            label = data.label or "Interact", -- Use data.label (e.g., "Pickup Item")
            icon = data.icon or 'fas fa-hand-rock', -- Example default icon
            -- Other ox_target option parameters can go here
        }
        list[1].name = GetCurrentResourceName() .. "_option_pickup_" .. (data.dropID or math.random(1,999999999)) -- More descriptive name

        -- CRITICAL: Attach the original 'data' (which contains dropID) to the option object itself.
        -- ox_target typically passes the option object back in its onSelect callback.
        list[1].interactionData = data -- Store the whole 'data' object here. Let's name it something unique.

        list[1].onSelect = function(oxCallbackData)
            -- oxCallbackData is what ox_target passes.
            -- oxCallbackData *should be* the option object itself (list[1] in this case).
            -- So, oxCallbackData.interactionData should be our original 'data'.
            SelectInteraction(index, 1, oxCallbackData) -- Pass the whole oxCallbackData
        end

        -- Check if this is a glass and add pour option
        if data.isglass and data.dropID then -- Ensure dropID exists for pouring context
            DebugPrint("^2[dude_consumables] Adding pour option for glass item with dropID: " .. (data.dropID) .. "^0")
            list[#list+1] = {
                label = 'Pour Drink',
                icon = 'fas fa-wine-bottle', -- Example icon
                name = GetCurrentResourceName() .. "_option_pour_" .. data.dropID,
                interactionData = data, -- Pass the original data here too
                onSelect = function(oxCallbackData)
                    -- PourADrink will expect the 'data' object containing 'dropID'
                    if oxCallbackData and oxCallbackData.interactionData then
                        PourADrink(oxCallbackData.interactionData)
                    else
                        DebugPrint("^1[FormatOptions] Pour option: interactionData missing from oxCallbackData^0")
                    end
                end
            }
        end
        return list
    end

    -- This loop is for cases where 'data.options' is an array of multiple interaction choices
    -- This is likely NOT the path for your simple "Pickup" interaction.
    for i=1, #options do
        list[i] = options[i] -- Assumes options[i] is already a well-formed option table
        if not list[i].name then
            list[i].name = GetCurrentResourceName() .. "_option_multi_" .. i .. "_" .. (data.dropID or math.random(1,999999999))
        end
        list[i].interactionData = data -- Attach original 'data' to each sub-option too
        local originalOnSelect = list[i].onSelect -- If the sub-option already has an onSelect
        list[i].onSelect = function(oxCallbackData)
            if originalOnSelect then
                originalOnSelect(oxCallbackData) -- Call original if it exists
            else
                SelectInteraction(index, i, oxCallbackData) -- Pass the whole oxCallbackData
            end
        end
    end

    -- Add pour option for glasses if it's a multi-option scenario (less common for simple drops)
    if data.isglass and data.dropID then
        -- (Similar pour option logic as above, ensure it doesn't conflict if already added)
        local pourOptionExists = false
        for _, opt in ipairs(list) do
            if opt.name and string.find(opt.name, "_option_pour_") then
                pourOptionExists = true
                break
            end
        end
        if not pourOptionExists then
            table.insert(list, {
                label = 'Pour Drink',
                icon = 'fas fa-wine-bottle',
                name = GetCurrentResourceName() .. "_option_pour_" .. data.dropID,
                interactionData = data,
                onSelect = function(oxCallbackData)
                    if oxCallbackData and oxCallbackData.interactionData then
                        PourADrink(oxCallbackData.interactionData)
                    end
                end
            })
        end
    end

    return list
end

function EnsureInteractionModel(index)
    local data = Interactions[index] 
    if not data or data.entity then return end
    local entity
    if not data.model and not data.hiddenKeypress and Config.UseTarget and Config.NoModelTargeting then 
        entity = CreateProp(`ng_proc_brick_01a`, data.coords.x, data.coords.y, data.coords.z, false, true, false)
        SetEntityAlpha(entity, 0, false)
    elseif data.model and (not data.model.modelType or data.model.modelType == "ped") then
        local offset = data.model.offset or vector3(0.0, 0.0, 0.0)
        entity = CreateNPC(data.model.hash, data.coords.x + offset.x, data.coords.y + offset.y, (data.coords.z - 1.0) + offset.z, data.heading, false, true)
        SetEntityInvincible(entity, true)
        SetBlockingOfNonTemporaryEvents(entity, true)
    elseif data.model and data.model.modelType == "prop" then
        local offset = data.model.offset or vector3(0.0, 0.0, 0.0)
        entity = CreateProp(data.model.hash, data.coords.x + offset.x, data.coords.y + offset.y, (data.coords.z - 1.0) + offset.z, false, true, false)
    else
        return
    end
    FreezeEntityPosition(entity, true)
    SetEntityHeading(entity, data.heading)
    Interactions[index].entity = entity
    return entity
end

function DeleteInteractionEntity(index)
    local data = Interactions[index] 
    if not data or not data.entity then return end
    DeleteEntity(data.entity)
    Interactions[index].entity = nil
end

function SelectInteraction(index, selection, oxCallbackData) -- oxCallbackData is what ox_target passes for the selected option
    if not EnableInteraction then return end
    local pcoords = GetEntityCoords(PlayerPedId())
    local interactionDetails = Interactions[index]
    if not interactionDetails then DebugPrint("SelectInteraction: Interaction index " .. index .. " not found!"); return end

    if not interactionDetails.target and #(interactionDetails.coords - pcoords) > Config.InteractDistance then
        return ShowNotification(locale("interact_far"))
    end

    -- interactionDetails.selected is the callback function from modules/options/client.lua
    -- It expects (selectedOptionData, interactionTargetDataFromOx)
    -- We pass 'selection' (the choice index, e.g., 1) and the 'oxCallbackData'
    -- The callback in options/client will then look inside oxCallbackData.interactionData.dropID
    interactionDetails.selected(selection, oxCallbackData)
end

function CreateInteraction(data, selected)
    local index
    repeat
        index = math.random(1, 999999999)
    until not Interactions[index]
    local options = FormatOptions(index, data)
    Interactions[index] = {
        selected = selected,
        options = options,
        label = data.label,
        model = data.model,
        coords = data.coords,
        target = data.target,
        offset = data.offset,
        radius = data.radius or 1.5, -- Increased from default 1.0
        heading = data.heading,
        isglass = data.isglass,
        hiddenKeypress = data.hiddenKeypress,
        itemName = data.itemName -- Store item name for display
    }

    if Config.UseTarget then
        if data.target then
            AddTargetModel(data.target, Interactions[index].radius, Interactions[index].options)
        else
            -- Only use the model for target if one is provided
            if data.model then
                Interactions[index].zone = AddTargetZone(Interactions[index].coords, Interactions[index].radius, Interactions[index].options)
            else
                -- For drops without a model, just create a zone at the coordinates
                Interactions[index].zone = AddTargetZone(Interactions[index].coords, Interactions[index].radius, Interactions[index].options)
            end
        end
    end
    return index
end

RegisterNetEvent("pickle_consumables:drop:updatedrop", function(dropID, data)
    UpdateInteraction(dropID, data)
end)

function UpdateInteraction(index, data, selected)

    DebugPrint(Interactions[index])
    if not Interactions[index] then return end 
    --Interactions[index].selected = selected
    for k,v in pairs(data) do 
        Interactions[index][k] = v
    end
    if data.options then 
        Interactions[index].options = FormatOptions(index, data)
    end


    DeleteEntity(Interactions[index].entity)
    PlaceProp(data.model, function(coords)
    end)



    if Config.UseTarget then
        if Interactions[index].target then 
            RemoveTargetZone(Interactions[index].zone)
            Interactions[index].zone = AddTargetZone(Interactions[index].coords, Interactions[index].radius, Interactions[index].options)
        else
            RemoveTargetModel(Interactions[index].target, Interactions[index].options)
            AddTargetModel(Interactions[index].target, Interactions[index].radius, Interactions[index].options)
        end
    end
end

function DeleteInteraction(index)
    local data = Interactions[index] 
    if not data then return end
    if (data.entity) then 
        DeleteInteractionEntity(index)
    end
    if Config.UseTarget then
        if data.target then 
            RemoveTargetModel(data.target, data.options)
        else
            RemoveTargetZone(data.zone)
        end
    end
    Interactions[index] = nil
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    for k,v in pairs(Interactions) do 
        DeleteInteraction(k)
    end
end)

function _L(name, ...)
    if name then 
        local str = Language[Config.Language][name]
        if str then 
            return string.format(str, ...)
        else    
            return "ERR_TRANSLATE_"..(name).."_404"
        end
    else
        return "ERR_TRANSLATE_404"
    end
end

-- function DebugPrint(...)
    -- if Config.Debug then
        -- DebugPrint("[DEBUG]", ...)
    -- end
-- end