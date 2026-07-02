local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHFooter
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

    local availableCb = self.AvailableContainer.Checkbox
    availableCb.Text:SetText(L["Show Available Only"])
    availableCb.Text:ClearAllPoints()
    availableCb.Text:SetPoint("RIGHT", availableCb, "LEFT", -5, 2)
    availableCb.Text:SetPoint("LEFT", self.AvailableContainer, "LEFT")
    availableCb.Text:SetJustifyH("RIGHT")
    availableCb.Text:SetFontObject("GameTooltipText")

    availableCb:HookScript("OnClick", function(cb)
        AddOn.db.global.showAvailableOnly = cb:GetChecked()
        if cb:GetChecked() then
            AddOn.db.global.showOwned = false
            ownedCb:SetChecked(false)
        end
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)
    availableCb:HookScript("OnEnter", function(cb)
        GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Only show collectibles that can still be looted this week"], 1, 1, 1)
        GameTooltip:Show()
    end)
    availableCb:HookScript("OnLeave", function() GameTooltip:Hide() end)

    ownedCb:HookScript("OnClick", function(cb)
        AddOn.db.global.showOwned = cb:GetChecked()
        if cb:GetChecked() then
            AddOn.db.global.showAvailableOnly = false
            availableCb:SetChecked(false)
        end
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)
    ownedCb:HookScript("OnEnter", function(cb)
        GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Also show collectibles you already own"], 1, 1, 1)
        GameTooltip:Show()
    end)
    ownedCb:HookScript("OnLeave", function() GameTooltip:Hide() end)

    local tomtomCb = self.TomTomContainer.Checkbox
    tomtomCb.Text:SetText(L["Use TomTom waypoints"])
    tomtomCb.Text:ClearAllPoints()
    tomtomCb.Text:SetPoint("RIGHT", tomtomCb, "LEFT", -5, 0)
    tomtomCb.Text:SetJustifyH("RIGHT")
    tomtomCb.Text:SetFontObject("GameTooltipText")

    tomtomCb:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        AddOn.db.global.useTomTomPoints = value
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)
    tomtomCb:HookScript("OnEnter", function(cb)
        GameTooltip:SetOwner(cb, "ANCHOR_RIGHT")
        GameTooltip:SetText(L["Use TomTom waypoints instead of Blizzard map pins"], 1, 1, 1)
        GameTooltip:Show()
    end)
    tomtomCb:HookScript("OnLeave", function() GameTooltip:Hide() end)

    if C_AddOns.IsAddOnLoaded("TomTom") then
        self.TomTomContainer:Show()
    else
        self.TomTomContainer:Hide()
    end

    AddOn.Footer = self
end
