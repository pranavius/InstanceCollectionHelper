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
        AddOn:UpdateListContents()
    end)
    self.InfoButton:HookScript("OnClick", function()
        if AddOn.About then
            AddOn.About:Show()
            self:Hide()
        end
    end)

    -- Automatically hide one set of headers when the other is made visible
    hooksecurefunc(self.ListHeaders, "SetAlpha", function(_, value)
        if value > 0 then
            self.VendorListHeaders:SetAlpha(0)
            self.LemixListHeaders:SetAlpha(0)
        end
    end)
    hooksecurefunc(self.VendorListHeaders, "SetAlpha", function(_, value)
        if value > 0 then
            self.ListHeaders:SetAlpha(0)
            self.LemixListHeaders:SetAlpha(0)
        end
    end)
    hooksecurefunc(self.LemixListHeaders, "SetAlpha", function(_, value)
        if value > 0 then
            self.ListHeaders:SetAlpha(0)
            self.VendorListHeaders:SetAlpha(0)
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
    AddOn:UpdateListContents()
end
