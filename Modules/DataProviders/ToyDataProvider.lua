local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

function AddOn:CreateToyCache()
    ---@type table<number, ToyCacheData>
    self.ToyCache = {}
    local toLoad = #self.Toys

    for _, toy in ipairs(self.Toys) do
        Item:CreateFromItemID(toy.ItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local _, toyName, iconID = C_ToyBox.GetToyInfo(toy.ItemID)

            self.ToyCache[toy.ItemID] = {
                itemName = C_Item.GetItemNameByID(toy.ItemID) or "",
                itemID = toy.ItemID,
                toyName = toyName or toy.Name,
                iconID = iconID or 134400,
            }

            if toLoad == 0 then
                self:PrintDebugMessage("Toy data loaded")
                self.WorldTour:BuildRoute(true)
                self.WorldTour:RefreshWindowIfShown()
            end
        end)
    end
end

---Initializes how toy data in the scrollable list should be displayed
---@param frame ICHListItem
---@param toy Toy
function AddOn.ToyDataProviderInit(frame, toy)
    AddOn.InstanceListItemInit(frame, toy, {
        isMount = false,
        cache = AddOn.ToyCache,
        cacheKey = function(d) return d.ItemID end,
        getInfo = function(d, cached)
            return cached.toyName, cached.iconID, PlayerHasToy(d.ItemID), d.ItemID
        end
    })
end
