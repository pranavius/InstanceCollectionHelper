local name, AddOn = ...

---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHInstanceHelper
ICHInstanceHelperMixin = {}

function ICHInstanceHelperMixin:OnLoad()
    self:RegisterEvent("UPDATE_INSTANCE_INFO")
    self:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("ZONE_CHANGED")

    ---@param tooltip GameTooltip
    local function appendHelperData(tooltip)
        if tooltip.__miniWindowData and tooltip == GameTooltip then
            AddOn:PrintDebugMessage("Adding ICH data to Mini-Window tooltip")
            ---@cast tooltip.__miniWindowData ICHHelperItem
            
            if tooltip.__miniWindowData.EncounterID or tooltip.__miniWindowData.Notes then tooltip:AddLine(" ") end
            if tooltip.__miniWindowData.EncounterID then
                local encounterName = EJ_GetEncounterInfo(tooltip.__miniWindowData.EncounterID)
                if encounterName then
                    tooltip:AddLine(BOSS..": "..WHITE_FONT_COLOR:WrapTextInColorCode(encounterName))
                end
                local lootableColor = tooltip.__miniWindowData.CanBeLooted and GREEN_FONT_COLOR or RED_FONT_COLOR
                tooltip:AddLine(lootableColor:WrapTextInColorCode(tooltip.__miniWindowData.CanBeLooted and L["Lootable on this character"] or L["Not lootable on this character"]))
            end
            if tooltip.__miniWindowData.Notes then
                tooltip:AddLine(tooltip.__miniWindowData.Notes, 1, 1, 1, true)
            end
            tooltip:Show()
        end
    end

    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, appendHelperData)
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, appendHelperData)
end

function ICHInstanceHelperMixin:OnEvent(event)
    AddOn:PrintDebugMessage("Mini-Window event:", event)
    self:UpdateHelperWindow()
end

function ICHInstanceHelperMixin:OnShow()
    local isInInstance, instanceType = IsInInstance()
    if isInInstance and (instanceType == "party" or instanceType == "raid") then
        self:UpdateHelperWindow()
    end
end

function ICHInstanceHelperMixin:OnHide()
    local isInInstance, instanceType = IsInInstance()
    if not isInInstance or (instanceType ~= "party" and instanceType ~= "raid") then
        self:ClearHelperWindow()
    end
end

function ICHInstanceHelperMixin:OnDragStart()
    self:StartMoving()
end

function ICHInstanceHelperMixin:OnDragStop()
    self:StopMovingOrSizing()
end

local function isInstanceInfoValid(instanceName, difficultyID, difficultyName, instanceMapID)
    return instanceName ~= nil
        and instanceName ~= ""
        and difficultyID ~= nil
        and difficultyID ~= 0
        and difficultyName ~= nil
        and difficultyName ~= ""
        and instanceMapID ~= nil
        and instanceMapID ~= 0
end

function ICHInstanceHelperMixin:UpdateHelperWindow()
    local isInInstance, instanceType = IsInInstance()
    if AddOn.db.global.showMiniWindow and isInInstance and (instanceType == "party" or instanceType == "raid") then
        AddOn:PrintDebugMessage("Showing Instance Helper window")
        local instanceName, _, difficultyID, difficultyName, _, _, _, mapID = GetInstanceInfo()
        if not isInstanceInfoValid(instanceName, difficultyID, difficultyName, mapID) then
            return
        end

        self:ClearHelperWindow()

        -- Check if option to show window in M+ is enabled or not.
        if AddOn.db.global.showMiniWindowInMythicPlus and difficultyID == AddOn.DungeonDifficulty.MythicPlus then
            difficultyID = AddOn.DungeonDifficulty.Mythic
            AddOn:PrintDebugMessage("Showing mini-window in M+ is enabled. Overwriting difficultyID to", AddOn.DungeonDifficulty.Mythic)
        end

        local collectibles = self.GetInstanceCollectibles(mapID, difficultyID)
        if #collectibles == 0 then
            self:Hide()
            return
        end

        -- TODO: Reorder collectibles so favorites appear first

        self.InstanceName:SetText(instanceName.." - "..difficultyName)

        local iconSize = 30
        for _, item in ipairs(collectibles) do
            local col = CreateFrame("Button", nil, self.ItemContainer)
            col:SetSize(iconSize, iconSize)
            col:SetNormalTexture(item.IconID)
            col:SetHighlightTexture(item.IconID)
            -- Desaturated icons mean that the item can't be looted (usually beacuse the boss/mob was killed already on same/shared difficulty)
            col:GetNormalTexture():SetDesaturated(not item.CanBeLooted)
            col:GetHighlightTexture():SetDesaturated(not item.CanBeLooted)

            col:SetScript("OnEnter", function()
                GameTooltip.__miniWindowData = item
                GameTooltip:SetOwner(col, "ANCHOR_BOTTOMLEFT")
                GameTooltip:SetHyperlink(item.Hyperlink)
                -- GameTooltip:Show()
            end)
            col:SetScript("OnLeave", function()
                GameTooltip.__miniWindowData = nil
                GameTooltip:Hide()
            end)
            col.layoutIndex = self.ItemContainer:GetNumChildren()
        end

        self.ItemContainer:SetSize(math.max(iconSize * 8, #collectibles * iconSize), iconSize)
        self:Layout()
        self:Show()
    elseif not AddOn.db.global.showMiniWindow or not isInInstance then
        AddOn:PrintDebugMessage("Hiding Instance Helper window")
        self:Hide()
    end
end

function ICHInstanceHelperMixin:ClearHelperWindow()
    self.InstanceName:SetText("")
    for _, child in ipairs({ self.ItemContainer:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
end

function ICHInstanceHelperMixin.GetInstanceCollectibles(instanceMapID, difficultyID)
    ---@param item Mount|Toy|Pet|DecorItem
    ---@return boolean canDrop
    local function canItemDropFromInstanceDifficulty(item)
        local isSameMap = item.MapID == instanceMapID
        local isSameDifficulty = tContains(item.DifficultyIDs or {}, difficultyID)
        local sharedDifficultyIDs = {}
        for id, _ in pairs(item.SharedDifficulties or {}) do
            tinsert(sharedDifficultyIDs, id)
        end
        local isSameSharedDifficulty = tContains(sharedDifficultyIDs, difficultyID)

        return isSameMap and (isSameDifficulty or isSameSharedDifficulty)
    end
    
    ---@type ICHHelperItem[]
    local helperItems = {}
    for _, mount in ipairs(AddOn.Mounts) do
        if canItemDropFromInstanceDifficulty(mount) then
            local _, spellID, iconID, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(mount.ID)
            local isCollectable = not (isOwned or AddOn:IsEncounterCompletedOnSharedDifficulty(mount))
            if isCollectable then
                table.insert(helperItems, {
                    MountID = mount.ID,
                    IconID = iconID or 134400,
                    Hyperlink = C_MountJournal.GetMountLink(spellID) or "",
                    EncounterID = mount.EncounterID,
                    Notes = mount.Notes,
                    CanBeLooted = not AddOn.IsEncounterCompleted(mount, difficultyID)
                })
            end
        end
    end
    for _, toy in ipairs(AddOn.Toys) do
        if canItemDropFromInstanceDifficulty(toy) then
            local isOwned = AddOn.IsCollectibleOwned(toy.ItemID, "Toy")
            local isCollectable = not (isOwned or AddOn:IsEncounterCompletedOnSharedDifficulty(toy))
            if isCollectable then
                local toyCache = AddOn.ToyCache[toy.ItemID]
                if toyCache then
                    table.insert(helperItems, {
                        ItemID = toy.ItemID,
                        IconID = toyCache.iconID,
                        Hyperlink = "item:"..toy.ItemID,
                        EncounterID = toy.EncounterID,
                        Notes = toy.Notes,
                        CanBeLooted = not AddOn.IsEncounterCompleted(toy, difficultyID)
                    })
                end
            end
        end
    end
    for _, pet in ipairs(AddOn.Pets) do
        if canItemDropFromInstanceDifficulty(pet) then
            local petCache = AddOn.PetCache[pet.PetItemID]
            if petCache then
                local isOwned = AddOn.IsCollectibleOwned(petCache.speciesID, "Pet")
                local isCollectable = not (isOwned or AddOn:IsEncounterCompletedOnSharedDifficulty(pet))
                if isCollectable then
                    table.insert(helperItems, {
                        ItemID = pet.PetItemID,
                        IconID = petCache.iconID,
                        Hyperlink = "item:"..pet.PetItemID,
                        EncounterID = pet.EncounterID,
                        Notes = pet.Notes,
                        CanBeLooted = not AddOn.IsEncounterCompleted(pet, difficultyID)
                    })
                end
            end
        end
    end
    for _, decorItem in ipairs(AddOn.DecorItems) do
        if canItemDropFromInstanceDifficulty(decorItem) then
            local isOwned = AddOn.IsCollectibleOwned(decorItem.DecorItemID, "Decor")
            local isCollectable = not (isOwned or AddOn:IsEncounterCompletedOnSharedDifficulty(decorItem))
            if isCollectable then
                local iconID = select(5, C_Item.GetItemInfoInstant(decorItem.DecorItemID))
                table.insert(helperItems, {
                    ItemID = decorItem.DecorItemID,
                    IconID = iconID or 134400,
                    Hyperlink = "item:"..decorItem.DecorItemID,
                    EncounterID = decorItem.EncounterID,
                    Notes = decorItem.Notes,
                    CanBeLooted = not AddOn.IsEncounterCompleted(decorItem, difficultyID)
                })
            end
        end
    end
    AddOn:PrintDebugMessage("Found "..#helperItems.." collectibles for current instance")
    return helperItems
end
