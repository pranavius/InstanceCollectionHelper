local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Prints a message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed to the chat window
---@see print
function AddOn:PrintChatMessage(...)
    print(HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("Instance Collection Helper:"), ...)
end

---Prints a debugging message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed as part of the debug message
function AddOn:PrintDebugMessage(...)
    if self.db and self.db.global.debugMessages then self:PrintChatMessage(LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("[Debug]"), ...) end
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
            --@retail@
            self:PrintChatMessage(L["Legacy Raid Difficulty is already set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
            --@end-retail@
            --@version-mists@
            self:PrintChatMessage(L["Raid Difficulty is already set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
            --@end-version-mists@
        else
            SetLegacyRaidDifficultyID(difficultyID)
            --@version-mists@
            self:PrintChatMessage(L["Raid Difficulty set to"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(self:GetInstanceDifficultyText(difficultyID)))
            --@end-version-mists@
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
---@param fs FontString FontString containing the text
---@param text string The text to check for truncation
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

---@param data Mount|Toy|Pet|HousingItem
---@return boolean "`true` if the instance is a raid, `false` otherwise"
---@see Mount
---@see Toy
---@see Pet
---@see HousingItem
function AddOn:IsInstanceRaid(data)
    -- Continue treating empty DifficultyIDs lists as raids even though this functionality is deprecated
    if #data.DifficultyIDs == 0 then return true end
    for _, id in pairs(self.DungeonDifficulty) do
        if id == data.DifficultyIDs[1] then return false end
    end
    return true
end

---@param data Mount|Toy|Pet|HousingItem
---@return boolean "`true` if an instance encounter has been completed for the current reset period on a given difficulty, `false` otherwise"
---@see Mount
---@see Toy
---@see Pet
---@see HousingItem
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


---@param data Mount|Toy|Pet|HousingItem
---@return boolean "`true` if an encounter has been completed for the current reset period on a difficulty that shares a lockout with a mount's displayed difficulty, `false` otherwise"
---@see Mount
---@see Toy
---@see Pet
---@see HousingItem
function AddOn:IsEncounterCompletedOnSharedDifficulty(data)
    local isCompleted = false
    for shared, _ in pairs(data.SharedDifficulties) do
        if self.IsEncounterCompleted(data, shared) then isCompleted = true break end
    end

    return isCompleted
end

---Append a list of map search tags for a collectibleto the existing `SearchTags` list based on the ID of the instance where it is obtained
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem|HousingItem
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
---@see WowRemixItem
---@see HousingItem
function AddOn.AppendMapSearchTags(data)
    -- Create a fresh list of tags to avoid modifying the original list for each expansion
    local tags = {}
    for _, xpacTag in ipairs(data.SearchTags) do tinsert(tags, xpacTag) end

    local dungeonAreaMapID = select(7, EJ_GetInstanceInfo(data.InstanceID))
    -- This value will always be 0 for instances that existed before Siege of Orgimmar was released
    if dungeonAreaMapID and dungeonAreaMapID ~= 0 then
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

---Updates the AddOn database list of owned cosmetics, fetching item data when needed but not available
---@param itemID integer
function AddOn:UpdateOwnedCosmeticsCacheByItemID(itemID)
    local function getTooltipAndUpdateOwnedCosmeticsCache()
        local tooltip = C_TooltipInfo.GetItemByID(itemID)
        if tooltip and tooltip.lines then
            for _, data in ipairs(tooltip.lines) do
                if data.type == 26 then
                    self.db.global.ownedCosmeticsCache[itemID] = true
                    break
                elseif data.leftText:lower() == ERR_COSMETIC_KNOWN:lower() then
                    self.db.global.ownedCosmeticsCache[itemID] = true
                    break
                end
            end
        else
            self:PrintDebugMessage("No tooltip data found for item ID", itemID)
        end
    end
    if self.db.global.ownedCosmeticsCache[itemID] ~= true and not C_Item.IsItemDataCachedByID(itemID) then
        Item:CreateFromItemID(itemID):ContinueOnItemLoad(getTooltipAndUpdateOwnedCosmeticsCache)
    elseif self.db.global.ownedCosmeticsCache[itemID] ~= true then
        getTooltipAndUpdateOwnedCosmeticsCache()
    elseif self.db.global.ownedCosmeticsCache[itemID] == nil then
        self.db.global.ownedCosmeticsCache[itemID] = false
    end
end

---Formats and returns text indicating the number of a pet owned against the maximum number that can be owned
---@param owned integer Number of the pet that is owned
---@param limit integer Maximum number that can be owned
---@return string
function AddOn.ColorOwnedPetCountText(owned, limit)
    local text = owned.."/"..limit
    local percOwned = owned / limit
    if percOwned == 0 then return ""
    elseif percOwned <= 0.5 then return RED_FONT_COLOR:WrapTextInColorCode(text)
    elseif percOwned > 0.5 and percOwned < 1 then return DARKYELLOW_FONT_COLOR:WrapTextInColorCode(text)
    else return text
    end
end

---@param data TimewalkingCacheData|LemixCacheData
---@param type "Mount"|"Toy"|"Pet"|"Cosmetic"
---@return boolean isOwned
function AddOn.GetIsVendorItemOwned(data, type)
    local isOwned = false
    if type == "Mount" then
        isOwned = select(11, C_MountJournal.GetMountInfoByID(data.mountID))
    elseif type == "Pet" then
        local owned, limit = AddOn.GetPetOwnedAndLimitCount(data.speciesID)
        isOwned = (owned > 0 and (AddOn.db.global.countPetOwnedOnlyIfMaxOwned and owned == limit or true)) or false
    elseif type == "Cosmetic" then
        isOwned = AddOn.db.global.ownedCosmeticsCache[data.itemID] or false
    elseif type == "Toy" then
        isOwned = PlayerHasToy(data.itemID)
    end

    return isOwned
end

---@param speciesID integer ID for the pet species
---@return number owned Number of the pet that is owned
---@return number limit Maximum number that can be owned
function AddOn.GetPetOwnedAndLimitCount(speciesID)
    local owned, limit
    if speciesID then
        owned, limit = C_PetJournal.GetNumCollectedInfo(speciesID)
    else
        owned, limit = 0, 0
    end

    return owned or 0, limit or 0
end