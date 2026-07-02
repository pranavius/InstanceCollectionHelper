local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Initializes the tab system for viewing different types of collectibles available in instances
function AddOn:CreateTabSystem()
    self.Tabs = CreateFrame("Frame", "ICHTabs", self.Footer, "TabSystemTemplate")
    self.Tabs.minTabWidth = 120
    self.Tabs.maxTabWidth = 200
    -- Noticed some weird clipping when moving the window over CDM frames, so this is being added to try and resolve that
    self.Tabs:SetFrameLevel(self.Footer:GetFrameLevel() - 1)
    self:CreateTab("Mounts")
    self:CreateTab("Toys")
    self:CreateTab("Pets")
    self:CreateTab("Decor")
    self:CreateTab("Timewalking Vendor")
    self.Tabs:SetTabSelectedCallback(function(tabID) self:HandleTabSelected(tabID) end)
    self.Tabs:SetPoint("TOPLEFT", self.Footer, "BOTTOMLEFT", 0, 0)
    self.Tabs:SetPoint("TOPRIGHT", self.Footer, "BOTTOMRIGHT", 0, 0)
end

---Adds a tab to the existing tab system and creates a variable in the AddOn table for easy reference in the future
---@param tabName string The text displayed on the newly created tab
---@param enabled? boolean Whether the tab should be enabled or not (tabs are enabled by default if no value is provided)
function AddOn:CreateTab(tabName, enabled)
    local parentKey = tabName:gsub("%A", "") .. "Tab"
    self.Tabs[parentKey] = self.Tabs:AddTab(L[tabName])
    self.Tabs:GetTabButton(self.Tabs[parentKey]):UpdateTabWidth()
    self.Tabs:GetTabButton(self.Tabs[parentKey]):SetFrameLevel(self.Tabs:GetFrameLevel())
    if enabled ~= nil then self.Tabs:SetTabEnabled(self.Tabs[parentKey], enabled) end
    self:PrintDebugMessage(parentKey, "Created")
end

---Callback method that is fired when the active tab is changed
---@param tabID number ID number for the new active tab
function AddOn:HandleTabSelected(tabID)
    self.db.global.selectedTab = tabID
    self.sortState = self.defaultSortState
    self:PrintDebugMessage("Selected tab:", self.Tabs:GetTabButton(tabID).tabText)
    if tabID == self.Tabs.TimewalkingVendorTab then
        self.Container.VendorListHeaders:SetAlpha(1)
    else
        self.Container.ListHeaders:SetAlpha(1)
    end
    EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
end
