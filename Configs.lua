local name, AddOn = ...
---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
AddOn = LibStub("AceAddon-3.0"):NewAddon(name, "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

AddOn.DatabaseDefaults = {
    global = {
        minimap = { hide = false },
        windowScale = 1,
        showOwned = false
    }
}

AddOn.Icon = LibStub("LibDBIcon-1.0")

---Prints a message to the chat window prefixed by the AddOn name
---@param ... any Arguments to be printed to the chat window
---@see print
function AddOn:PrintChatMessage(...)
    print(WrapTextInColor("Instance Collection Helper:", HEIRLOOM_BLUE_COLOR), ...)
end

---Returns the text to be shown on a difficulty button
---@param difficultyID number
---@return string text
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

    if dKey == "LFR" then return dKey
    elseif dKey == "Normal" then return "N"
    elseif dKey == "Heroic" then return "H"
    elseif dKey == "Mythic" then return "M"
    elseif dKey == "Legacy10" then return "10"
    elseif dKey == "Legacy25" then return "25"
    elseif dKey == "Legacy10H" then return "10H"
    elseif dKey == "Legacy25H" then return "25H"
    end

    return "?"
end

---Returns the difficulty text that corresponds to the given `difficultyID`
---@param difficultyID number?
---@return string text
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

    if not dKey then return "Unknown"
    elseif dKey == "Legacy10" then return "10 Player"
    elseif dKey == "Legacy25" then return "25 Player"
    elseif dKey == "Legacy10H" then return "10 Player (Heroic)"
    elseif dKey == "Legacy25H" then return "25 Player (Heroic)"
    end

    return dKey
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
            desc = "Display all current instance difficulties",
            order = counter(),
            func = function()
                AddOn:PrintChatMessage("Current Instance Difficulties")
                print(WrapTextInColor("Dungeon Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetInstanceDifficultyText(GetDungeonDifficultyID()))
                print(WrapTextInColor("Legacy Raid Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetInstanceDifficultyText(GetLegacyRaidDifficultyID()))
                print(WrapTextInColor("Raid Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetInstanceDifficultyText(GetRaidDifficultyID()))
            end
        },
        dung = {
            type = "input",
            name = "dung",
            desc = "Set dungeon difficulty.\n        Accepted values: norm, hero, myth",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "norm" then SetDungeonDifficultyID(AddOn.DungeonDifficulty.Normal)
                elseif tostring(difficulty):lower() == "hero" then SetDungeonDifficultyID(AddOn.DungeonDifficulty.Heroic)
                elseif tostring(difficulty):lower() == "myth" then SetDungeonDifficultyID(AddOn.DungeonDifficulty.Mythic)
                else
                    AddOn:PrintChatMessage(WrapTextInColor("Invalid dungeon difficulty provided.\nAccepted values:", ERROR_COLOR), WrapTextInColor("norm, hero, myth", WHITE_FONT_COLOR))
                end
            end
        },
        lraid = {
            type = "input",
            name = "lraid",
            desc = "Set legacy raid difficulty.\n        Accepted values: 10, 25, 10h, 25h",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "10" then SetLegacyRaidDifficultyID(AddOn.RaidDifficulty.Legacy10)
                elseif tostring(difficulty):lower() == "25" then SetLegacyRaidDifficultyID(AddOn.RaidDifficulty.Legacy25)
                elseif tostring(difficulty):lower() == "10h" then SetLegacyRaidDifficultyID(AddOn.RaidDifficulty.Legacy10H)
                elseif tostring(difficulty):lower() == "25h" then SetLegacyRaidDifficultyID(AddOn.RaidDifficulty.Legacy25H)
                else
                    AddOn:PrintChatMessage(WrapTextInColor("Invalid legacy raid difficulty provided.\nAccepted values:", ERROR_COLOR), WrapTextInColor("10, 25, 10h, 25h", WHITE_FONT_COLOR))
                end
            end
        },
        raid = {
            type = "input",
            name = "raid",
            desc = "Set raid difficulty.\n        Accepted values: norm, hero, myth",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "norm" then SetRaidDifficultyID(AddOn.RaidDifficulty.Normal)
                elseif tostring(difficulty):lower() == "hero" then SetRaidDifficultyID(AddOn.RaidDifficulty.Heroic)
                elseif tostring(difficulty):lower() == "myth" then SetRaidDifficultyID(AddOn.RaidDifficulty.Mythic)
                else
                    AddOn:PrintChatMessage(WrapTextInColor("Invalid raid difficulty provided.\nAccepted values:", ERROR_COLOR), WrapTextInColor("norm, hero, myth", WHITE_FONT_COLOR))
                end
            end
        },
        minimap = {
            type = "toggle",
            name = "minimap",
            desc = "Show/hide the minimap icon",
            order = counter(),
            set = function()
                AddOn.db.global.minimap.hide = not AddOn.db.global.minimap.hide
                if AddOn.db.global.minimap.hide then AddOn.Icon:Hide(name)
                else AddOn.Icon:Show(name)
                end
            end
        }
    }
}