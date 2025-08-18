local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@param data InstanceMount|InstanceToy
---@return boolean `true` if the instance is a raid, `false` otherwise
---@see InstanceMount
function AddOn:IsInstanceRaid(data)
    -- For toys, we just check for the IsRaid property
    if data.IsRaid ~= nil then return data.IsRaid end

    -- AQ has no difficulty IDs listed since it defaults to a 40-man when zoned in (not settable from the UI)
    if #data.DifficultyIDs == 0 then return true end
    for _, id in pairs(self.DungeonDifficulty) do
        if id == data.DifficultyIDs[1] then return false end
    end
    return true
end