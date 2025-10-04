local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class DifficultyButton: Button Sets instance difficulty to the associated value
---@field difficultyID integer ID number for instance, scenario, and raid difficulty (see https://wago.tools/db2/Difficulty)
---@field sharedDifficulties table<RaidDifficulty, RaidDifficulty> Difficulties that share a lockout with the associated `difficultyID`
---@field ButtonTint Texture A texture applied over the button to recolor it based on instance type
---@field TintMask MaskTexture A texture mask applied over `ButtonTint` to prevent the color from bleeding past the boundaries of the button art
DifficultyButtonMixin = CreateFromMixins(UIPanelButtonMixin) or {}

function DifficultyButtonMixin:OnEnter()
    if self.difficultyID ~= -1 then
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(AddOn:GetInstanceDifficultyText(self.difficultyID))
        if self.sharedDifficulties then
            GameTooltip:AddLine("\n")
            GameTooltip:AddLine(L["Shares lockout with:"], 1, 1, 1)
            for shared, _ in pairs(self.sharedDifficulties) do
                GameTooltip:AddLine("- "..AddOn:GetInstanceDifficultyText(shared))
            end
        end
        GameTooltip:Show()
    end
end

function DifficultyButtonMixin:OnLeave()
    GameTooltip:Hide()
end

function DifficultyButtonMixin:OnClick()
    if self.difficultyID ~= -1 then
        if self.difficultyID ~= AddOn.RaidDifficulty.LegacyLFR and self.difficultyID ~= AddOn.RaidDifficulty.LFR then
            AddOn:SetInstanceDifficulty(self.difficultyID)
        else
            local lfrMessage = DARKYELLOW_FONT_COLOR:WrapTextInColorCode(L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."])
            AddOn:PrintChatMessage(lfrMessage)
        end
    end
end

