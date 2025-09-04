local name, AddOn = ...
---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
AddOn = LibStub("AceAddon-3.0"):NewAddon(name, "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

-- Globals needed for displaying translated text via XML
ICH_NAME_COL_TITLE = L["Name"]
ICH_INSTANCE_COL_TITLE = L["Instance"]
ICH_AVAIL_DIFFS_COL_TITLE = L["Available Difficulty(s)"]

AddOn.DatabaseDefaults = {
    global = {
        minimap = { hide = false },
        windowScale = 1,
        showOwned = false,
        useTomTomPoints = true,
        currentTomTomWaypoint = nil,
        selectedTab = nil
    }
}

AddOn.Icon = LibStub("LibDBIcon-1.0")

---Prints a message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed to the chat window
---@see print
function AddOn:PrintChatMessage(...)
    print(WrapTextInColor("InstanceCollectionHelper:", HEIRLOOM_BLUE_COLOR), ...)
end

---@param difficultyID number ID associated with an instance difficulty
---@return string text The text to be shown on the button that sets the desired instance difficulty
function AddOn:GetDifficultyButtonText(difficultyID)
    local dKey
    for key, dd in pairs(AddOn.DungeonDifficulty) do
        if dd == difficultyID then dKey = key break end
    end
    if not dKey then
        for key, rd in pairs(AddOn.RaidDifficulty) do
            if rd == difficultyID then dKey = key break end
        end
    end

    if dKey == "LFR" or dKey == "LegacyLFR" then return "LFR"
    elseif dKey == "Normal" then return "N"
    elseif dKey == "Heroic" then return "H"
    elseif dKey == "Mythic" then return "M"
    elseif dKey == "Legacy40" then return "40"
    elseif dKey == "Legacy10" then return "10"
    elseif dKey == "Legacy25" then return "25"
    elseif dKey == "Legacy10H" then return "10H"
    elseif dKey == "Legacy25H" then return "25H"
    end

    return "?"
end

---Returns the difficulty text that corresponds to the given `difficultyID`
---@param difficultyID number? ID associated with an instance difficulty. Marked optional due to `GetLegacyRaidDifficultyID()` return a `number?` value, but required for this function.
---@return string text The text to be shown when referencing the desired instance difficulty
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
    elseif dKey == "Legacy40" then return "40 Player"
    elseif dKey == "Legacy10" then return L["10 Player"]
    elseif dKey == "Legacy25" then return L["25 Player"]
    elseif dKey == "Legacy10H" then return L["10 Player (Heroic)"]
    elseif dKey == "Legacy25H" then return L["25 Player (Heroic)"]
    end

    return L[dKey]
end

---Sets instance difficulty based on the provided value (Usable for all instance types)<br/>
---*Provides a consistent experience when changing difficulties either from the UI or chat command.*
---@param difficultyID number ID associated with an instance difficulty
function AddOn:SetInstanceDifficulty(difficultyID)
    for _, id in pairs(self.DungeonDifficulty) do
        if difficultyID == id then
            if GetDungeonDifficultyID() == difficultyID then
                ICH:PrintChatMessage(L["Dungeon Difficulty is already set to"], WrapTextInColor(ICH:GetInstanceDifficultyText(difficultyID), DARKYELLOW_FONT_COLOR))
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
            ICH:PrintChatMessage(L["Legacy Raid Difficulty is already set to"], WrapTextInColor(ICH:GetInstanceDifficultyText(difficultyID), DARKYELLOW_FONT_COLOR))
        else
            SetLegacyRaidDifficultyID(difficultyID)
        end
    else
        if GetRaidDifficultyID() == difficultyID then
            ICH:PrintChatMessage(L["Raid Difficulty is already set to"], WrapTextInColor(ICH:GetInstanceDifficultyText(difficultyID), DARKYELLOW_FONT_COLOR))
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

local counter = CreateCounter()
AddOn.SlashOptions = {
    type = "group",
    handler = AddOn,
    get = function(key) return AddOn.db.global[key[#key]] end,
    set = function(key, val) AddOn.db.global[key[#key]] = val end,
    args = {
        diffs = {
            type = "execute",
            name = "diffs",
            desc = L["Display all current instance difficulties"],
            order = counter(),
            func = function()
                AddOn:PrintChatMessage(L["Current Instance Difficulties"])
                print(L["Dungeon Difficulty:"], WrapTextInColor(AddOn:GetInstanceDifficultyText(GetDungeonDifficultyID()), DARKYELLOW_FONT_COLOR))
                print(L["Legacy Raid Difficulty:"], WrapTextInColor(AddOn:GetInstanceDifficultyText(GetLegacyRaidDifficultyID()), DARKYELLOW_FONT_COLOR))
                print(L["Raid Difficulty:"], WrapTextInColor(AddOn:GetInstanceDifficultyText(GetRaidDifficultyID()), DARKYELLOW_FONT_COLOR))
            end
        },
        dung = {
            type = "input",
            name = "dung",
            desc = L["Set dungeon difficulty."].."\n        "..L["Accepted values:"].." norm, hero, myth",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "norm" then AddOn:SetInstanceDifficulty(AddOn.DungeonDifficulty.Normal)
                elseif tostring(difficulty):lower() == "hero" then AddOn:SetInstanceDifficulty(AddOn.DungeonDifficulty.Heroic)
                elseif tostring(difficulty):lower() == "myth" then AddOn:SetInstanceDifficulty(AddOn.DungeonDifficulty.Mythic)
                else
                    AddOn:PrintChatMessage(WrapTextInColor(L["Invalid dungeon difficulty provided."].."\n"..L["Accepted values:"], ERROR_COLOR), WrapTextInColor("norm, hero, myth", WHITE_FONT_COLOR))
                end
            end
        },
        lraid = {
            type = "input",
            name = "lraid",
            desc = L["Set legacy raid difficulty."].."\n        "..L["Accepted values:"].." 10, 25, 10h, 25h",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "10" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy10)
                elseif tostring(difficulty):lower() == "25" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy25)
                elseif tostring(difficulty):lower() == "10h" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy10H)
                elseif tostring(difficulty):lower() == "25h" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy25H)
                else
                    AddOn:PrintChatMessage(WrapTextInColor(L["Invalid legacy raid difficulty provided."].."\n"..L["Accepted values:"], ERROR_COLOR), WrapTextInColor("10, 25, 10h, 25h", WHITE_FONT_COLOR))
                end
            end
        },
        raid = {
            type = "input",
            name = "raid",
            desc = L["Set raid difficulty."].."\n        "..L["Accepted values:"].." norm, hero, myth",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "norm" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Normal)
                elseif tostring(difficulty):lower() == "hero" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Heroic)
                elseif tostring(difficulty):lower() == "myth" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Mythic)
                else
                    AddOn:PrintChatMessage(WrapTextInColor(L["Invalid raid difficulty provided."].."\n"..L["Accepted values:"], ERROR_COLOR), WrapTextInColor("norm, hero, myth", WHITE_FONT_COLOR))
                end
            end
        },
        minimap = {
            type = "toggle",
            name = "minimap",
            desc = L["Show/hide the minimap icon"],
            order = counter(),
            set = function()
                AddOn.db.global.minimap.hide = not AddOn.db.global.minimap.hide
                if AddOn.db.global.minimap.hide then AddOn.Icon:Hide(name)
                else AddOn.Icon:Show(name)
                end
            end
        },
        about = {
            type = "execute",
            name = "about",
            desc = L["About the AddOn"],
            order = counter(),
            func = function()
                if AddOn.Container:IsVisible() then AddOn.Container:Hide() end
                if AddOn.About then AddOn.About:Show() end
            end
        }
    }
}