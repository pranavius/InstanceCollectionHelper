local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---Returns the favorites category name and item key (ItemID or Mount ID) for the given data.
---Categories are tab-scoped with Timewalking sub-types separated.
---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem
---@return string category
---@return string key
function AddOn:GetFavoriteCategoryAndKey(data)
    local selectedTab = self.db.global.selectedTab
    if selectedTab == self.Tabs.TimewalkingVendorTab then
        return "Timewalking" .. (data.Type or "Mount"), tostring(data.ItemID)
    elseif selectedTab == self.Tabs.MountsTab then
        return "Mount", tostring(data.ID)
    elseif selectedTab == self.Tabs.ToysTab then
        return "Toy", tostring(data.ItemID)
    elseif selectedTab == self.Tabs.PetsTab then
        return "Pet", tostring(data.PetItemID)
    elseif selectedTab == self.Tabs.DecorTab then
        return "Decor", tostring(data.DecorItemID)
    end
    return "Mount", tostring(data.ID or 0)
end

---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem
---@return boolean
function AddOn:IsFavorite(data)
    local category, key = self:GetFavoriteCategoryAndKey(data)
    local faveCategory = self.db.global.favorites[category]
    return faveCategory ~= nil and faveCategory[key] == true
end

---Toggles the favorite state for the given item and refreshes the list
---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem
function AddOn:ToggleFavorite(data, button)
    local category, key = self:GetFavoriteCategoryAndKey(data)
    local faveCategory = self.db.global.favorites[category]
    if not faveCategory then return end
    faveCategory[key] = not faveCategory[key] or nil
    button:SetNormalAtlas("auctionhouse-icon-favorite"..(faveCategory[key] and "" or "-off"))
    button:SetPushedAtlas("auctionhouse-icon-favorite"..(faveCategory[key] and "" or "-off"))

    EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    EventRegistry:TriggerEvent("ICHEvent.UpdateSettingsPanel")
end

---Returns localized, lowercased name for Name-column sorting (mirrors per-tab name resolution in FilterListContentsByQuery())
---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem
---@return string
function AddOn:GetSortableName(data)
    local selectedTab = self.db.global.selectedTab
    local itemName
    if selectedTab == self.Tabs.MountsTab then
        itemName = C_MountJournal.GetMountInfoByID(data.ID)
    elseif selectedTab == self.Tabs.ToysTab then
        itemName = select(2, C_ToyBox.GetToyInfo(data.ItemID))
    elseif selectedTab == self.Tabs.PetsTab then
        itemName = C_PetJournal.GetPetInfoByItemID(data.PetItemID)
    elseif selectedTab == self.Tabs.TimewalkingVendorTab then
        local twData = self.TimewalkingCache[data.ItemID]
        itemName = twData and twData.itemName
    elseif selectedTab == self.Tabs.DecorTab then
        local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(data.DecorItemID)
        itemName = decor and decor.name
    end
    return (itemName or data.Name or ""):lower()
end

---@param data Mount|Toy|Pet|DecorItem
---@return string
function AddOn:GetSortableInstance(data)
    return (EJ_GetInstanceInfo(data.InstanceID) or data.Instance or ""):lower()
end

---@param data TimewalkingItem
---@return string
function AddOn:GetSortableType(data)
    return (data.Type or ""):lower()
end

---Returns the rank for the item's expansion by release order (unknown expansions sort last)
---@param data TimewalkingItem
---@return number
function AddOn:GetSortableExpansion(data)
    return AddOn.ExpansionOrder[data.Expansion] or math.huge
end

---@param data TimewalkingItem
---@return number
function AddOn:GetSortableCost(data)
    return tonumber(data.Cost) or 0
end

---Cycles the active sort column: nil (natural order) → asc → desc (repeating)
---Switching to a different column resets directly to asc.
---@param column string
function AddOn:CycleSortState(column)
    if self.sortState.column ~= column then
        self.sortState = { column = column, direction = "asc" }
    elseif self.sortState.direction == "asc" then
        self.sortState = { column = column, direction = "desc" }
    else
        self.sortState = self.defaultSortState
    end
end

---Separates the item list into favorites & non-favorites, sorts each group by active column, then concatenates favorites first.
---@param list (Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem)[]
---@return (Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem)[]
function AddOn:ApplySortAndFavorites(list)
    local favs, rest = {}, {}
    for _, data in ipairs(list) do
        if self:IsFavorite(data) then
            tinsert(favs, data)
        else
            tinsert(rest, data)
        end
    end

    if self.sortState.column then
        local col = self.sortState.column
        local asc = self.sortState.direction == "asc"

        local function getVal(d)
            if col == "Name" then return self:GetSortableName(d)
            elseif col == "Instance" then return self:GetSortableInstance(d)
            elseif col == "Type" then return self:GetSortableType(d)
            elseif col == "Expansion" then return self:GetSortableExpansion(d)
            elseif col == "Cost" then return self:GetSortableCost(d)
            end
            return ""
        end

        local function comparator(a, b)
            local va, vb = getVal(a), getVal(b)
            if asc then return va < vb else return va > vb end
        end

        table.sort(favs, comparator)
        table.sort(rest, comparator)
    end

    local result = {}
    
    tAppendAll(result, favs)
    tAppendAll(result, rest)
    return result
end

---Hides all sort indicators (on both header frames), then shows and orients the
---one matching the current tab's active sort column.
function AddOn:RefreshSortIndicators()
    local function refreshHeaders(headerFrame, sortableKeys)
        if not headerFrame then return end
        for _, key in ipairs(sortableKeys) do
            local header = headerFrame[key]
            if header and header.SortIndicator then
                header.SortIndicator:Hide()
                header.SortIndicator:SetRotation(0)
            end
        end

        for _, key in ipairs(sortableKeys) do
            local colName = key:gsub("Header$", "")
            if colName == self.sortState.column then
                local header = headerFrame[key]
                if header and header.SortIndicator then
                    header.SortIndicator:Show()
                    if self.sortState.direction == "desc" then
                        header.SortIndicator:SetRotation(math.pi)
                    end
                end
                break
            end
        end
    end

    if self.Container then
        refreshHeaders(self.Container.ListHeaders, { "NameHeader", "InstanceHeader" })
        refreshHeaders(self.Container.VendorListHeaders, { "NameHeader", "TypeHeader", "ExpansionHeader", "CostHeader" })
    end
end
