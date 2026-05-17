local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---Initializes how decor data in the scrollable list should be displayed
---@param frame ICHListItem
---@param item DecorItem
---@see ICHListItem
---@see DecorItem
function AddOn.DecorDataProviderInit(frame, item)
    if not frame or not item then return end
    local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(item.DecorItemID, true)
    if not decor then return end

    -- Augment search tags from live catalog data before the list runs filtering
    local searchTags = item.SearchTags
    for _, tag in pairs(decor.dataTagsByID) do
        if not TableContains(searchTags, tag) then tinsert(searchTags, tag) end
    end
    if decor.isAllowedIndoors then tinsert(searchTags, "indoors") end
    if decor.isAllowedOutdoors then tinsert(searchTags, "outdoors") end
    item.SearchTags = searchTags

    AddOn.InstanceListItemInit(frame, item, {
        isMount = false,
        getInfo = function(d)
            local isOwned = decor.quantity and decor.numPlaced and (decor.quantity + decor.numPlaced > 0) or false
            local iconID = select(5, C_Item.GetItemInfoInstant(d.DecorItemID))
            return decor.name, iconID, isOwned, d.DecorItemID
        end
    })
end
