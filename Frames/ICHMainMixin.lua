local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class ICHMain
ICHMainMixin = {}

function ICHMainMixin:OnLoad()
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self:GetName())

    self.Title:SetText(AddOn.Title)

    self.SearchBox:HookScript("OnTextChanged", function()
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)
    self.AboutButton:HookScript("OnClick", function()
        if AddOn.About then
            AddOn.About:Show()
            self:Hide()
        end
    end)
    self.SettingsButton:HookScript("OnClick", function()
        if AddOn.Settings and not AddOn.Settings:IsShown() then
            AddOn.Settings:Show()
        end
    end)

    -- "Show" all header frames so they become visible/invisible correctly when modifying alpha
    self.VendorListHeaders:Show()

    -- Capture base frame levels for header rows to elevate the active frame and demote the inactive one
    -- without drifting on repeated tab switches.
    local listHeadersLevel = self.ListHeaders:GetFrameLevel()
    local vendorListHeadersLevel = self.VendorListHeaders:GetFrameLevel()

    -- Automatically hide one set of headers when the other is made visible
    -- Also controls frame levels for headers to ensure the correct headers' sort buttons are clickable
    hooksecurefunc(self.ListHeaders, "SetAlpha", function(headers, value)
        ---@cast headers Frame
        for _, header in ipairs({ headers:GetChildren() }) do
            ---@cast header Button
            header:SetEnabled(value > 0)
        end
        if value > 0 then
            headers:SetFrameLevel(listHeadersLevel)
            self.VendorListHeaders:SetAlpha(0)
            self.VendorListHeaders:SetFrameLevel(listHeadersLevel - 1)
        end
    end)
    hooksecurefunc(self.VendorListHeaders, "SetAlpha", function(headers, value)
        ---@cast headers Frame
        for _, header in ipairs({ headers:GetChildren() }) do
            ---@cast header Button
            header:SetEnabled(value > 0)
        end
        if value > 0 then
            headers:SetFrameLevel(vendorListHeadersLevel)
            self.ListHeaders:SetAlpha(0)
            self.ListHeaders:SetFrameLevel(vendorListHeadersLevel - 1)
        end
    end)
    
    AddOn.Container = self
end

function ICHMainMixin:OnDragStart()
    self:StartMoving()
end

function ICHMainMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHMainMixin:OnShow()
    if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then UIParentLoadAddOn("Blizzard_Collections") end
    if not C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then UIParentLoadAddOn("Blizzard_EncounterJournal") end
    EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
end
