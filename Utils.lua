local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@param data Mount|Toy|Pet
---@return boolean `true` if the instance is a raid, `false` otherwise
---@see Mount
---@see Toy
---@see Pet
function AddOn:IsInstanceRaid(data)
    -- AQ has no difficulty IDs listed since it defaults to a 40-man when zoned in (not settable from the UI)
    if #data.DifficultyIDs == 0 then return true end
    for _, id in pairs(self.DungeonDifficulty) do
        if id == data.DifficultyIDs[1] then return false end
    end
    return true
end

---Determines whether or not an instance encounter has been completed for the reset period for a given difficulty
---@param data Mount|Toy|Pet
---@see Mount
---@see Toy
---@---@see Pet
function AddOn.IsEncounterCompleted(data, difficultyID)
    local encounterName
    if data.EncounterID then encounterName = select(1, EJ_GetEncounterInfo(data.EncounterID)) end
    for i = 1, GetNumSavedInstances() do
        local _, _, _, diff, isLocked, _, _, _, _, _, numEncounters, _, _, mapID = GetSavedInstanceInfo(i)
        if isLocked and diff == difficultyID then
            if mapID == data.MapID then
                if not encounterName then return isLocked
                else
                    for idx = 1, numEncounters do
                        local bossName, _, isKilled = GetSavedInstanceEncounterInfo(i, idx)
                        if encounterName:match(bossName) then return isKilled end
                    end
                end
            end
        end
    end

    return false
end


---@param data Mount|Toy|Pet
---@return boolean isCompleted `true` if an encounter has been completed for the reset period on a difficulty that shares a lockout with a mount's displayed difficulty, `false` otherwise
---@see Mount
---@see Toy
---@see Pet
function AddOn:IsEncounterCompletedOnSharedDifficulty(data)
    local isCompleted = false
    for shared, _ in pairs(data.SharedDifficulties) do
        if self.IsEncounterCompleted(data, shared) then isCompleted = true break end
    end

    return isCompleted
end

---Append a list of map search tags for a collectibleto the existing `SearchTags` list based on the ID of the instance where it is obtained
---@param data Mount|Toy|Pet
---@see Mount
---@see Toy
---@see Pet
function AddOn.AppendMapSearchTags(data)
    -- Create a fresh list of tags to avoid modifying the original list for each expansion
    local tags = {}
    for _, xpacTag in ipairs(data.SearchTags) do tinsert(tags, xpacTag) end

    local dungeonAreaMapID = select(7, EJ_GetInstanceInfo(data.InstanceID))
    local map = C_Map.GetMapInfo(dungeonAreaMapID)
    -- MapID 946 is "Cosmic"
    while map and map.parentMapID ~= 946 do
        -- expected: instance name, then zone names up to but excluding "Azeroth"
        tinsert(tags, map.name:lower())
        map = C_Map.GetMapInfo(map.parentMapID)
    end
    data.SearchTags = tags
end