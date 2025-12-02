local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class ICHScrollBox : Frame
---@retail@
ICHScrollBoxMixin = CreateFromMixins(ScrollBoxListMixin, {})
--@end-retail@
--@version-mists@
ICHScrollBoxMixin = {}
local sblMixin = ScrollBoxListMixin
for k, v in pairs(sblMixin) do
    ICHScrollBoxMixin[k] = v
end
--@end-version-mists@

function ICHScrollBoxMixin:InitializeScrollView()
    AddOn.ScrollBox = self
    AddOn.ScrollBar = ICHScrollBar

    if AddOn.Container and AddOn.ScrollBox and AddOn.ScrollBar then
        AddOn.ICHDataProvider = CreateDataProvider()
        AddOn.ScrollView = CreateScrollBoxListLinearView()

        ScrollUtil.InitScrollBoxListWithScrollBar(AddOn.ScrollBox, AddOn.ScrollBar, AddOn.ScrollView)
        AddOn.ScrollView:SetElementFactory(function(factory, elementData)
            if elementData.IsLemixExclusive ~= nil then
                factory("ICHLemixListItemTemplate", AddOn.LemixDataProviderInit)
            elseif elementData.Cost and elementData.Expansion then
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

        AddOn.ScrollView:SetDataProvider(AddOn.ICHDataProvider)
    end
end
