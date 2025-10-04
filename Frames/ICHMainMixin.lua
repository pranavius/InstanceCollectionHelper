local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

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
        else
            AddOn:PrintChatMessage("[REMOVE LATER]", "About ICH - Frame not found")
        end
    end)

    -- Automatically hide one set of headers when the other is made visible
    hooksecurefunc(self.ListHeaders, "SetAlpha", function(_, value)
        if value > 0 then self.TimewalkingListHeaders:SetAlpha(0) end
    end)
    hooksecurefunc(self.TimewalkingListHeaders, "SetAlpha", function(_, value)
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