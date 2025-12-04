local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class DifficultyButton
--@retail@
DifficultyButtonMixin = CreateFromMixins(UIPanelButtonMixin, {})
--@end-retail@
--@version-mists@
DifficultyButtonMixin = {}
for k,v in pairs(UIButtonFitToTextBehaviorMixin) do
    DifficultyButtonMixin[k] = v
end
--@end-version-mists@

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

