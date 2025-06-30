if GetResourceState('ox_target') ~= 'started' or not Config.UseTarget then return end

function AddTargetModel(models, radius, options)
    local optionsNames = {}
    for i=1, #options do 
        optionsNames[i] = options[i].name
    end
    RemoveTargetModel(models, optionsNames)
    exports.ox_target:addModel(models, options)
end

function RemoveTargetModel(models, optionsNames)
    exports.ox_target:removeModel(models, optionsNames)
end

function AddTargetZone(coords, radius, options)
    return exports.ox_target:addSphereZone({
        coords = vector3(coords.x, coords.y, coords.z + 0.2), -- Added offset to position the zone better
        radius = radius,
        options = options,
        debug = Config.Debug -- Add this if you want to visually see the zones during development
    })
end

function RemoveTargetZone(index)
    exports.ox_target:removeZone(index)
end