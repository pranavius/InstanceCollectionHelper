local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class LemixCacheData
---@

function AddOn:CreateLemixCache()
    ---@type LemixCacheData
    self.LemixCache = {}
    local toLoad = #self.LemixItems

    for _, item in ipairs(self.LemixItems) do
        Item:CreateFromItemID(item.ItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            if item.Type == "Mount" then
                local mountID = C_MountJournal.GetMountFromItem(item.ItemID)
                local name, spellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(mountID)
                local iconID = C_Spell.GetSpellInfo(spellID) and C_Spell.GetSpellInfo(spellID).originalIconID

                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = name or item.Name,
                    iconID = iconID or 134400,
                    mountID = mountID,
                    owned = isOwned
                }
            elseif item.Type == "Toy" then
                local _, toyName, iconID = C_ToyBox.GetToyInfo(item.ItemID)
    
                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = toyName or item.Name,
                    iconID = iconID or 134400,
                    owned = PlayerHasToy(item.ItemID)
                }
            elseif item.Type == "Pet" then
                local petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(item.ItemID)
                local owned, limit
                if speciesID then
                    local o, l = C_PetJournal.GetNumCollectedInfo(speciesID)
                    owned = o or 0
                    limit = l or 0
                else
                    owned, limit = 0, 0
                end
        
                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = petName or item.Name,
                    iconID = iconID or 134400,
                    speciesID = speciesID,
                    owned = owned,
                    limit = limit
                }
            elseif item.Type == "Cosmetic" then
                -- Do cosmetic stuff
            end

            if toLoad == 0 then self:PrintDebugMessage("Timewalking data loaded") end
        end)
    end
end