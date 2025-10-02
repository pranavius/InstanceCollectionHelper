local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

ICHMainMixin = {}

function ICHMainMixin:OnTitleLoad()
    self.Text:SetText(AddOn.Title)
end

function ICHMainMixin:OnDragStart()
    self:StartMoving()
end

function ICHMainMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHMainMixin:OnSearchBoxTextChanged()
    AddOn:PrintDebugMessage("Search box text changed!")
    AddOn:UpdateListContents()
end