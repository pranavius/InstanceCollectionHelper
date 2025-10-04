local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHFooter Footer that provides options for tweaking the AddOn interface as per the user's preferences
---@field Bg Texture The background texture for the footer
---@field ScaleContainer ScaleContainer
---@field OwnedContainer OwnedContainer
---@field TomTomContainer TomTomContainer
---@see ScaleContainer
---@see OwnedContainer
---@see TomTomContainer
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

------- ANNOTATIONS -------
---------------------------
---@class MinimalSliderWithSteppers A variation of the Slider element that includes buttons for stepping up or down in value by a defined increment
---@field Slider Slider A Slider bar to quickly change a value within the range of the defined minimum and maximum values
---@field Back Button Decrease value by the specified increment
---@field Forward Button Increase value by the specified increment

---@class ScaleContainer: Frame Container for the option to modify the AddOn interface scale
---@field Text FontString
---@field WindowScale MinimalSliderWithSteppers
---@see MinimalSliderWithSteppers

---@class Checkbox: CheckButton Extension of the `CheckButton` element that includes Text as a child frame
---@field Text FontString The text to display alongside the `CheckButton`

---@class OwnedContainer: Frame Container for the option to show or hide owned collectibles in the AddOn interface
---@field Checkbox Checkbox
---@see Checkbox

---@class TomTomContainer: Frame Container for the option to toggle between setting TomTom waypoints or Blizzard map pins for collectibles in the AddOn interface
---@field Checkbox Checkbox
---@see Checkbox