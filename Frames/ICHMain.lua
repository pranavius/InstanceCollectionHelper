local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

ICHMainMixin = {}

function ICHMainMixin:OnLoad()
    self.Text:SetText(name)
end

function ICHMainMixin:OnDragStart() self:StartMoving() end

function ICHMainMixin:OnDragStop() self:StopMovingOrSizing() end