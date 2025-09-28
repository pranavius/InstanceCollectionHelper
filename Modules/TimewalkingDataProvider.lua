local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class TextContainer: Frame Generic frame that displays text relevant to a collectible<br>
---For frame definition and more layout information, see `Templates.xml`
---@field Text FontString

---@class CostContainer: Frame Displays elements relevant to a collectible's cost<br>
---For frame definition and more layout information, see `Templates.xml`
---@field Text FontString
---@field CurrencyButton Button

---@class ICHTimewalkingListItem: Frame List item that displays relevant information for a given collectible
---@field isMount boolean Whether or not the list item is for a mount
---@field relevantID number The ID number for the collectible. For mounts, this value is `mountID` and for toys it is `itemID`
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field TypeContainer TextContainer
---@field ExpansionContainer TextContainer
---@field CostContainer CostContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see TextContainer
---@see CostContainer
---@see OtherInfoContainer

---@class TimewalkingCacheData
---@field itemName string Localized name for the item that adds the collectible to the collection
---@field itemID integer ID number for the item that adds the collectible to the collection
---@field collectibleName string Localized collectible name
---@field iconID integer ID for the icon associated with the collectible
---@field mountID? integer ID number for the mount (applies to mounts only)
---@field speciesID? integer ID for the pet species (applies to pets only)
---@field owned integer|boolean If the collectible is a pet, this is the number of the pet currently owned. For other collectibles, this is `true` if owned and `false` otherwise
---@field limit? integer Maximum number of the pet that can be owned (applies to pets only)

function AddOn:CreateTimewalkingCache()
    ---@type table<number, TimewalkingCacheData> Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets
    self.TimewalkingCache = {}
    local toLoad = #self.TimewalkingItems

    for _, item in ipairs(self.TimewalkingItems) do
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
            end

            if toLoad == 0 then self:PrintDebugMessage("Timewalking data loaded") end
        end)
    end
end

---Formats and returns text indicating the number of a pet owned against the maximum number that can be owned<br/>
---This is a variation on the function `ColorOwnedCountText` that is local to `PetDataProvider.lua` adapted for `TimewalkingCacheData` objects
---@param data TimewalkingCacheData
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

---@param frame ICHTimewalkingListItem
---@param item TimewalkingItem
function AddOn.TimewalkingDataProviderInit(frame, item)
    if not frame or not item then return end
    frame.isMount = item.Type == "Mount" or false
    
    local index = AddOn.ICHDataProvider:FindIndex(item)
    local data = AddOn.TimewalkingCache[item.ItemID]
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
    frame.NameContainer.name = data.collectibleName
    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(data.iconID or 134400)
    frame.NameContainer.ViewButton:SetHighlightTexture(data.iconID or 134400)

    AddOn:SetTruncatedText(frame.TypeContainer.Text, DARKYELLOW_FONT_COLOR:WrapTextInColorCode(item.Type))
    AddOn:SetTruncatedText(frame.ExpansionContainer.Text, item.Expansion)

    frame.CostContainer.CurrencyButton:ClearNormalTexture()
    frame.CostContainer.CurrencyButton:ClearHighlightTexture()
    frame.CostContainer.CurrencyButton:SetNormalAtlas("timewalkingvendor-32x32")
    frame.CostContainer.CurrencyButton:SetHighlightAtlas("timewalkingvendor-32x32")

    frame.CostContainer.Text:SetText("x"..item.Cost)

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

    -- Set Timewalking vendor info for correct faction before setting Waypoint
    if item.Expansion == "Warlords of Draenor" then
        local faction = UnitFactionGroup("player")
        item.VendorName = faction == "Horde" and "Kronnus" or "Tempra"
    end

    AddOn:ConfigureWaypointButton(item.VendorName or "", frame, item)

    if item.Type == "Mount" then
        frame.NameContainer.ViewButton:SetScript("OnClick", function()
            local spellID = select(2, C_MountJournal.GetMountInfoByID(data.mountID))
            if data.mountID then
                SetCollectionsJournalShown(true, 1)
                MountJournal_SetSelected(data.mountID, spellID)
            end
        end)
    else
        frame.NameContainer.ViewButton:SetScript("OnClick", function() end)
    end

    frame.CostContainer.CurrencyButton:SetScript("OnClick", function()
        AddOn:PrintDebugMessage("Timewarped Badges transfer requested")
        if not C_CurrencyInfo.CanTransferCurrency(1166) then
            AddOn:PrintChatMessage("Unable to transfer Timewarped Badges to this character right now.")
            return
        end

        if CurrencyTransferMenu and (not CurrencyTransferMenu.currencyInfo or (CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID ~= 1166) or not CurrencyTransferMenu:IsVisible()) then
            AddOn:PrintDebugMessage("Currency ID is:", CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID or 'n/a')
            AddOn:PrintDebugMessage("Currency Transfer Frame visible:", CurrencyTransferMenu:IsVisible())
            CurrencyTransferMenu:OnCurrencyTransferRequested(1166)
        elseif CurrencyTransferMenu and CurrencyTransferMenu.currencyInfo.currencyID == 1166 then
            AddOn:PrintDebugMessage("Timewarped Badges already selected and window is already open")
            CurrencyTransferMenu:OnCurrencyTransferAmountUpdated(item.Cost)
            CurrencyTransferMenu:FullRefresh()
        else
            AddOn:PrintChatMessage("Unable to open the currency transfer menu. Please open it manually or try again.")
        end
    end)
end