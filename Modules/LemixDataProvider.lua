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

---@class LemixResourceCacheData
---@field itemName string
---@field itemID integer
---@field iconID integer

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
                    self.LemixCache[item.ItemID] = {
                        itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                        itemID = item.ItemID,
                        collectibleName = name or item.Name,
                        iconID = iconID or 134400,
                        mountID = 999999,
                    }
                else
                    local mountID = C_MountJournal.GetMountFromItem(item.ItemID)
                    local name, spellID = C_MountJournal.GetMountInfoByID(mountID)
                    local iconID = C_Spell.GetSpellInfo(spellID) and C_Spell.GetSpellInfo(spellID).originalIconID
    
                    self.LemixCache[item.ItemID] = {
                        itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                        itemID = item.ItemID,
                        collectibleName = name or item.Name,
                        iconID = iconID or 134400,
                        mountID = mountID
                    }
                end
            elseif item.Type == "Toy" then
                local _, toyName, iconID = C_ToyBox.GetToyInfo(item.ItemID)
    
                self.LemixCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = toyName or item.Name,
                    iconID = iconID or 134400
                }
            elseif item.Type == "Pet" then
                local petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(item.ItemID)
        
                self.LemixCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = petName or item.Name,
                    iconID = iconID or 134400,
                    speciesID = speciesID
                }
            elseif item.Type == "Cosmetic" then
                self:UpdateOwnedCosmeticsCacheByItemID(item.ItemID)
                local iconID = C_Item.GetItemIconByID(item.ItemID)

                self.LemixCache[item.ItemID] = {
                    itemName = C_Item.GetItemNameByID(item.ItemID) or "",
                    itemID = item.ItemID,
                    collectibleName = item.Name,
                    iconID = iconID or 134400
                }
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

---@param frame ICHLemixListItem
---@param item WowRemixItem
function AddOn.LemixDataProviderInit(frame, item)
    frame.CostContainer.currencyID = 3252
    if not frame or not item then return end
    frame.isMount = item.Type == "Mount" or false
    
    local index = AddOn.ICHDataProvider:FindIndex(item)
    local data = AddOn.LemixCache[item.ItemID]
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

    frame.CostContainer.CurrencyButton:HookScript("OnClick", function()
        AddOn:PrintDebugMessage("Bronze transfer requested")
        if not C_CurrencyInfo.CanTransferCurrency(frame.CostContainer.currencyID) then
            AddOn:PrintChatMessage(L["Unable to transfer Bronze to this character right now."])
            return
        end

        if CurrencyTransferMenu and (not CurrencyTransferMenu.currencyInfo or (CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID ~= frame.CostContainer.currencyID) or not CurrencyTransferMenu:IsVisible()) then
            AddOn:PrintDebugMessage("Currency ID is:", CurrencyTransferMenu.currencyInfo and CurrencyTransferMenu.currencyInfo.currencyID or 'n/a')
            AddOn:PrintDebugMessage("Currency Transfer Frame visible:", CurrencyTransferMenu:IsVisible())
            CurrencyTransferMenu:OnCurrencyTransferRequested(frame.CostContainer.currencyID)
        elseif CurrencyTransferMenu and CurrencyTransferMenu.currencyInfo.currencyID == frame.CostContainer.currencyID then
            AddOn:PrintDebugMessage("Bronze already selected and window is already open")
            CurrencyTransferMenu:OnCurrencyTransferAmountUpdated(item.Cost)
            CurrencyTransferMenu:FullRefresh()
        else
            AddOn:PrintChatMessage(L["Unable to open the currency transfer menu. Please open it manually or try again."])
        end
    end)
end
