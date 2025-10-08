local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class LemixCacheData
---@field itemName string Localized name for the item that adds the collectible to the collection
---@field itemID integer ID number for the item that adds the collectible to the collection
---@field collectibleName string Localized collectible name
---@field iconID integer ID for the icon associated with the collectible
---@field mountID? integer ID number for the mount (applies to mounts only)
---@field speciesID? integer ID for the pet species (applies to pets only)
---@field owned integer|boolean If the collectible is a pet, this is the number of the pet currently owned. For other collectibles, this is `true` if owned and `false` otherwise
---@field limit? integer Maximum number of the pet that can be owned (applies to pets only)

---@class LemixResourceCacheData
---@field itemName string
---@field itemID integer
---@field iconID integer

local function GetItemIDForTransmogSource(item)
    if item.ItemID == 255006 then
        return 255009
    elseif item.ItemID == 242368 then
        return 141006
    elseif item.ItemID == 253273 then
        return 253283
    end
    return item.ItemID
end

function AddOn:CreateLemixCache()
    ---@type table<integer, LemixCacheData> Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets
    self.LemixCache = {}
    ---@type table<integer, LemixResourceCacheData>
    self.LemixResourceCache = {}
    local toLoad = #self.LemixItems

    for _, item in ipairs(self.LemixItems) do
        Item:CreateFromItemID(item.ItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            if item.Type == "Mount" then
                -- TODO: Replace with better fix for Scornwing Flight Form later
                if item.ItemID == 253024 then
                    local name, _, _, _, _, _, _, _, _, iconID = C_Item.GetItemInfo(item.ItemID)
                    local isOwned = C_SpellBook.IsSpellInSpellBook(1255451)
                    self.LemixCache[item.ItemID] = {
                        itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                        itemID = item.ItemID,
                        collectibleName = name or item.Name,
                        iconID = iconID or 134400,
                        mountID = 999999,
                        owned = isOwned
                    }
                else
                    local mountID = C_MountJournal.GetMountFromItem(item.ItemID)
                    if not mountID then DevTools_Dump(item) end
                    local name, spellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(mountID)
                    local iconID = C_Spell.GetSpellInfo(spellID) and C_Spell.GetSpellInfo(spellID).originalIconID
    
                    self.LemixCache[item.ItemID] = {
                        itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                        itemID = item.ItemID,
                        collectibleName = name or item.Name,
                        iconID = iconID or 134400,
                        mountID = mountID,
                        owned = isOwned
                    }
                end
            elseif item.Type == "Toy" then
                local _, toyName, iconID = C_ToyBox.GetToyInfo(item.ItemID)
    
                self.LemixCache[item.ItemID] = {
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
        
                self.LemixCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = petName or item.Name,
                    iconID = iconID or 134400,
                    speciesID = speciesID,
                    owned = owned,
                    limit = limit
                }
            elseif item.Type == "Cosmetic" then
                local itemForCosmeticSource = Item:CreateFromItemID(GetItemIDForTransmogSource(item))
                if itemForCosmeticSource:GetItemID() then
                    itemForCosmeticSource:ContinueOnItemLoad(function()
                        self:PrintDebugMessage("Player knows transmog for", item.Name, C_TransmogCollection.PlayerHasTransmog(item.ItemID))
                        self.LemixCache[item.ItemID] = {
                            itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                            itemID = item.ItemID,
                            collectibleName = item.Name,
                            iconID = itemForCosmeticSource:GetItemIcon() or 134400,
                            owned = C_TransmogCollection.PlayerHasTransmog(item.ItemID)
                        }
                    end)
                else
                    self:PrintDebugMessage("Couldnt get item for cosmetic source:", item.Name)
                end
            end
            if toLoad == 0 then self:PrintDebugMessage("Legion: Remix data loaded") end
        end)

        -- Special: For items that are considered Additional Resources, cache these separately
        if item.AdditionalResource then
            Item:CreateFromItemID(item.AdditionalResource.ItemID):ContinueOnItemLoad(function()
                local itemName, _, _, _, _, _, _, _, _, iconID = C_Item.GetItemInfo(item.AdditionalResource.ItemID)
                self.LemixResourceCache[item.AdditionalResource.ItemID] = {
                    itemName = itemName or L["Unknown"],
                    itemID = item.AdditionalResource.ItemID,
                    iconID = iconID or 134400,
                }
            end)
        end
    end
end

---Formats and returns text indicating the number of a pet owned against the maximum number that can be owned<br/>
---This is a variation on the function `ColorOwnedCountText` that is local to `PetDataProvider.lua` adapted for `LemixCacheData` objects
---@param data LemixCacheData
---@return string
local function ColorOwnedPetCountText(data)
    local text = data.owned.."/"..data.limit
    local percOwned = data.owned / data.limit
    if percOwned == 0 then return ""
    elseif percOwned <= 0.5 then return RED_FONT_COLOR:WrapTextInColorCode(text)
    elseif percOwned > 0.5 and percOwned < 1 then return DARKYELLOW_FONT_COLOR:WrapTextInColorCode(text)
    else return text
    end
end

---@param frame ICHLemixListItem
---@param item WowRemixItem
function AddOn.LemixDataProviderInit(frame, item)
    frame.CostContainer.currencyID = 2778
    if not frame or not item then return end
    frame.isMount = item.Type == "Mount" or false
    
    local index = AddOn.ICHDataProvider:FindIndex(item)
    if item.Type == "Cosmetic" then
        local sourceID = select(2, C_TransmogCollection.GetItemInfo(item.ItemID))
        -- Sometimes the function to check if a cosmetic is known is dumb on initialization. So check here again to be safe
        AddOn.LemixCache[item.ItemID].owned = C_TransmogCollection.PlayerHasTransmog(item.ItemID)
    end
    local data = AddOn.LemixCache[item.ItemID]
    frame.relevantID = item.Type == "Mount" and data.mountID or data.itemID

    local isOwned = data.owned
    if item.Type == "Pet" then
         isOwned = data.owned > 0 and (AddOn.db.global.countPetOwnedOnlyIfMaxOwned and data.owned == data.limit or true)
    end
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, data.collectibleName)
    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(data.iconID or 134400)
    frame.NameContainer.ViewButton:SetHighlightTexture(data.iconID or 134400)

    AddOn:SetTruncatedText(frame.TypeContainer.Text, DARKYELLOW_FONT_COLOR:WrapTextInColorCode(L[item.Type]))
    if item.Phase then
        frame.PhaseContainer.fullName = item.Phase
        local phase = string.split(":", item.Phase)
        AddOn:SetTruncatedText(frame.PhaseContainer.Text, phase)
    end

    if item.IsLemixExclusive then
        frame.ExclusiveContainer.Checkmark:Show()
    elseif frame.ExclusiveContainer.Checkmark:IsShown() then
        frame.ExclusiveContainer.Checkmark:Hide()
    end

    frame.CostContainer.CurrencyButton:ClearNormalTexture()
    frame.CostContainer.CurrencyButton:ClearHighlightTexture()
    frame.CostContainer.CurrencyButton:SetNormalTexture("interface/icons/inv_10_fishing_dragonislescoins_bronze")
    frame.CostContainer.CurrencyButton:SetHighlightTexture("interface/icons/inv_10_fishing_dragonislescoins_bronze")

    local costText = "x"..FormatLargeNumber(item.Cost)

    if item.AdditionalResource then
        frame.CostContainer.resourceItemID = item.AdditionalResource.ItemID
        costText = costText.."\n|T"..(AddOn.LemixResourceCache[item.AdditionalResource.ItemID].iconID)..":12:12|t x"..item.AdditionalResource.Amount
        frame.CostContainer.Text:SetFontObject("GameTooltipTextSmall")
    elseif frame.CostContainer.Text:GetFontObject() == GameTooltipTextSmall then
        frame.CostContainer.resourceItemID = -1
        frame.CostContainer.Text:SetFontObject("GameTooltipText")
    end

    frame.CostContainer.Text:SetText(costText)

    if item.Type == "Pet" then
        frame.OtherInfoContainer.ICHPetCount:SetText(ColorOwnedPetCountText(data))
        frame.OtherInfoContainer.ICHPetCount:Show()
    elseif frame.OtherInfoContainer.ICHPetCount:IsShown() then
        frame.OtherInfoContainer.ICHPetCount:Hide()
    end

    if item.Notes then
        frame.OtherInfoContainer.ICHNote.notes = item.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(item.VendorName or "", frame, item)

    if item.Type == "Mount" then
        frame.NameContainer.ViewButton:HookScript("OnClick", function()
            local spellID = select(2, C_MountJournal.GetMountInfoByID(data.mountID))
            if data.mountID then
                SetCollectionsJournalShown(true, 1)
                MountJournal_SetSelected(data.mountID, spellID)
            end
        end)
    else
        frame.NameContainer.ViewButton:HookScript("OnClick", function() end)
    end
end
