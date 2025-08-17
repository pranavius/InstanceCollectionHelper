local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

function AddOn:CreateTabSystem()
    self.Tabs = CreateFrame("Frame", nil, self.Footer, "TabSystemTemplate")
    self:CreateTab("Mounts")
    self:CreateTab("Toys")
    self:CreateTab("Pets")
    self.Tabs:SetTabSelectedCallback(function(tabID) self:HandleTabSelected(tabID) end)
    self.Tabs:SetPoint("TOPLEFT", self.Footer, "BOTTOMLEFT", 0, 0)
    self.Tabs:SetPoint("TOPRIGHT", self.Footer, "BOTTOMRIGHT", 0, 0)
end

function AddOn:CreateTab(tabName)
    local parentKey = tabName .. "Tab"
     self.Tabs[parentKey] = self.Tabs:AddTab(tabName)
end

function AddOn:HandleTabSelected(tabID)
    if tabID == self.Tabs.MountsTab then
        self.ScrollView:SetElementInitializer("ICHListItemTemplate", self.MountDataProviderInit)
    end
end