local name, AddOn = ...
---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
AddOn = LibStub("AceAddon-3.0"):NewAddon(name, "AceConsole-3.0", "AceEvent-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

AddOn.DatabaseDefaults = {
    global = {
        minimap = { hide = false },
        windowScale = 1,
        showOwned = false,
        useTomTomPoints = true,
        currentTomTomWaypoint = nil,
        selectedTab = nil,
        countPetOwnedOnlyIfMaxOwned = false,
        debugMessages = false,
        ownedCosmeticsCache = {}
    }
}

AddOn.Icon = LibStub("LibDBIcon-1.0")

---@param difficultyID number ID associated with an instance difficulty
---@return string "The text to be shown on the button that sets the desired instance difficulty"
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
                print(L["Dungeon Difficulty:"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(AddOn:GetInstanceDifficultyText(GetDungeonDifficultyID())))
                print(L["Legacy Raid Difficulty:"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(AddOn:GetInstanceDifficultyText(GetLegacyRaidDifficultyID())))
                print(L["Raid Difficulty:"], DARKYELLOW_FONT_COLOR:WrapTextInColorCode(AddOn:GetInstanceDifficultyText(GetRaidDifficultyID())))
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
                    AddOn:PrintChatMessage(ERROR_COLOR:WrapTextInColorCode(L["Invalid dungeon difficulty provided."].."\n"..L["Accepted values:"]), WHITE_FONT_COLOR:WrapTextInColorCode("norm, hero, myth"))
                end
            end
        },
        lraid = {
            type = "input",
            name = "lraid",
            desc = L["Set legacy raid difficulty."].."\n        "..L["Accepted values:"].." 10, 25, 10h, 25h, 40",
            order = counter(),
            set = function(_, difficulty)
                if tostring(difficulty):lower() == "10" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy10)
                elseif tostring(difficulty):lower() == "25" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy25)
                elseif tostring(difficulty):lower() == "10h" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy10H)
                elseif tostring(difficulty):lower() == "25h" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy25H)
                elseif tostring(difficulty):lower() == "40" then AddOn:SetInstanceDifficulty(AddOn.RaidDifficulty.Legacy40)
                else
                    AddOn:PrintChatMessage(ERROR_COLOR:WrapTextInColorCode(L["Invalid legacy raid difficulty provided."].."\n"..L["Accepted values:"]), WHITE_FONT_COLOR:WrapTextInColorCode("10, 25, 10h, 25h, 40"))
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
                    AddOn:PrintChatMessage(ERROR_COLOR:WrapTextInColorCode(L["Invalid raid difficulty provided."].."\n"..L["Accepted values:"]), WHITE_FONT_COLOR:WrapTextInColorCode("norm, hero, myth"))
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