local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

function AddOn:CreateDecorCache()
    ---@type table<number, CacheDataBase>
    self.DecorCache = {}
    local toLoad = #self.DecorItems

    for _, item in ipairs(self.DecorItems) do
        Item:CreateFromItemID(item.DecorItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local iconID = select(5, C_Item.GetItemInfoInstant(item.DecorItemID))

            self.DecorCache[item.DecorItemID] = {
                itemName = C_Item.GetItemNameByID(item.DecorItemID) or "",
                itemID = item.DecorItemID,
                iconID = iconID or 134400,
            }

            if toLoad == 0 then
                self:PrintDebugMessage("Decor data loaded")
                self.WorldTour:BuildRoute(true)
                self.WorldTour:RefreshWindowIfShown()
            end
        end)
    end
end

---Initializes how decor data in the scrollable list should be displayed
---@param frame ICHListItem
---@param item DecorItem
function AddOn.DecorDataProviderInit(frame, item)
    if not frame or not item then return end
    local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(item.DecorItemID)
    if not decor then return end

    -- Augment search tags from live catalog data before the list runs filtering
    local searchTags = item.SearchTags
    for _, tag in pairs(decor.dataTagsByID) do
        if not tContains(searchTags, tag) then tinsert(searchTags, tag) end
    end
    if decor.isAllowedIndoors then tinsert(searchTags, "indoors") end
    if decor.isAllowedOutdoors then tinsert(searchTags, "outdoors") end
    item.SearchTags = searchTags

    AddOn.InstanceListItemInit(frame, item, {
        isMount = false,
        getInfo = function(d)
            ---@cast d DecorItem
            local isOwned = decor.quantity and decor.numPlaced and (decor.quantity + decor.numPlaced > 0) or false ---@diagnostic disable-line: undefined-field
            local iconID = select(5, C_Item.GetItemInfoInstant(d.DecorItemID))
            return decor.name, iconID, isOwned, d.DecorItemID
        end,
        onNameClick = function()
            if not C_AddOns.IsAddOnLoaded("Blizzard_HousingModelPreview") then
                AddOn:PrintDebugMessage("Loading Blizz Housing Model Preview module")
                C_AddOns.LoadAddOn("Blizzard_HousingModelPreview")
            end
            HousingModelPreviewFrame:ShowCatalogEntryInfo(decor)
        end
    })
end
