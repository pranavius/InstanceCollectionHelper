local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Initializes how housing data in the scrollable list should be displayed
---@param frame ICHListItem
---@param item HousingItem
---@see ICHListItem
---@see HousingItem
function AddOn.HousingDataProviderInit(frame, item)
    if not frame or not item then return end
    local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(item.DecorItemID, true)
    -- Resetting these values to avoid conflicts or incorrect tooltip displays
    frame.isMount = false
    frame.relevantID = decor.entryID.recordID
    -- Hide the pet count frame for non-pets
    frame.OtherInfoContainer.ICHPetCount:Hide()

    local index = AddOn.ICHDataProvider:FindIndex(item)
    
    local isOwned = decor.quantity > 0
    local localizedInstanceName = EJ_GetInstanceInfo(item.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, decor.name)
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)

    local iconID = select(5, C_Item.GetItemInfoInstant(item.DecorItemID))
    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(iconID)

    frame.InstanceContainer.encounterID = item.EncounterID or -1
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(item) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(item) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, item, isOwned)

    if item.Notes then
        frame.OtherInfoContainer.ICHNote.notes = item.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, item)

    -- Clear existing OnClick scripts since frames are reused/repurposed
    frame.NameContainer.ViewButton:SetScript("OnClick", nil) -- Try to find a way to show in the decor catalog
    frame.InstanceContainer.ViewButton:SetScript("OnClick", nil)

    frame.InstanceContainer.ViewButton:HookScript("OnClick", function()
        -- Open the Encounter Journal to the specified instance, difficulty, and encounter
        EncounterJournal_OpenJournal(item.DifficultyIDs and item.DifficultyIDs[1] or nil, item.InstanceID, item.EncounterID)
        -- If the loot tab is not already opened, open it by clicking on it programmatically
        if EncounterJournalEncounterFrameInfo.tab ~= 2 then
            EncounterJournalEncounterFrameInfoLootTab:Click()
        end
        -- Show only non-equipment loot for all classes and specs
        EJ_SetLootFilter(0, 0)
        C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
    end)
end