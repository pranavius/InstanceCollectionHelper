local name, AddOn = ...
---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
AddOn = LibStub("AceAddon-3.0"):NewAddon(name, "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

AddOn.DatabaseDefaults = {
    global = {
        minimap = { hide = false }
    }
}

AddOn.Icon = LibStub("LibDBIcon-1.0")

function AddOn:PrintChatMessage(...)
    print("|cFF00CCFFInstance Collection Helper: |r", ...)
end

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

    if dKey == "Normal" then return "N"
    elseif dKey == "Heroic" then return "H"
    elseif dKey == "Mythic" then return "M"
    elseif dKey == "Legacy10" then return "10"
    elseif dKey == "Legacy25" then return "25"
    elseif dKey == "Legacy10H" then return "10H"
    elseif dKey == "Legacy25H" then return "25H"
    end

    return "?"
end

function AddOn:GetDifficultyButtonTooltipText(difficultyID)
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
                print(WrapTextInColor("Dungeon Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetDifficultyButtonTooltipText(GetDungeonDifficultyID()))
                print(WrapTextInColor("Legacy Raid Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetDifficultyButtonTooltipText(GetLegacyRaidDifficultyID()))
                print(WrapTextInColor("Raid Difficulty:", DARKYELLOW_FONT_COLOR), AddOn:GetDifficultyButtonTooltipText(GetRaidDifficultyID()))
            end
        },
        -- dn = {
        --     type = "execute",
        --     name = "dn",
        --     desc = "Set dungeon difficulty to Normal",
        --     order = counter(),
        --     func = function()
        --         SetDungeonDifficultyID(1)
        --     end
        -- },
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