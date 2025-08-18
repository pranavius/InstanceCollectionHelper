local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

function AddOn:CreateTabSystem()
    self.Tabs = CreateFrame("Frame", nil, self.Footer, "TabSystemTemplate")
    self:CreateTab("Mounts")
    self:CreateTab("Toys")
    self:CreateTab("Pets", false)
    self.Tabs:GetTabButton(self.Tabs.PetsTab):SetTooltipText("Coming soon™")
    self.Tabs:SetTabSelectedCallback(function(tabID) self:HandleTabSelected(tabID) end)
    self.Tabs:SetPoint("TOPLEFT", self.Footer, "BOTTOMLEFT", 0, 0)
    self.Tabs:SetPoint("TOPRIGHT", self.Footer, "BOTTOMRIGHT", 0, 0)
end

function AddOn:CreateTab(tabName, enabled)
    local parentKey = tabName .. "Tab"
     self.Tabs[parentKey] = self.Tabs:AddTab(tabName)

     if enabled ~= nil then
        self.Tabs:SetTabEnabled(self.Tabs[parentKey], enabled)
     end
end

function AddOn:HandleTabSelected(tabID)
    self.db.global.selectedTab = tabID
    self:UpdateListContents("TAB_CHANGE")
end