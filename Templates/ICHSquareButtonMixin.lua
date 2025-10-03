local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

ICHSquareButtonMixin = {}

function ICHSquareButtonMixin:OnEnter()
    if self.action == "INFO" then
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["About the AddOn"])
    else
        GameTooltip:SetOwner(self:GetParent(), "ANCHOR_NONE")
        GameTooltip:SetPoint("TOPLEFT", self:GetParent(), "TOPRIGHT")
        GameTooltip:SetText(self.action == "HELP" and L["How To Use:"] or L["Search Hints:"])
        GameTooltip:AddLine("\n")
    end
    
    if self.action == "HELP" then
        GameTooltip:AddLine("- "..L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"], 1, 1, 1)
        GameTooltip:AddLine(L["to make sure it is updated."], 1, 1, 1)
        GameTooltip:AddLine("- "..L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."], 1, 1, 1)
        GameTooltip:AddLine("- "..L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"], 1, 1, 1)
        GameTooltip:AddLine(L["are shared across difficulties."], 1, 1, 1)
        GameTooltip:AddLine("- "..L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."], 1, 1, 1)
        GameTooltip:AddLine(L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"], 1, 1, 1)
    elseif self.action == "SEARCH" then
        GameTooltip:AddLine("- "..L["\"raid\" will show all collectibles that can be collected from a raid"], 1, 1, 1)
        GameTooltip:AddLine("- "..L["\"10\" will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"], 1, 1, 1)
        GameTooltip:AddLine("- "..L["\"fel\" will show all collectibles and instances that contain \"fel\" in the name"], 1, 1, 1)
        GameTooltip:AddLine("- "..L["\"mythic\" will show all collectibles that can be obtained from a Mythic dungeon or raid"], 1, 1, 1)
        GameTooltip:AddLine("- "..L["\"lfr\" will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"], 1, 1, 1)
        GameTooltip:AddLine("- "..L["\"wotlk\" or \"wrath\" will show all collectibles that can be obtained from Wrath of the Lich King instances"], 1, 1, 1)
    end
    GameTooltip:Show()
end

function ICHSquareButtonMixin:OnLeave()
    GameTooltip:Hide()
end