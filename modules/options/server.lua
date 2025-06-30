local Throwables = {}
local Drops = {} -- { itemKey, uses, metadata, coords, heading, model, netID (of script prop), permanentName (of map entity), timestamp, etc. }

-- Throwing (keeping as is)
RegisterNetEvent("dude_consumables:throwing:throwObject", function(data)
    local source = source
    local throwID = nil
    repeat
        throwID = os.time() .. "_" .. math.random(1000, 9999)
    until not Throwables[throwID]
    Throwables[throwID] = data
    TriggerClientEvent("dude_consumables:throwing:setObjectData", -1, throwID, data)
    SetTimeout(1000 * Config.Options.throwing.despawnTime, function()
        if Throwables[throwID] and Throwables[throwID].net_id then
            local entity = NetworkGetEntityFromNetworkId(Throwables[throwID].net_id)
            if DoesEntityExist(entity) then
                DeleteEntity(entity) -- Server deleting its own knowledge of a networked entity
            end
        end
        Throwables[throwID] = nil
        TriggerClientEvent("dude_consumables:throwing:setObjectData", -1, throwID, nil) -- Notify clients to clear local data
    end)
end)

-- Server function to create a persistent map entity (for culling)
function RegisterPermanentPropForDrop(modelHash, coords, heading)
    local propName = "consumable_drop_" .. os.time() .. "_" .. math.random(10000, 99999)
    RequestModel(modelHash) -- Server needs to know the model too
    local attempts = 0
    while not HasModelLoaded(modelHash) and attempts < 20 do Wait(100); attempts = attempts + 1 end

    if not HasModelLoaded(modelHash) then
        DebugPrint("^1[dude_consumables] RegisterPermanentPropForDrop: Failed to load model " .. modelHash .. " on server.^0")
        return nil
    end

    -- Create a map data entry
    local mapData = {
        name = propName,
        type = "prop",
        model = modelHash,
        coords = coords,
        rotation = vector3(0.0, 0.0, heading or 0.0),
        frozen = true,
        dynamic = false,
        -- interior = 0, -- Specify interior if applicable
        -- lodDistance = 200.0 -- Adjust as needed
    }
    -- Register with the streaming system (this is a simplified way, proper mapdata might be needed for full effect)
    -- The actual native for RegisterMapEntity 0x063AE2B2CC273588 is client-side.
    -- For server-side persistence that syncs to clients as map objects, you usually define them in a map resource's ymap/ytyp.
    -- This function on server-side is more for *tracking* that such an entity *should* exist.
    -- The client-side CreateObject(..., true,...) is what creates the networked script entity.
    -- The "permanentName" here is just a server-side unique ID for *this logical drop*.
    -- The actual "culling solution" likely involved making the client-created prop more persistent or using actual map entities.
    -- For now, we'll just track this name. If you have a server-side native to make an entity persistent across restarts, that's different.
    DebugPrint("^3[dude_consumables] RegisterPermanentPropForDrop: Tracking permanentName: " .. propName .. " (This is a server-side logical ID, not a direct map entity creation from server script usually)^0")
    SetModelAsNoLongerNeeded(modelHash)
    return propName -- This is just a unique name for server tracking.
end

function UnregisterPermanentPropForDrop(permanentName)
    if permanentName then
        -- If RegisterPermanentPropForDrop actually registered something with a server-side system that needs unregistering, do it here.
        -- For client-created RegisterMapEntity, the client that registered it would need to unregister.
        -- If it's just a name, then nothing server-side to do other than no longer tracking it.
        DebugPrint("^3[dude_consumables] UnregisterPermanentPropForDrop: Untracking permanentName: " .. permanentName .. "^0")
    end
end


-- This event is triggered by the client after they have selected a place for the item.
RegisterNetEvent("dude_consumables:drop:createDrop", function(coords, placedItemData)
    local source = source -- Client who is placing the item

    if not placedItemData or not placedItemData.itemKey or not placedItemData.model then
        DebugPrint("^1[dude_consumables] createDrop: Invalid itemData received from client " .. source .. "^0")
        return
    end

    if Players[source] then
        DebugPrint("^3[dude_consumables] createDrop: Clearing Players["..source.."] as item is being placed.^0")
        Players[source] = nil
        TriggerClientEvent("dude_consumables:removeItem", source)
    end

    local dropID
    repeat
        dropID = "drop_" .. os.time() .. "_" .. math.random(10000, 99999)
    until not Drops[dropID]

    local dropData = {
        itemKey = placedItemData.itemKey,
        uses = placedItemData.uses,
        metadata = placedItemData.metadata or {},
        isglass = placedItemData.isglass or false,
        coords = coords,
        model = placedItemData.model,
        heading = placedItemData.heading or 0.0,
        timestamp = os.time(),
        placerClient = source, -- IMPORTANT: Store and send this
        netID = 0, -- Authoritative NetID, to be confirmed by placer
        netIdConfirmedByPlacer = false,
        permanentName = nil
    }

    if Inventory and Inventory.Items and Inventory.Items[dropData.itemKey] then
        dropData.itemLabel = Inventory.Items[dropData.itemKey].label
    else
        dropData.itemLabel = dropData.itemKey:gsub("_", " "):gsub("(%a)([%w_']*)", function(first, rest) return first:upper() .. rest:lower() end)
    end
    if not dropData.itemLabel then dropData.itemLabel = dropData.itemKey end

    Drops[dropID] = dropData
    TriggerClientEvent("dude_consumables:drop:addDrop", -1, dropID, dropData) -- dropData now includes placerClient
    DebugPrint("^2[dude_consumables] Server: Created drop " .. dropID .. " by placerClient " .. source .. ". Waiting for placer's netID.^0")

    if Config.Options.drop.despawnTime and Config.Options.drop.despawnTime > 0 then
        SetTimeout(1000 * Config.Options.drop.despawnTime, function()
            local dropToDespawn = Drops[dropID]
            if dropToDespawn then
                DebugPrint("^2[dude_consumables] Despawn timer for " .. dropID .. ". NetID: " .. (dropToDespawn.netID or "None").. "^0")
                if dropToDespawn.netID and dropToDespawn.netID ~= 0 then
                    TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, dropToDespawn.netID)
                else
                    TriggerClientEvent("dude_consumables:drop:removeDropFallback", -1, dropID)
                end
                Drops[dropID] = nil
            end
        end)
    end
end)

RegisterNetEvent("dude_consumables:syncDropNetID", function(dropID, netIDFromClient)
    local source = source -- Client who is sending this netID

    if not Drops[dropID] then
        DebugPrint("^1[Server syncDropNetID] Unknown/Removed dropID " .. dropID .. " from client " .. source .. ". Telling client to delete netID " .. netIDFromClient .. "^0")
        if netIDFromClient ~= 0 then TriggerClientEvent("dude_consumables:deleteNetworkedEntity", source, netIDFromClient) end
        return
    end

    local drop = Drops[dropID]

    -- Case 1: The message is from the original placer of the item
    if drop.placerClient == source then
        if drop.netIdConfirmedByPlacer and drop.netID ~= 0 and drop.netID ~= netIDFromClient then
            -- Placer's netID was already confirmed, but they are sending a new one.
            DebugPrint("^1[Server syncDropNetID] PLACER " .. source .. " (drop " .. dropID .. ") re-reported NEW netID " .. netIDFromClient .. " (was " .. drop.netID .. "). Deleting old, using new.^0")
            TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, drop.netID) -- Delete the OLD authoritative netID for ALL
            drop.netID = netIDFromClient
            TriggerClientEvent("dude_consumables:drop:updateAuthoritativeNetID", -1, dropID, drop.netID) -- Broadcast new authoritative
        elseif not drop.netIdConfirmedByPlacer then
            -- This is the first time the placer is confirming their netID.
            local previouslyTentativeNetID = drop.netID -- This would be 0 if no non-placer reported before placer.
                                                    -- Or it could be a non-placer's ID IF that logic was different.
                                                    -- With current flow, this should usually be 0.

            drop.netID = netIDFromClient
            drop.netIdConfirmedByPlacer = true
            DebugPrint("^2[Server syncDropNetID] Confirmed netID " .. netIDFromClient .. " for drop " .. dropID .. " from PLACER " .. source .. ". Broadcasting as authoritative.^0")
            TriggerClientEvent("dude_consumables:drop:updateAuthoritativeNetID", -1, dropID, drop.netID)

            if previouslyTentativeNetID ~= 0 and previouslyTentativeNetID ~= netIDFromClient then
                -- This case should be rare now, as non-placers are told to delete immediately.
                -- But if somehow a non-placer's ID was set to drop.netID before placer confirmed.
                DebugPrint("^3[Server syncDropNetID] Placer confirmed. A different tentative netID " .. previouslyTentativeNetID .. " was present for drop " .. dropID .. ". Deleting it.^0")
                TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, previouslyTentativeNetID)
            end
        elseif drop.netIdConfirmedByPlacer and drop.netID == netIDFromClient then
            DebugPrint("^3[Server syncDropNetID] Placer " .. source .. " re-sent same confirmed netID " .. netIDFromClient .. " for drop " .. dropID .. ". No change.^0")
        end
    else
        -- Case 2: The message is from a NON-PLACER client.
        -- This non-placer's prop is ALWAYS considered redundant for the authoritative drop record.
        -- Tell THIS non-placer client to delete the prop IT just reported.
        DebugPrint("^3[Server syncDropNetID] Received netID " .. netIDFromClient .. " from NON-PLACER " .. source .. " for drop " .. dropID .. ". Placer is " .. drop.placerClient .. ". Authoritative netID (if set): "..(drop.netID or "0")..". Telling client " .. source .. " to delete THEIR prop " .. netIDFromClient .. ".^0")
        if netIDFromClient ~= 0 then
            TriggerClientEvent("dude_consumables:deleteNetworkedEntity", source, netIDFromClient)
        end
    end
end)


RegisterNetEvent("dude_consumables:drop:collectDrop", function(dropID)
    local source = source
    local drop = Drops[dropID]

    if not drop then
        DebugPrint("^1[dude_consumables] Player " .. source .. " tried to collect non-existent dropID: " .. dropID .. "^0")
        return
    end

    -- Prepare item data for giving to player
    local itemDataToGive = {
        itemKey = drop.itemKey,
        uses = drop.uses,
        metadata = drop.metadata or {},
        isglass = drop.isglass or (Config.Glasses[drop.itemKey] and true or false),
        model = drop.model,
        slot = nil
    }

    DebugPrint("^3[dude_consumables] Player " .. source .. " collecting drop " .. dropID .. ". Server's stored NetID for this drop: " .. (drop.netID or "N/A") .. "^0")

    -- Instruct all clients to delete the networked SCRIPT prop using the server's authoritative netID
    if drop.netID and drop.netID ~= 0 then
        TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, drop.netID)
        DebugPrint("^2[dude_consumables] Instructed ALL clients to delete entity with netID: " .. drop.netID .. " for dropID: " .. dropID .. "^0")
    else
        DebugPrint("^1[dude_consumables] CollectDrop: Authoritative netID is missing or 0 for dropID " .. dropID .. " on server. Using fallback client-side removal (less reliable for ghosts).^0")
        TriggerClientEvent("dude_consumables:drop:removeDropFallback", -1, dropID)
    end

    -- If a persistent map entity was also created for culling, unregister it
    -- if drop.permanentName then
    --     UnregisterPermanentPropForDrop(drop.permanentName)
    -- end

    -- Give the item to the player
    EquipItem(source, itemDataToGive, true) -- 'true' for refund should add to inventory via ox

    Drops[dropID] = nil -- Remove from server's active drops
    -- SaveDropsToCache() -- If you use this

    DebugPrint("^2[dude_consumables] Player " .. source .. " successfully collected and processed drop " .. dropID .. "^0")
end)

RegisterNetEvent("dude_consumables:drop:updated", function(dropID, newDataFromClient)
    local source = source -- Client who initiated the action (e.g., pouring)
    local drop = Drops[dropID]

    if not drop then
        DebugPrint("^1[Server drop:updated] DropID " .. dropID .. " not found.^0")
        return
    end

    DebugPrint("^3[Server drop:updated] Updating drop " .. dropID .. ". Initiator: " .. source .. ". New data from client: " .. json.encode(newDataFromClient) .. "^0")

    local oldAuthoritativeNetID = drop.netID -- Store the current authoritative netID before changing anything

    -- Update server-side data for the drop
    drop.uses = newDataFromClient.uses
    drop.model = newDataFromClient.model -- Client has determined the new model
    if newDataFromClient.status then drop.status = newDataFromClient.status end
    drop.timestamp = os.time() -- Refresh timestamp
    drop.netID = 0 -- Reset netID, will be re-confirmed by placer after prop recreation
    drop.netIdConfirmedByPlacer = false -- Placer needs to confirm new netID for the new prop

    -- Keep placerClient, coords, heading, itemKey, itemLabel, isglass, metadata the same unless explicitly changed by newDataFromClient
    drop.itemLabel = newDataFromClient.itemLabel or drop.itemLabel -- Update label if provided

    DebugPrint("^3[Server drop:updated] Drop " .. dropID .. " data updated on server. Model: " .. drop.model .. ", Uses: " .. drop.uses .. ". Telling clients to visually refresh.^0")

    -- Tell ALL clients to delete the OLD authoritative prop for this dropID
    if oldAuthoritativeNetID and oldAuthoritativeNetID ~= 0 then
        DebugPrint("^3[Server drop:updated] Instructing ALL clients to delete OLD authoritative netID: " .. oldAuthoritativeNetID .. " for drop " .. dropID .. " BEFORE visual refresh.^0")
        TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, oldAuthoritativeNetID)
        -- Add a small delay to allow deletion to process before recreation
        Wait(250) -- Adjust if needed, helps prevent race conditions
    end

    -- Now, tell all clients to "re-add" the drop with the updated data.
    -- This will trigger them to create a new prop and new interaction.
    -- The original placerClient is still the same for this logical dropID.
    TriggerClientEvent("dude_consumables:drop:addDrop", -1, dropID, drop)
    DebugPrint("^2[Server drop:updated] Re-broadcasted addDrop for " .. dropID .. " to visually refresh with new model/data. Waiting for new placer netID.^0")
end)


-- Giving item (remains largely the same)
RegisterNetEvent("dude_consumables:giveItem", function(target, amount)
    local source = source
    local item = Players[source]
    if not item or target < 1 then return end
    local amount = tonumber(amount) or 0
    if amount <= 0 then return end

    local uses = item.uses
    if amount >= uses then
        amount = uses
        Players[source] = nil
        TriggerClientEvent("dude_consumables:removeItem", source)
    else
        Players[source].uses = Players[source].uses - amount
        TriggerClientEvent("dude_consumables:updateUses", source, Players[source].uses)
    end

    local targetItem = Players[target]
    -- Note: Giving directly into another player's "equipped" state is complex.
    -- It's usually better to give it to their inventory.
    -- The EquipItem(target, ..., true) should handle adding to inventory if 'true' means refund/add.
    local itemToGive = {
        itemKey = item.itemKey,
        uses = amount,
        metadata = item.metadata or {},
        isglass = item.isglass
    }
    EquipItem(target, itemToGive, true) -- true likely means add to inventory
    ShowNotification(source, "You gave " .. amount .. " use(s) of " .. item.itemKey .. " to player " .. target)
    ShowNotification(target, "You received " .. amount .. " use(s) of " .. item.itemKey .. " from player " .. source)
end)


lib.callback.register("dude_consumables:pourItem", function(source)
    if not Players[source] then
        DebugPrint("^1[dude_consumables] pourItem: No active item for player: " .. source .. "^0")
        return false, 0
    end

    local metadata = Players[source] -- This is the item in the player's hand (e.g., the bottle)
    -- local cfg = Config.Items[metadata.itemKey]

    DebugPrint("^3[dude_consumables] Processing pour for item in hand: " .. metadata.itemKey .. " with uses: " .. metadata.uses .. "^0")

    if metadata.uses < 1 then
        ShowNotification(source, locale("no_uses_left"))
        return false, metadata.uses
    end

    metadata.uses = metadata.uses - 1
    DebugPrint("^3[dude_consumables] Uses left in hand item after pouring: " .. metadata.uses .. "^0")

    if metadata.uses < 1 and not metadata.isglass then -- if it's a bottle and now empty
        Players[source] = nil -- It will be removed from hand by client
    end
    -- If it's a glass in hand and now empty, client will update its prop. Player still holds it.

    return true, metadata.uses
end)

-- Periodic cleanup - this can be simplified or removed if despawn timers per drop are sufficient.
-- CreateThread(function()
--     while true do
--         Wait(60000 * 5) -- Check every 5 minutes
--         local currentTime = os.time()
--         local dropsToRemove = {}
--         for dropID, dropData in pairs(Drops) do
--             if dropData.timestamp and (currentTime - dropData.timestamp > (Config.Options.drop.despawnTime or 240) + 300) then -- Add some buffer
--                 table.insert(dropsToRemove, dropID)
--             end
--         end
--         for _, id_to_remove in ipairs(dropsToRemove) do
--             local dropToDespawn = Drops[id_to_remove]
--             if dropToDespawn then
--                 DebugPrint("^2[dude_consumables] Periodic Cleanup: Despawning dropID: " .. id_to_remove .. "^0")
--                 if dropToDespawn.netID and dropToDespawn.netID ~= 0 then
--                     TriggerClientEvent("dude_consumables:deleteNetworkedEntity", -1, dropToDespawn.netID)
--                 end
--                 if dropToDespawn.permanentName then UnregisterPermanentPropForDrop(dropToDespawn.permanentName) end
--                 Drops[id_to_remove] = nil
--             end
--         end
--         -- SaveDropsToCache()
--     end
-- end)

function ResyncDropsForPlayer(playerId)
    DebugPrint("^2[dude_consumables] Resyncing all drops for player " .. playerId .. "^0")
    local allCurrentDrops = {}
    for id, data in pairs(Drops) do
        allCurrentDrops[id] = data
    end
    TriggerClientEvent("dude_consumables:drop:syncAllDrops", playerId, allCurrentDrops)
end

AddEventHandler("playerJoined", function()
    local playerSrc = source
    -- Wait a bit for the player to fully load everything else.
    SetTimeout(15000, function() -- Increased delay to ensure client is really ready
        if GetPlayerName(playerSrc) ~= "** Invalid **" then -- Check if player is still connected
            DebugPrint("^2[dude_consumables] playerJoined: Player " .. playerSrc .. " has joined, attempting to sync drops.^0")
            ResyncDropsForPlayer(playerSrc)
        else
            DebugPrint("^1[dude_consumables] playerJoined: Player " .. playerSrc .. " seems to have disconnected before drop sync.^0")
        end
    end)
end)

RegisterNetEvent("dude_consumables:returnCanceledItem", function(itemKey, uses, itemFullData)
    local source = source
    -- The itemFullData should contain all necessary info for ox_inventory, including original slot if needed.
    -- For simplicity, just adding it back. ox_inventory should handle slotting.
    Inventory.AddItem(source, itemKey, 1, itemFullData)
    ShowNotification(source, "Item placement canceled, item returned to inventory.")
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    Players[source] = nil -- Clear equipped item for dropped player
    DebugPrint("^3[dude_consumables] Player " .. source .. " dropped. Reason: " .. reason .. ". Cleared their equipped item state.^0")
    -- Drops owned by this player, or all drops, don't need special handling on playerDrop
    -- unless you want to make them despawn faster or assign ownership.
    -- The existing despawn timers or periodic cleanup will handle them.
end)


RegisterNetEvent("dude_consumables:requestAllDrops", function()
    local source = source
    DebugPrint("^2[dude_consumables] Player " .. source .. " requested all drops.^0")
    ResyncDropsForPlayer(source)
end)

-- The old syncProp system is likely conflicting.
-- Creation is handled by addDrop. Deletion by deleteNetworkedEntity.
-- Commenting out to avoid issues. If this was for something else, it needs to be re-evaluated.
-- RegisterNetEvent("dude_consumables:syncProp", function(dropID, action, model, coords, heading)
--     -- if action == "create" then
--     --     -- This is now handled by the main dude_consumables:drop:addDrop event
--     --     -- TriggerClientEvent("dude_consumables:createProp", -1, dropID, model, coords, heading)
--     -- elseif action == "delete" then
--     --     -- This is now handled by dude_consumables:deleteNetworkedEntity
--     --     -- TriggerClientEvent("dude_consumables:deleteProp", -1, dropID)
--     -- end
-- end)