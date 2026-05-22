local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

function AddOn:CreatePetCache()
    ---@type table<number, PetCacheData>
    self.PetCache = {}
    local toLoad = #self.Pets

    for _, pet in ipairs(self.Pets) do
        Item:CreateFromItemID(pet.PetItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(pet.PetItemID)

            self.PetCache[pet.PetItemID] = {
                itemName = C_Item.GetItemNameByID(pet.PetItemID) or "",
                itemID = pet.PetItemID,
                petName = petName or pet.Name,
                iconID = iconID or 134400,
                speciesID = speciesID,
            }

            if toLoad == 0 then self:PrintDebugMessage("Pet data loaded") end
        end)
    end
end

---Initializes how pet data in the scrollable list should be displayed
---@param frame ICHListItem
---@param pet Pet
function AddOn.PetDataProviderInit(frame, pet)
    AddOn.InstanceListItemInit(frame, pet, {
        isMount = false,
        cache = AddOn.PetCache,
        cacheKey = function(d) return d.PetItemID end,
        hasPetCount = true,
        getInfo = function(d, cached)
            return cached.petName, cached.iconID, AddOn.GetIsPetOwned(cached.speciesID), d.PetItemID
        end,
        afterRender = function(f, _, cached)
            local owned, limit = AddOn.GetPetOwnedAndLimitCount(cached.speciesID)
            f.OtherInfoContainer.ICHPetCount:SetText(AddOn.ColorOwnedPetCountText(owned, limit))
            f.OtherInfoContainer.ICHPetCount:Show()
        end
    })
end
