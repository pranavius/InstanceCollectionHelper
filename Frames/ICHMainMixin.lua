local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class ICHMain : Frame AddOn interface
---@field Title FontString The name of the AddOn
---@field SearchBox EditBox An input field that allows users to search for a collectible in the currently viewed list
---@field InfoButton ICHSquareButton
---@field ListHeaders ICHListHeaders
---@field VendorListHeaders ICHListHeaders
---@see ICHSquareButton
---@see ICHListHeaders
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
        if value > 0 then self.VendorListHeaders:SetAlpha(0) end
    end)
    hooksecurefunc(self.VendorListHeaders, "SetAlpha", function(_, value)
        if value > 0 then self.ListHeaders:SetAlpha(0) end
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
    AddOn:UpdateListContents()
end

------- ANNOTATIONS -------
---------------------------
---@class ICHListHeaders : Frame Column headers for the currently viewed list of collectibles
---@field BorderBottom Texture A separator between the list headers and the list items in the AddOn interface
---@field NameHeader FontString
---@field InstanceHeader? FontString Exclusive to `ICHListItemTemplate`
---@field DiffHeader? FontString Exclusive to `ICHListItemTemplate`
---@field TypeHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field ExpansionHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field CostHeader? FontString Exclusive to `ICHVendorListItemTemplate`