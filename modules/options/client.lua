function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

insideMenu = nil
local Throwables = {}
local Drops = {} -- Stores data about props dropped in the world { model, coords, heading, itemKey, uses, propEntity, netID, isglass, itemLabel, etc. }
local DropInteracts = {} -- Stores ox_target interaction IDs { [dropID] = interactionIndex }
local PlacingProp

CreateThread(function() -- This might be redundant if Config.Items is populated by normal_items/glasses.lua already
    Wait(1000)
    for k,v in pairs(Config.Normal_Items) do
        Config.Items[k] = v
    end
    for k,v in pairs(Config.Glasses) do
        Config.Items[k] = v
    end
end)

function OptionsMenu()
    if insideMenu then return end
    insideMenu = true
    local options = {
        {
            title = locale("give_item"),
            description = locale("give_item_desc"),
            onSelect = function()
                insideMenu = nil
                local players = GetPlayersInArea()
                local players_list = {}
                for i=1, #players do
                    local id = GetPlayerServerId(players[i])
                    players_list[#players_list + 1] = {label = locale("give_dialog_player", GetPlayerName(players[i]), id), value = id}
                end
                if #players_list < 1 then return ShowNotification(locale("nobody_near")) end
                local input = lib.inputDialog(locale("give_item"), {
                    {type = 'select', label = locale("give_dialog_player_title"), default = players_list[1].value, required = true, options = players_list},
                    {type = 'slider', label = locale("give_dialog_portion"), default = 1, required = true, min = 1, max = ItemData.uses },
                })
                if not input then return end
                local target = input[1]
                local amount = input[2]
                TriggerServerEvent("dude_consumables:giveItem", target, amount)
            end
        },
       {
            title = locale("place_item"),
            description = locale("place_item_desc"),
            onSelect = function()
                insideMenu = nil
                local itemKey = EquippedItem
                if not Config.Items[itemKey] then
                    DebugPrint("^1[dude_consumables] OptionsMenu: Item not configured: " .. itemKey .. "^0")
                    return
                end

                local modelHash
                if Config.Glasses[itemKey] then
                    modelHash = ItemData.uses < 1 and Config.Items[itemKey].prop.Main.Model.null or Config.Items[itemKey].prop.Main.Model.full
                else
                    modelHash = Config.Items[itemKey].prop.Main.Model
                end

                local currentItemData = deepcopy(ItemData) -- Get a copy of item data before removing it

                RemoveItem() -- Remove the item from player's hand

                PlaceProp(modelHash, function(coords, heading)
                    if coords and heading then
                        -- Create the drop on the server with the exact coordinates and heading
                        TriggerServerEvent("dude_consumables:drop:createDrop", coords, {
                            itemKey = currentItemData.itemKey,
                            uses = currentItemData.uses,
                            metadata = currentItemData.metadata, -- Original metadata
                            isglass = currentItemData.isglass,
                            model = modelHash, -- Send the determined model hash
                            heading = heading
                        })
                    else
                        -- If placement failed, give the item back
                        -- The server needs to know original item slot etc if AddItem needs it for exact placement.
                        -- For simplicity, just adding it back.
                        DebugPrint("^1[dude_consumables] Placement canceled, returning item to inventory.^0")
                        TriggerServerEvent("dude_consumables:returnCanceledItem", currentItemData.itemKey, currentItemData.uses, currentItemData)
                    end
                end)
            end
        },
        {
            title = locale("cancel_action"),
            description = locale("cancel_action_desc"),
            onSelect = function()
                insideMenu = nil
            end
        },
    }

    if #options < 1 or not EquippedItem then
        insideMenu = nil
        return
    end

    lib.registerContext({
        id = 'dude_consumables_options',
        title = locale("pickle_consumables_options"),
        options = options,
        onExit = function()
            insideMenu = nil
        end
    })
    lib.showContext('dude_consumables_options')
end

-- Throwing (keeping as is, not directly related to the ghost prop issue of placed items)
function GetDirectionFromRotation(rotation)
    local dm = (math.pi / 180)
    return vector3(-math.sin(dm * rotation.z) * math.abs(math.cos(dm * rotation.x)), math.cos(dm * rotation.z) * math.abs(math.cos(dm * rotation.x)), math.sin(dm * rotation.x))
end

function PerformPhysics(entity, action)
    local power = 1.0 * Config.Options.throwing.power
    FreezeEntityPosition(entity, false)
    local rot = GetGameplayCamRot(2)
    local dir = GetDirectionFromRotation(rot)
    SetEntityHeading(entity, rot.z + 90.0)
    if not action or action == "throw" then
        SetEntityVelocity(entity, dir.x * power, dir.y * power, dir.z * power)
    else
        SetEntityVelocity(entity, dir.x * power, dir.y * power, (dir.z * 1.75) * power)
    end
end

function CreateThrowable(model, attach)
    local ped = PlayerPedId()
    local heading = GetEntityHeading(ped)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0.5)
    local prop = CreateProp(model, coords.x, coords.y, coords.z, true, true, true)
    if not prop then return end
    if attach then
        local off, rot = vector3(0.05, 0.0, -0.085), vector3(90.0, 90.0, 0.0)
        AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 28422), off.x, off.y, off.z, rot.x, rot.y, rot.z, false, false, false, true, 2, true)
    else
        local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, -0.9)
        SetEntityCoords(prop, coords.x, coords.y, coords.z)
    end
    return prop
end

RegisterNetEvent("dude_consumables:throwing:setObjectData", function(throwID, data)
    Throwables[throwID] = data
end)

-- Drops
function GetDirectionCoords()
    local range = 100.0 -- Reduced range for more practical placement
	local camCoords = GetGameplayCamCoord()
    local rot = GetGameplayCamRot(2)
    local dir = GetDirectionFromRotation(rot)
	local targetCoords = vector3(camCoords.x + dir.x * range, camCoords.y + dir.y * range, camCoords.z + dir.z * range)
    local rayHandle = StartShapeTestRay(camCoords.x, camCoords.y, camCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, -1, PlayerPedId(), 0)
    local _, hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
	return hit, endCoords, entityHit
end

function PlaceProp(modelHash, cb)
    if PlacingProp then
        if cb then cb(nil, nil) end
        return
    end
    if not cb then return end

    PlacingProp = true
    local playerPed = PlayerPedId()
    local startCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.5, 0.0) -- Start slightly in front
    local currentHeading = GetEntityHeading(playerPed)

    RequestModel(modelHash)
    CreateThread(function() -- Separate thread for model loading
        while not HasModelLoaded(modelHash) do Wait(0) end

        local previewProp = CreateObjectNoOffset(modelHash, startCoords.x, startCoords.y, startCoords.z, false, false, false)
        SetEntityCollision(previewProp, false, false)
        SetEntityAlpha(previewProp, 150, false)
        FreezeEntityPosition(previewProp, true)

        local placementValid = false

        CreateThread(function()
            while PlacingProp do
                local textToShow = locale("interact_place")
                local hit, hitCoords, entityHit = GetDirectionCoords()

                if hit and hitCoords then
                    -- Check distance from player to prevent placing too far
                    if #(GetEntityCoords(playerPed) - hitCoords) < 10.0 then
                        SetEntityCoords(previewProp, hitCoords.x, hitCoords.y, hitCoords.z + 0.01) -- Slight Z offset
                        currentHeading = GetGameplayCamRot(2).z -- Use camera heading for the prop
                        SetEntityRotation(previewProp, 0.0, 0.0, currentHeading, 2, true)
                        placementValid = true
                        textToShow = textToShow .. " (~g~Valid~s~)"
                    else
                        placementValid = false
                        textToShow = textToShow .. " (~r~Too Far~s~)"
                    end
                else
                    placementValid = false
                    textToShow = textToShow .. " (~r~Invalid~s~)"
                    -- Keep preview prop near player if no valid hit
                    local playerForward = GetEntityForwardVector(playerPed)
                    local previewFallbackCoords = GetEntityCoords(playerPed) + playerForward * 1.5
                    SetEntityCoords(previewProp, previewFallbackCoords.x, previewFallbackCoords.y, previewFallbackCoords.z)
                end

                ShowInteractText(textToShow)

                if IsControlJustPressed(1, 51) then -- E key
                    if placementValid then
                        PlacingProp = false
                        local finalCoords = GetEntityCoords(previewProp)
                        local finalHeading = GetEntityHeading(previewProp)
                        DeleteEntity(previewProp)
                        SetModelAsNoLongerNeeded(modelHash)
                        lib.hideTextUI()
                        cb(finalCoords, finalHeading)
                        return
                    else
                        ShowNotification("~r~Cannot place item here.")
                    end
                end
                if IsControlJustPressed(1, 177) or IsControlJustPressed(1,322) then -- Backspace or ESC
                    PlacingProp = false
                    DeleteEntity(previewProp)
                    SetModelAsNoLongerNeeded(modelHash)
                    lib.hideTextUI()
                    cb(nil, nil) -- Placement cancelled
                    return
                end
                Wait(0)
            end
            -- Failsafe if loop exits unexpectedly
            if DoesEntityExist(previewProp) then DeleteEntity(previewProp) end
            SetModelAsNoLongerNeeded(modelHash)
            lib.hideTextUI()
            if PlacingProp then cb(nil,nil) end -- If it was somehow still true
            PlacingProp = false
        end)
    end)
end

-- Client-side function to create the visual prop and ox_target interaction
function CreateDropPropAndInteraction(dropID, dataFromServer)
    if not dataFromServer or not dataFromServer.model or not dataFromServer.coords then
        DebugPrint("^1[CreateDropPropAndInteraction] Invalid data for dropID: " .. dropID .. "^0")
        return
    end

    DebugPrint("^3[CreateDropPropAndInteraction] Processing addDrop for ID: " .. dropID .. ", Model: " .. dataFromServer.model .. ", Placer: " .. dataFromServer.placerClient .. "^0")

    -- Clean up existing visual prop and interaction for this dropID if it's a refresh or local re-creation
    if Drops[dropID] then
        if Drops[dropID].propEntity and DoesEntityExist(Drops[dropID].propEntity) then
            DebugPrint("^3[CreateDropPropAndInteraction] Deleting old propEntity for refresh/recreate: " .. dropID .. ", Entity: " .. Drops[dropID].propEntity .. "^0")
            SetEntityAsMissionEntity(Drops[dropID].propEntity, true, true)
            DeleteEntity(Drops[dropID].propEntity)
        end
        -- Ensure old interaction is gone BEFORE creating a new one for the same dropID
        if DropInteracts[dropID] then
            DebugPrint("^3[CreateDropPropAndInteraction] Deleting old interaction for refresh/recreate: " .. dropID .. ", Index: " .. DropInteracts[dropID] .. "^0")
            DeleteInteraction(DropInteracts[dropID])
            DropInteracts[dropID] = nil
        end
    end

    Drops[dropID] = deepcopy(dataFromServer)
    Drops[dropID].propEntity = nil
    -- Drops[dropID].netID will be updated by 'dude_consumables:drop:updateAuthoritativeNetID'

    RequestModel(dataFromServer.model)
    CreateThread(function()
        -- ... (rest of the prop creation, netID sending, and interaction creation logic remains THE SAME as my previous good response)
        -- ... (from `local attempts = 0` down to the end of this function) ...
        local attempts = 0
        while not HasModelLoaded(dataFromServer.model) and attempts < 100 do Wait(100); attempts = attempts + 1 end

        if not HasModelLoaded(dataFromServer.model) then
            DebugPrint("^1[CreateDropPropAndInteraction] Failed to load model " .. dataFromServer.model .. " for dropID " .. dropID .. "^0")
            Drops[dropID] = nil
            return
        end

        local prop = CreateObjectNoOffset(dataFromServer.model, dataFromServer.coords.x, dataFromServer.coords.y, dataFromServer.coords.z, true, false, false)
        SetEntityHeading(prop, dataFromServer.heading or 0.0)
        FreezeEntityPosition(prop, true)
        PlaceObjectOnGroundProperly(prop)
        SetEntityAsMissionEntity(prop, true, true)

        if not Drops[dropID] then -- Check if Drops[dropID] was cleared by another process (e.g. very fast delete)
            DebugPrint("^1[CreateDropPropAndInteraction] Drops["..dropID.."] became nil before propEntity could be set. Aborting prop setup for this instance.^0")
            if DoesEntityExist(prop) then SetEntityAsMissionEntity(prop, true, true); DeleteEntity(prop); end
            SetModelAsNoLongerNeeded(dataFromServer.model)
            return
        end
        Drops[dropID].propEntity = prop

        local localNetIdForThisProp = 0
        local netIdAttempts = 0
        Citizen.CreateThread(function()
            Wait(500)
            while localNetIdForThisProp == 0 and netIdAttempts < 10 do
                if not DoesEntityExist(prop) then break end
                localNetIdForThisProp = NetworkGetNetworkIdFromEntity(prop)
                netIdAttempts = netIdAttempts + 1
                if localNetIdForThisProp ~= 0 then break end
                Wait(200 * netIdAttempts)
            end

            if not Drops[dropID] or not DoesEntityExist(prop) then
                DebugPrint("^1[CreateDropPropAndInteraction] Prop/DropData for " .. dropID .. " (model: " .. dataFromServer.model .. ") became invalid before its netID ("..localNetIdForThisProp..") could be processed fully.^0")
                if DoesEntityExist(prop) then SetEntityAsMissionEntity(prop, true, true); DeleteEntity(prop); end
                return
            end

            if localNetIdForThisProp ~= 0 then
                DebugPrint("^2[CreateDropPropAndInteraction] Client " .. GetPlayerServerId(PlayerId()) .. " created prop for " .. dropID .. " (Model: " .. dataFromServer.model .. ", LocalEntity: " .. prop .. ", LocalNetID: " .. localNetIdForThisProp .. ")^0")
                TriggerServerEvent("dude_consumables:syncDropNetID", dropID, localNetIdForThisProp)
                if GetPlayerServerId(PlayerId()) == dataFromServer.placerClient then
                    DebugPrint("^2[CreateDropPropAndInteraction] This client IS placer (" .. dataFromServer.placerClient .. "). Sent LocalNetID " .. localNetIdForThisProp .. " for " .. dropID .. "^0")
                else
                    DebugPrint("^3[CreateDropPropAndInteraction] This client is NOT placer (" .. dataFromServer.placerClient .. "). Sent its LocalNetID " .. localNetIdForThisProp .. " for " .. dropID .. "^0")
                end
            else
                DebugPrint("^1[CreateDropPropAndInteraction] CRITICAL: Failed to get LocalNetID for prop " .. dropID .. " (Model: " .. dataFromServer.model .. ", Entity: " .. prop .. "). Deleting this client's prop.^0")
                if DoesEntityExist(prop) then SetEntityAsMissionEntity(prop, true, true); DeleteEntity(prop); end
                if Drops[dropID] then Drops[dropID].propEntity = nil end
            end
        end)

        SetModelAsNoLongerNeeded(dataFromServer.model)

        if not Drops[dropID] then -- Final check before interaction
             DebugPrint("^1[CreateDropPropAndInteraction] Drops["..dropID.."] is nil before interaction creation. Aborting.^0")
             return
        end

        local itemLabel = dataFromServer.itemLabel or dataFromServer.itemKey or "Item"
        local isGlass = dataFromServer.isglass or (dataFromServer.itemKey and Config.Glasses[dataFromServer.itemKey] and true or false)

        if DropInteracts[dropID] then DeleteInteraction(DropInteracts[dropID]); DropInteracts[dropID] = nil; end -- Extra safety

        DropInteracts[dropID] = CreateInteraction({
            label = "Pickup " .. itemLabel,
            coords = dataFromServer.coords,
            heading = dataFromServer.heading,
            isglass = isGlass,
            dropID = dropID,
            itemName = itemLabel,
            radius = 1.5
        }, function(selectedOptionIndex, oxCallbackData)
            local idToUse = nil
            if oxCallbackData and oxCallbackData.interactionData and oxCallbackData.interactionData.dropID then
                idToUse = oxCallbackData.interactionData.dropID
            else
                idToUse = dropID
                DebugPrint("^1[ox_target pickup callback] WARNING: dropID missing in oxCallbackData.interactionData. Fallback to closure: " .. idToUse .. ". oxCallData: " .. json.encode(oxCallbackData) .. "^0")
            end
            if idToUse then
                 TriggerServerEvent("dude_consumables:drop:collectDrop", idToUse)
            else
                DebugPrint("^1[CRITICAL ox_target pickup] dropID is nil.^0")
            end
        end)
        DebugPrint("^2[CreateDropPropAndInteraction] Created ox_target interaction for dropID: " .. dropID .. "^0")
    end)
end

RegisterNetEvent("dude_consumables:drop:addDrop", function(dropID, data)
    DebugPrint("^2[dude_consumables] Received addDrop for ID: " .. dropID .. ", Model: " .. (data.model or "N/A") .. "^0")
    CreateDropPropAndInteraction(dropID, data)
end)

-- Handles deletion command from server (for picked up or despawned items)
RegisterNetEvent("dude_consumables:deleteNetworkedEntity", function(netIDToDelete)
    if netIDToDelete == 0 or netIDToDelete == nil then
        DebugPrint("^1[dude_consumables] deleteNetworkedEntity: Received invalid netIDToDelete (0 or nil).^0")
        return
    end

    local entity = NetworkGetEntityFromNetworkId(netIDToDelete)
    local foundDropID = nil
    local isAuthoritativeNetIDForDrop = false -- Flag to check if this netID is the main one for a known drop

    -- Try to find which dropID this netID might be associated with
    for dID, dropData in pairs(Drops) do
        if dropData and dropData.netID and dropData.netID == netIDToDelete then
            foundDropID = dID
            isAuthoritativeNetIDForDrop = true -- This netID is the one stored as primary for this drop
            break
        elseif dropData and dropData.propEntity and DoesEntityExist(dropData.propEntity) and NetworkGetNetworkIdFromEntity(dropData.propEntity) == netIDToDelete then
            -- This case handles if this client created this prop but it wasn't the authoritative one
            foundDropID = dID
            -- isAuthoritativeNetIDForDrop remains false unless dropData.netID also matches netIDToDelete
            if dropData.netID and dropData.netID ~= netIDToDelete then
                 DebugPrint("^3[dude_consumables] deleteNetworkedEntity: Deleting netID " .. netIDToDelete .. " which is a local prop for drop " .. dID .. ", but authoritative netID is " .. dropData.netID .. "^0")
            end
            break
        end
    end

    DebugPrint("^3[dude_consumables] deleteNetworkedEntity:指令删除 NetID: " .. netIDToDelete .. ". 实体句柄: " .. (entity or "nil") .. ". 找到的DropID: " .. (foundDropID or "nil") .. ". 是否为该Drop的权威NetID: " .. tostring(isAuthoritativeNetIDForDrop) .. "^0")

    -- Delete the physical entity if it exists on this client
    if DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, true, true)
        DeleteEntity(entity)
        if DoesEntityExist(entity) then -- Double check
            SetEntityCoords(entity, 0.0, 0.0, -1000.0)
            DeleteEntity(entity)
        end
        DebugPrint("^2[dude_consumables] 客户端成功删除实体 NetID: " .. netIDToDelete .. "^0")
    else
        DebugPrint("^3[dude_consumables] 客户端: NetID " .. netIDToDelete .. " 的实体不存在或已被删除.^0")
    end

    -- Only fully clean up local Drop data (including interaction) if the netID being deleted
    -- was the authoritative/primary netID for that drop that this client was tracking.
    if foundDropID and Drops[foundDropID] then
        if isAuthoritativeNetIDForDrop then
            -- This was the main prop for the drop, so clean up everything associated with this dropID
            if DropInteracts[foundDropID] then
                DeleteInteraction(DropInteracts[foundDropID])
                DropInteracts[foundDropID] = nil
                DebugPrint("^2[dude_consumables] 为DropID删除了ox_target交互: " .. foundDropID .. " (因为权威NetID " ..netIDToDelete.. "被删除)^0")
            end
            Drops[foundDropID] = nil -- Clear local data for this dropID
            DebugPrint("^2[dude_consumables] 清理了DropID的本地数据: " .. foundDropID .. " (与权威NetID " ..netIDToDelete.. "关联)^0")
        else
            -- This netID was likely a redundant prop this client created, but not the main one.
            -- Do NOT delete DropInteracts[foundDropID] or Drops[foundDropID] here,
            -- as those are for the *authoritative* prop which still exists (or will be deleted by its own authoritative netID).
            -- We just need to ensure our local propEntity reference for this redundant prop is cleared if it matched.
            if Drops[foundDropID].propEntity == entity then
                Drops[foundDropID].propEntity = nil
                 DebugPrint("^3[dude_consumables] 清理了对DropID " .. foundDropID .. "的冗余propEntity引用 (因为冗余NetID " ..netIDToDelete.. "被删除)^0")
            end
        end
    elseif netIDToDelete ~= 0 then
        -- No local drop data was associated with this netID at all, or foundDropID was nil.
        DebugPrint("^3[dude_consumables] 没有找到与NetID " .. netIDToDelete .. " 关联的本地Drop数据进行清理.^0")
    end
end)

-- Fallback for server having no netID (should be rare)
RegisterNetEvent("dude_consumables:drop:removeDropFallback", function(dropID)
    DebugPrint("^3[dude_consumables] Fallback removal initiated for dropID: " .. dropID .. "^0")
    if not Drops[dropID] then
        DebugPrint("^1[dude_consumables] Fallback: DropID " .. dropID .. " not found in local Drops table.^0")
        return
    end

    if DropInteracts[dropID] then
        DeleteInteraction(DropInteracts[dropID])
        DropInteracts[dropID] = nil
    end

    if Drops[dropID].propEntity and DoesEntityExist(Drops[dropID].propEntity) then
        SetEntityAsMissionEntity(Drops[dropID].propEntity, true, true)
        DeleteEntity(Drops[dropID].propEntity)
    end
    Drops[dropID] = nil
    DebugPrint("^2[dude_consumables] Fallback: Cleaned up local data for dropID: " .. dropID .. "^0")
end)


-- This function is for local cleanup, typically called when syncing all drops (e.g., on player load)
-- Actual entity deletion should be commanded by the server via netID.
function CleanUpLocalDrop(dropID)
    if Drops[dropID] then
        if Drops[dropID].propEntity and DoesEntityExist(Drops[dropID].propEntity) then
            -- Don't delete here, server manages networked entity deletion
            -- SetEntityAsMissionEntity(Drops[dropID].propEntity, true, true)
            -- DeleteEntity(Drops[dropID].propEntity)
            DebugPrint("^3[dude_consumables] CleanUpLocalDrop: Found propEntity for " .. dropID .. ", but not deleting (server manages deletion).^0")
        end
        if DropInteracts[dropID] then
            DeleteInteraction(DropInteracts[dropID])
            DropInteracts[dropID] = nil
        end
        Drops[dropID] = nil
    end
end

RegisterNetEvent("dude_consumables:drop:syncAllDrops", function(allDrops)
    DebugPrint("^2[dude_consumables] Received syncAllDrops. Current local drops: " .. json.encode(Drops) .. "^0")
    -- Clear all existing local drops first
    for id_to_remove, _ in pairs(Drops) do
        CleanUpLocalDrop(id_to_remove) -- Use the new cleanup function
    end
    Drops = {} -- Reset local drops table
    DropInteracts = {} -- Reset interactions

    DebugPrint("^2[dude_consumables] Cleared local drops. Now adding " .. (#allDrops or 0) .. " drops from server.^0")
    -- Add all drops from the server
    if allDrops and type(allDrops) == 'table' then
        for synced_dropID, synced_dropData in pairs(allDrops) do
            if synced_dropData and synced_dropData.model and synced_dropData.coords then
                DebugPrint("^2[dude_consumables] Syncing drop from server: ID " .. synced_dropID .. ", Model " .. synced_dropData.model .. "^0")
                CreateDropPropAndInteraction(synced_dropID, synced_dropData)
            else
                DebugPrint("^1[dude_consumables] Invalid drop data in syncAllDrops for ID: " .. synced_dropID .. "^0")
            end
        end
        DebugPrint("^2[dude_consumables] Synced " .. tablelength(allDrops) .. " drops from server^0")
    else
        DebugPrint("^1[dude_consumables] syncAllDrops: allDrops was nil or not a table.^0")
    end
end)

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end


IsPouring = false
function PourADrink(data)
	DebugPrint("^2[dude_consumables] PourADrink called with data.dropID: " .. (data and data.dropID or "nil") .. "^0")
    if not data or not data.dropID or not Drops[data.dropID] then
        DebugPrint("^1[dude_consumables] PourADrink: Drop not found or invalid data. DropID: " .. (data and data.dropID or "nil") .. "^0")
        return
    end

    if not EquippedItem then
        return ShowNotification('There is nothing in your hand')
    end

    local glassData = Drops[data.dropID] -- This is the glass on the ground
    local glassConfig = Config.Glasses[glassData.itemKey]
    if not glassConfig then
        DebugPrint("^1[dude_consumables] PourADrink: Not a valid glass type: " .. (glassData.itemKey or "nil") .. "^0")
        return
    end

    if not glassConfig.AllowedItems[EquippedItem] then
        return ShowNotification('I shouldn\'t use this glass for this!')
    end

    if glassData.uses >= glassConfig.MaxDrinks then
        return ShowNotification('The Glass is Full')
    end

    local ped = PlayerPedId()
    PerformingAction = true

    ClearPedTasks(ped)
    RemoveAttachedProp() -- Removes prop from player's hand
    Wait(100)

    -- Create a temporary prop in the left hand for pouring (the bottle/item being poured from)
    local itemBeingPouredFrom = EquippedItem
    local modelToPourFrom
    if Config.Glasses[itemBeingPouredFrom] then -- If pouring from another glass
        modelToPourFrom = ItemData.uses < 1 and Config.Items[itemBeingPouredFrom].prop.Main.Model.null or Config.Items[itemBeingPouredFrom].prop.Main.Model.full
    else -- If pouring from a normal item (bottle)
        modelToPourFrom = Config.Items[itemBeingPouredFrom].prop.Main.Model
    end

    local coords = GetEntityCoords(ped)
    local tempPourProp = CreateProp(modelToPourFrom, coords.x, coords.y, coords.z, true, true, false)
    SetEntityCollision(tempPourProp, false, true)
    AttachEntityToEntity(tempPourProp, ped, GetPedBoneIndex(ped, 60309), -- Left hand bone
        0.09, -0.05, 0.08,
        -123.22, 22.8, 17.7,
        false, false, false, true, 2, true)

    RequestAnimDict(glassConfig.Pour.dict)
    while not HasAnimDictLoaded(glassConfig.Pour.dict) do Wait(10) end

    TaskPlayAnim(ped, glassConfig.Pour.dict, glassConfig.Pour.anim,
        glassConfig.Pour.params[1] or 4.0, glassConfig.Pour.params[2] or 4.0,
        glassConfig.Pour.params[3] or 4000, glassConfig.Pour.params[4] or 16,
        glassConfig.Pour.params[5] or 0,
        false, false, false)

    Wait(glassConfig.Pour.params[3] or 4000)

    DeleteEntity(tempPourProp)
    AttachProp(itemBeingPouredFrom) -- Re-attach original item to player's hand

    lib.callback("dude_consumables:pourItem", false, function(result, usesAfterPouringPlayerItem)
            if result then
                ShowNotification('You poured 1 of your uses into the glass')

                -- Update the player's held item (the bottle) uses
                ItemData.uses = usesAfterPouringPlayerItem
                if ItemData.uses < 1 then
                    if not Config.Glasses[EquippedItem] then -- if it's not a glass (e.g. a bottle), remove it
                        RemoveItem()
                    else -- if it is a glass (e.g. pouring from one glass to another), update its prop to empty
                        AttachProp(EquippedItem) -- Re-attach to update prop based on new (0) uses
                    end
                end
                -- Always update the NUI for the item in hand
                local cfgHandItem = Config.Items[EquippedItem]
                if cfgHandItem and cfgHandItem.animation then
                    SendNUIMessage({ type = "displayApp", data = { quantity = ItemData.uses, time = cfgHandItem.animation.time }})
                end

                -- Prepare data for the ground glass update
                local groundGlassConfig = Config.Glasses[glassData.itemKey] -- glassData from outer scope
                local updatedGroundGlassData = {
                    itemKey = glassData.itemKey,
                    uses = groundGlassConfig.MaxDrinks, -- Fill to MaxDrinks
                    model = groundGlassConfig.prop.Main.Model.full, -- Use the 'full' model
                    isglass = true, -- It's definitely a glass
                    itemLabel = glassData.itemLabel or glassData.itemKey -- Retain label
                    -- other properties like coords, heading, placerClient will be preserved by server
                }

                -- Copy status from the source item (bottle) to the glass
                if Config.Items[EquippedItem] and Config.Items[EquippedItem].status then
                    updatedGroundGlassData.status = deepcopy(Config.Items[EquippedItem].status)
                end

                TriggerServerEvent('dude_consumables:drop:updated', data.dropID, updatedGroundGlassData)
                DebugPrint("^2[PourADrink] Sent update for ground glass " .. data.dropID .. ". New uses: " .. updatedGroundGlassData.uses .. ", New model: " .. updatedGroundGlassData.model .. "^0")

            else
                ShowNotification('Failed to pour drink')
            end

            PerformingAction = nil
            -- Restart idle animation for item in hand if applicable
            local ped = PlayerPedId()
            local cfgPlayerItem = Config.Items[EquippedItem]
            if cfgPlayerItem and cfgPlayerItem.idle and EquippedItem then -- Check EquippedItem again as it might have been removed
                PlayAnim(ped, cfgPlayerItem.idle.dict, cfgPlayerItem.idle.anim,
                    cfgPlayerItem.idle.params[1] or 1.0, cfgPlayerItem.idle.params[2] or -1.0,
                    cfgPlayerItem.idle.params[3] or -1, 50, cfgPlayerItem.idle.params[5] or 0,
                    cfgPlayerItem.idle.params[6], cfgPlayerItem.idle.params[7], cfgPlayerItem.idle.params[8])
            end
        end)
end


-- This event is now handled by deleteNetworkedEntity or removeDropFallback
-- RegisterNetEvent("dude_consumables:drop:removeDrop", function(dropID)
-- RemoveDrop(dropID) -- This should be a simple local cleanup now.
-- end)

RegisterNetEvent("dude_consumables:updateUses", function(uses)
    if not ItemData then return end
    ItemData.uses = uses
    if uses < 1 then
        if Config.Glasses[EquippedItem] then
             AttachProp(EquippedItem) -- Re-attach to show empty glass prop
             SendNUIMessage({ type = "displayApp", data = { quantity = ItemData.uses, time = Config.Items[EquippedItem].animation.time }})
            return
        end
        return RemoveItem()
    end
    local cfg = Config.Items[EquippedItem]
    SendNUIMessage({
        type = "displayApp",
        data = { quantity = uses, time = cfg.animation.time }
    })
end)

-- This is for updating interaction TEXT, not the prop model itself usually.
-- Prop model updates should happen via addDrop (which can refresh the prop)
RegisterNetEvent("dude_consumables:drop:updatedrop", function(dropID, data)
    -- This event in core/client.lua updates the ox_target options.
    -- If the model of the prop itself needs to change (e.g. empty/full glass),
    -- the server should trigger :addDrop again with the new model for clients to recreate.
    if Drops[dropID] and DropInteracts[dropID] then
        local interactionData = {
            label = "Pickup " .. (data.itemLabel or Drops[dropID].itemLabel or data.itemKey or "Item"),
            coords = data.coords or Drops[dropID].coords,
            heading = data.heading or Drops[dropID].heading,
            isglass = data.isglass or Drops[dropID].isglass,
            dropID = dropID,
            radius = 1.5
        }
        -- If the model changed server-side and that info is in 'data',
        -- server should ideally send a full addDrop to recreate the prop with the new model.
        -- This client-side updateInteraction is mostly for the target options.
        UpdateInteraction(DropInteracts[dropID], interactionData)
        DebugPrint("^3[dude_consumables] Updated interaction text for dropID: " .. dropID .. "^0")

        -- If server sends new model info here, we might need to recreate the prop.
        if data.model and Drops[dropID].model ~= data.model then
            DebugPrint("^3[dude_consumables] Model changed for dropID: " .. dropID .. ". Server should ideally send addDrop to refresh fully.^0")
            -- For a quick client-side refresh if server doesn't rebroadcast addDrop:
            -- CleanUpLocalDrop(dropID)
            -- CreateDropPropAndInteraction(dropID, data)
            -- However, this is better handled by server sending a fresh :addDrop
        end

    end
end)

AddEventHandler("onResourceStop", function(name)
    if (GetCurrentResourceName() ~= name) then return end
    for k,v in pairs(Throwables) do
        if v and v.net_id then
            local obj = NetToObj(v.net_id)
            if DoesEntityExist(obj) then DeleteEntity(obj) end
        end
    end
    for id, dropData in pairs(Drops) do
        if dropData and dropData.propEntity and DoesEntityExist(dropData.propEntity) then
            DeleteEntity(dropData.propEntity)
        end
        if DropInteracts[id] then
            DeleteInteraction(DropInteracts[id])
        end
    end
    Drops = {}
    DropInteracts = {}
end)

-- Request all drops when player is fully loaded
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(5000) -- Wait a bit to ensure player is fully loaded and other scripts are ready
    DebugPrint("^2[dude_consumables] Player loaded, requesting all drops from server.^0")
    TriggerServerEvent("dude_consumables:requestAllDrops")
end)

-- These seem like remnants of an old sync system, the new `addDrop` and `deleteNetworkedEntity` should handle it.
-- If these are strictly necessary, they need to be integrated carefully. For now, commenting out to avoid conflict.
-- RegisterNetEvent("dude_consumables:createProp", function(dropID, model, coords, heading)
--     -- This logic is now handled by CreateDropPropAndInteraction via addDrop
-- end)

-- RegisterNetEvent("dude_consumables:deleteProp", function(dropID)
--     -- This logic is now handled by deleteNetworkedEntity
-- end)

RegisterNetEvent("dude_consumables:drop:updateAuthoritativeNetID", function(dropID, authoritativeNetID)
    if Drops[dropID] then
        if Drops[dropID].netID ~= 0 and Drops[dropID].netID ~= authoritativeNetID then
            DebugPrint("^3[updateAuthoritativeNetID] Drop " .. dropID .. " had a different netID (" .. Drops[dropID].netID .. ") before update to authoritative: " .. authoritativeNetID .. "^0")
        end
        Drops[dropID].netID = authoritativeNetID
        DebugPrint("^2[updateAuthoritativeNetID] Updated authoritative netID for drop " .. dropID .. " to: " .. authoritativeNetID .. "^0")

        -- If this client created a prop whose netID is NOT the authoritative one,
        -- and that prop still exists, the server should have sent a specific delete command for it.
        -- This event just ensures the Drops[dropID].netID is correct for future reference.
    else
        DebugPrint("^3[updateAuthoritativeNetID] Received authoritative netID for unknown drop " .. dropID .. ". It might have been cleaned up locally.^0")
    end
end)