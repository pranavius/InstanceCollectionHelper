local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

ICHFooterMixin = {}

function ICHFooterMixin:OnLoad()
    self.ScaleContainer.Text:SetText(L["Scale"])

    local scale = self.ScaleContainer.WindowScale
    scale.Slider:HookScript("OnMouseUp", function(slider)
        AddOn.db.global.windowScale = slider:GetValue()
        AddOn.Container:SetScale(slider:GetValue())
        AddOn:PrintDebugMessage("AddOn scale:", AddOn.db.global.windowScale)
    end)
    scale.Back:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        AddOn.db.global.windowScale = val
        AddOn.Container:SetScale(val)
        AddOn:PrintDebugMessage("AddOn scale:", AddOn.db.global.windowScale)
    end)
    scale.Forward:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        AddOn.db.global.windowScale = val
        AddOn.Container:SetScale(val)
        AddOn:PrintDebugMessage("AddOn scale:", AddOn.db.global.windowScale)
    end)

    local ownedCb = self.OwnedContainer.Checkbox
    ownedCb.Text:SetText(L["Show Owned"])
    ownedCb.Text:ClearAllPoints()
    ownedCb.Text:SetPoint("RIGHT", ownedCb, "LEFT", -5, 2)
    ownedCb.Text:SetPoint("LEFT", self.OwnedContainer, "LEFT")
    ownedCb.Text:SetJustifyH("RIGHT")
    ownedCb.Text:SetFontObject("GameTooltipText")

    ownedCb:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        AddOn.db.global.showOwned = value
        AddOn:UpdateListContents()
    end)

    local tomtomCb = self.TomTomContainer.Checkbox
    tomtomCb.Text:SetText(L["Use TomTom waypoints"])
    tomtomCb.Text:ClearAllPoints()
    tomtomCb.Text:SetPoint("RIGHT", tomtomCb, "LEFT", -5, 0)
    tomtomCb.Text:SetJustifyH("RIGHT")
    tomtomCb.Text:SetFontObject("GameTooltipText")

    tomtomCb:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        AddOn.db.global.useTomTomPoints = value
        AddOn:UpdateListContents()
    end)

    if C_AddOns.IsAddOnLoaded("TomTom") then
        self.TomTomContainer:Show()
    else
        self.TomTomContainer:Hide()
    end

    AddOn.Footer = self
end