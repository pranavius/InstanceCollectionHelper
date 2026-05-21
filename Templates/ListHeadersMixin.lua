local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHListHeaders
ICHListHeadersMixin = {}

function ICHListHeadersMixin:OnLoad()
    self.NameHeader.Text:SetText(L["Name"])
    -- InstanceHeader and DiffHeader are exclusive to the regular list headers
    if self.InstanceHeader then
        self.InstanceHeader.Text:SetText(L["Instance"])
        self.DiffHeader:SetPoint("LEFT", self.InstanceHeader, "RIGHT")
        self.DiffHeader:SetText(L["Available Difficulty(s)"])
    end
    -- TypeHeader, ExpansionHeader, and CostHeader are exclusive to the vendor list headers
    if self.TypeHeader then
        self.TypeHeader.Text:SetText(L["Type"])
        self.ExpansionHeader.Text:SetText(L["Expansion"])
        self.CostHeader.Text:SetText(L["Cost"])
    end

    local function handleHeaderOnEnter(header, column)
        GameTooltip:SetOwner(header, "ANCHOR_BOTTOM")
        -- Special case for name column: since the default sort state is by Name ascending, there is no sort to clear on this column
        -- Applies to all lists
        if AddOn.sortState.column == "Name" and AddOn.sortState.direction == "desc" then
            GameTooltip:SetText(L["Sort ascending"])
        elseif AddOn.sortState.column == column then
            if AddOn.sortState.direction == "asc" then
                GameTooltip:SetText(L["Sort descending"])
            else
                GameTooltip:SetText(L["Clear sort"])
            end
        else
            GameTooltip:SetText(L["Sort ascending"])
        end
        GameTooltip:Show()
    end

    local function setupSortButton(header, column)
        if not header then return end
        header:SetScript("OnEnter", function() handleHeaderOnEnter(header, column) end)
        header:SetScript("OnLeave", function() GameTooltip:Hide() end)
        header:SetScript("OnClick", function()
            AddOn:CycleSortState(column)
            handleHeaderOnEnter(header, column)
            EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
        end)
        header.SortIndicator:ClearAllPoints()
        header.SortIndicator:SetPoint("LEFT", header.Text, "RIGHT", 10, 0)
    end

    setupSortButton(self.NameHeader, "Name")
    setupSortButton(self.InstanceHeader, "Instance")
    setupSortButton(self.TypeHeader, "Type")
    setupSortButton(self.ExpansionHeader, "Expansion")
    setupSortButton(self.CostHeader, "Cost")
end
