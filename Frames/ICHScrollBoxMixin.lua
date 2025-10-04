local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

ICHScrollBoxMixin = {}

function ICHScrollBoxMixin:InitializeScrollView()
    AddOn.ScrollBox = self
    AddOn.ScrollBar = self:GetParent().ScrollBar;

    if AddOn.Container and AddOn.ScrollBox and AddOn.ScrollBar then
        AddOn.ICHDataProvider = CreateDataProvider()
        AddOn.ScrollView = CreateScrollBoxListLinearView()
        AddOn.ScrollView:SetDataProvider(AddOn.ICHDataProvider)

        ScrollUtil.InitScrollBoxListWithScrollBar(AddOn.ScrollBox, AddOn.ScrollBar, AddOn.ScrollView)
        AddOn.ScrollView:SetElementFactory(function(factory, elementData)
            if elementData.Cost and elementData.Expansion then
                factory("ICHVendorListItemTemplate", AddOn.TimewalkingDataProviderInit)
            elseif elementData.PetItemID then
                factory("ICHListItemTemplate", AddOn.PetDataProviderInit)
            elseif elementData.ItemID then
                factory("ICHListItemTemplate", AddOn.ToyDataProviderInit)
            elseif elementData.ID then
                factory("ICHListItemTemplate", AddOn.MountDataProviderInit)
            end
        end)
        AddOn.ScrollView:SetElementExtent(AddOn.ScrollView:GetTemplateExtent("ICHListItemTemplate"))
    end
end

ICHScrollBoxMixin = CreateFromMixins(ScrollBoxListMixin, ICHScrollBoxMixin)