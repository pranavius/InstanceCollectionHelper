local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHListHeaders : Frame Column headers for the currently viewed list of collectibles
---@field BorderBottom Texture A separator between the list headers and the list items in the AddOn interface
---@field NameHeader FontString
---@field InstanceHeader? FontString Exclusive to `ICHListItemTemplate`
---@field DiffHeader? FontString Exclusive to `ICHListItemTemplate`
---@field TypeHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field ExpansionHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field CostHeader? FontString Exclusive to `ICHVendorListItemTemplate`

---@class ICHListHeaders
ICHListHeadersMixin = {}

function ICHListHeadersMixin:OnLoad()
    self.NameHeader:SetText(L["Name"])
    -- Both InstanceHeader and DiffHeader and exclusive to the regular list headers
    if self.InstanceHeader then
        self.InstanceHeader:SetText(L["Instance"])
        self.DiffHeader:SetText(L["Available Difficulty(s)"])
    end
    -- TypeHeader, ExpansionHeader, and CostHeader are all exclusive to the vendor list headers
    if self.TypeHeader then
        self.TypeHeader:SetText(L["Type"])
        self.ExpansionHeader:SetText(L["Expansion"])
        self.CostHeader:SetText(L["Cost"])
    end
end