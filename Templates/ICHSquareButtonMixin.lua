local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHSquareButton
ICHSquareButtonMixin = {}

---@param tooltip GameTooltip
---@param action string
local function populateGuideTooltip(tooltip, action)
    if action == "HELP" then
        tooltip:AddLine("- "..L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on to make sure it is updated."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts are shared across difficulties."], 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine("- "..L["Waypoint tracking on the minimap may not always appear until you are in a specific zone. For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder."], 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine("- "..L["Click the star icon on any item to mark or unmark it as a favorite. Favorited items are always pinned to the top of the list."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Click a column header to sort the list by that column. Click again to reverse the order, or a third time to clear the sort."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Click on a collectible's icon to preview it in a dressing room window."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Use the checkboxes at the bottom of the window to control which items appear in the list."], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Enable the mini-window in settings or with /ich mini to see available collectibles while inside an instance."], 1, 1, 1, true)
    elseif action == "SEARCH" then
        tooltip:AddLine("- "..L["raid will show all collectibles that can be collected from a raid"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["dungeon will show all collectibles that can be collected from a dungeon"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["fel will show all collectibles and instances that contain fel in the name"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["lich king will show all collectibles dropped by The Lich King"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["northrend will show all collectibles from instances in Northrend"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Other expansion abbreviations are also supported: tbc, cata, mop, wod, bfa, sl, df, tww"], 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine("- "..L["wrath|cata will show all collectibles from Wrath of the Lich King or Cataclysm"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["dungeon !heroic will show all dungeon collectibles not available on Heroic difficulty"], 1, 1, 1, true)
        tooltip:AddLine("- "..L["Adjacent terms are combined with AND by default. Use parentheses to group terms, e.g. (wrath|cata) !heroic"], 1, 1, 1, true)
    end
end

function ICHSquareButtonMixin:OnEnter()
    if self.action == "INFO" then
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["About the AddOn"])
        GameTooltip:Show()
    elseif self.action == "SETTINGS" then
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(L["Settings"])
        GameTooltip:Show()
    end
end

function ICHSquareButtonMixin:OnLeave()
    GameTooltip:Hide()
end

---@param button string
function ICHSquareButtonMixin:OnClick(button)
    if self.action ~= "HELP" and self.action ~= "SEARCH" then return end

    ---@type ICHGuideTooltip
    local tooltip = ICHMain.GuideTooltip
    if tooltip:IsShown() and tooltip.activeAction == self.action then
        tooltip:Hide()
        tooltip.activeAction = nil
    else
        tooltip:SetOwner(self:GetParent(), "ANCHOR_NONE")
        tooltip:SetPoint("TOPLEFT", ICHMain, "TOPRIGHT")
        tooltip:SetPoint("BOTTOMLEFT", ICHMain, "BOTTOMRIGHT")
        tooltip:ClearLines()
        tooltip:SetText(self.action == "HELP" and L["How To Use:"] or L["Search Hints:"])
        tooltip:AddLine(" ")
        populateGuideTooltip(tooltip, self.action)
        tooltip:Show()
        tooltip.activeAction = self.action
    end
end