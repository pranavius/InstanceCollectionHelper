local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Prints a message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed to the chat window
---@see print
function AddOn:PrintChatMessage(...)
    print(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("InstanceCollectionHelper:"), ...)
end

---Prints a debugging message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed as part of the debug message
function AddOn:PrintDebugMessage(...)
    if self.db.global.debugMessages then self:PrintChatMessage(LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("[Debug]"), ...) end
end

---Returns the difficulty text that corresponds to the given `difficultyID`
---@param difficultyID number? ID associated with an instance difficulty. Marked optional due to `GetLegacyRaidDifficultyID()` return a `number?` value, but required for this function.
---@return string "The text to be shown when referencing the desired instance difficulty"
function AddOn:GetInstanceDifficultyText(difficultyID)
    local dKey
    for key, dd in pairs(AddOn.DungeonDifficulty) do
        if dd == difficultyID then dKey = key break end
    end
    if not dKey then
        for key, rd in pairs(AddOn.RaidDifficulty) do
            if rd == difficultyID then dKey = key break end
        end
    end

    if not dKey then return L["Unknown"]
    elseif dKey == "LegacyLFR" then return L["LFR"]
    elseif dKey == "Legacy40" then return L["40 player"]
    elseif dKey == "Legacy10" then return L["10 Player"]
    elseif dKey == "Legacy25" then return L["25 Player"]
    elseif dKey == "Legacy10H" then return L["10 Player (Heroic)"]
    elseif dKey == "Legacy25H" then return L["25 Player (Heroic)"]
    end

    return L[dKey]
end

---Sets instance difficulty based on the provided value (Usable for all instance types)<br>
---*Provides a consistent experience when changing difficulties either from the UI or chat command.*
---@param difficultyID number ID associated with an instance difficulty
function AddOn:SetInstanceDifficulty(difficultyID)
    for _, id in pairs(self.DungeonDifficulty) do
        if difficultyID == id then
            if GetDungeonDifficultyID() == difficultyID then
                self:PrintChatMessage(L["Dungeon Difficulty is already set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
            else
                SetDungeonDifficultyID(difficultyID)
            end
            -- After a dungeon difficulty modification is attempted, there's no need to check anything further
            return
        end
    end
    -- Raid difficulty ID less than 10 indicates legacy raid
    if difficultyID < 10 then
        if GetLegacyRaidDifficultyID() == difficultyID then
            self:PrintChatMessage(L["Legacy Raid Difficulty is already set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
        else
            SetLegacyRaidDifficultyID(difficultyID)
        end
    else
        if GetRaidDifficultyID() == difficultyID then
            self:PrintChatMessage(L["Raid Difficulty is already set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
        else
            SetRaidDifficultyID(difficultyID)
        end
    end
end

--- Determines if text length exceeds defined width and truncates with ellipsis when this happens
--- @param fs FontString FontString containing the text
--- @param text string The text to check for truncation
function AddOn:SetTruncatedText(fs, text)
    local maxWidth = fs:GetWidth()
    fs:SetText(text)
    -- If text already fits in the specified width, there's nothing to be done
    if fs:GetStringWidth() <= maxWidth then return end

    local ellipsis = "…"
    local lastVisibleChar, totalChars = 1, #text

    while lastVisibleChar < totalChars do
        local midpointChar = math.floor((lastVisibleChar + totalChars) / 2)
        local substr = text:sub(1, midpointChar)
        fs:SetText(substr..ellipsis)
        if fs:GetStringWidth() + 1 > maxWidth then
            totalChars = midpointChar - 1
        else
            lastVisibleChar = midpointChar + 1
        end
    end

    fs:SetText(text:sub(1, lastVisibleChar - 1) .. ellipsis)
end

---@param data Mount|Toy|Pet
---@return boolean "`true` if the instance is a raid, `false` otherwise"
---@see Mount
---@see Toy
---@see Pet
function AddOn:IsInstanceRaid(data)
    -- Continue treating empty DifficultyIDs lists as raids even though this functionality is deprecated
    if #data.DifficultyIDs == 0 then return true end
    for _, id in pairs(self.DungeonDifficulty) do
        if id == data.DifficultyIDs[1] then return false end
    end
    return true
end

---@param data Mount|Toy|Pet
---@return boolean "`true` if an instance encounter has been completed for the current reset period on a given difficulty, `false` otherwise"
---@see Mount
---@see Toy
---@see Pet
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
---@return boolean "`true` if an encounter has been completed for the current reset period on a difficulty that shares a lockout with a mount's displayed difficulty, `false` otherwise"
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
    -- This value will always be 0 for instances that existed before Siege of Orgimmar was released
    if dungeonAreaMapID ~= 0 then
        local map = C_Map.GetMapInfo(dungeonAreaMapID)
        -- MapID 946 is "Cosmic"
        while map and map.parentMapID ~= 946 do
            -- expected: instance name, then zone names up to but excluding "Azeroth"
            tinsert(tags, map.name:lower())
            map = C_Map.GetMapInfo(map.parentMapID)
        end
    end

    data.SearchTags = tags
end