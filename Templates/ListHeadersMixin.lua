local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

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