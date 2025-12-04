local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class TimewalkingCacheData
---@field itemName string Localized name for the item that adds the collectible to the collection
---@field itemID integer ID number for the item that adds the collectible to the collection
---@field collectibleName string Localized collectible name
---@field iconID integer ID for the icon associated with the collectible
---@field mountID? integer ID number for the mount (applies to mounts only)
---@field speciesID? integer ID for the pet species (applies to pets only)

function AddOn:CreateTimewalkingCache()
    ---@type table<number, TimewalkingCacheData> Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets
    self.TimewalkingCache = {}
    local toLoad = #self.TimewalkingItems

    for _, item in ipairs(self.TimewalkingItems) do
        Item:CreateFromItemID(item.ItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            if item.Type == "Mount" then
                local mountID = C_MountJournal.GetMountFromItem(item.ItemID)
                local name, spellID = C_MountJournal.GetMountInfoByID(mountID)
                local iconID = C_Spell.GetSpellInfo(spellID) and C_Spell.GetSpellInfo(spellID).originalIconID

                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = name or item.Name,
                    iconID = iconID or 134400,
                    mountID = mountID,
                }
            elseif item.Type == "Toy" then
                local _, toyName, iconID = C_ToyBox.GetToyInfo(item.ItemID)
    
                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = toyName or item.Name,
                    iconID = iconID or 134400,
                }
            elseif item.Type == "Pet" then
                local petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(item.ItemID)
        
                self.TimewalkingCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = petName or item.Name,
                    iconID = iconID or 134400,
                    speciesID = speciesID,
                }
            end

            if toLoad == 0 then self:PrintDebugMessage("Timewalking data loaded") end
        end)
    end
end

---@param frame ICHListItem
---@param item TimewalkingItem
function AddOn.TimewalkingDataProviderInit(frame, item)
    frame.CostContainer.currencyID = 1166
    if not frame or not item then return end
    frame.isMount = item.Type == "Mount" or false
    
    local index = AddOn.ICHDataProvider:FindIndex(item)
    local data = AddOn.TimewalkingCache[item.ItemID]
    frame.relevantID = item.Type == "Mount" and data.mountID or data.itemID

    local isOwned = AddOn.GetIsVendorItemOwned(data, item.Type)

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
    AddOn:SetTruncatedText(frame.ExpansionContainer.Text, item.Expansion)

    frame.CostContainer.CurrencyButton:ClearNormalTexture()
    frame.CostContainer.CurrencyButton:ClearHighlightTexture()
    frame.CostContainer.CurrencyButton:SetNormalAtlas("timewalkingvendor-32x32")
    frame.CostContainer.CurrencyButton:SetHighlightAtlas("timewalkingvendor-32x32")

    frame.CostContainer.Text:SetText("x"..FormatLargeNumber(item.Cost))

    if item.Type == "Pet" then
        frame.OtherInfoContainer.ICHPetCount:SetText(AddOn.ColorOwnedPetCountText(AddOn.GetPetOwnedAndLimitCount(data.speciesID)))
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

    -- Clear existing OnClick scripts since frames are reused/repurposed
    frame.NameContainer.ViewButton:SetScript("OnClick", nil)
    frame.CostContainer.CurrencyButton:SetScript("OnClick", nil)

    if item.Type == "Mount" then
        frame.NameContainer.ViewButton:HookScript("OnClick", function()
            local spellID = select(2, C_MountJournal.GetMountInfoByID(data.mountID))
            if data.mountID then
                SetCollectionsJournalShown(true, 1)
                MountJournal_SetSelected(data.mountID, spellID)
            end
        end)
    end

    frame.CostContainer.CurrencyButton:HookScript("OnClick", function()
        AddOn:PrintDebugMessage("Timewarped Badges transfer requested")
        if not C_CurrencyInfo.CanTransferCurrency(frame.CostContainer.currencyID) then
            AddOn:PrintChatMessage(L["Unable to transfer Timewarped Badges to this character right now."])
            return
        end

        if CurrencyTransferMenu and (not CurrencyTransferMenu.currencyInfo or (CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID ~= frame.CostContainer.currencyID) or not CurrencyTransferMenu:IsVisible()) then
            AddOn:PrintDebugMessage("Currency ID is:", CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID or 'n/a')
            AddOn:PrintDebugMessage("Currency Transfer Frame visible:", CurrencyTransferMenu:IsVisible())
            CurrencyTransferMenu:OnCurrencyTransferRequested(frame.CostContainer.currencyID)
        elseif CurrencyTransferMenu and CurrencyTransferMenu.currencyInfo.currencyID == frame.CostContainer.currencyID then
            AddOn:PrintDebugMessage("Timewarped Badges already selected and window is already open")
            CurrencyTransferMenu:OnCurrencyTransferAmountUpdated(item.Cost)
            CurrencyTransferMenu:FullRefresh()
        else
            AddOn:PrintChatMessage(L["Unable to open the currency transfer menu. Please open it manually or try again."])
        end
    end)
end