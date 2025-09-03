local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Attempts to fetch and cache the pet information, displaying fallback values in the list until data can be retrieved<br/>
---This prevents a bad user experience where multiple list entries are just missing information
---@param data Pet
---@return string petName The localized name of the pet. If pet cannot be retrieved, this falls back to the `enUS` locale
---@return number iconID The icon ID for the pet. If pet information cannot be retrieved, this falls back to the standard question mark icon used commonly in WoW
---@return boolean isMaxOwned `true` when the maximum number of a pet available are owned, `false` otherwise
function AddOn:GetCachedPetInfo(data)
    -- Set fallback values for name and icon to be the English name stored in the AddOn table and a question mark icon
    local petName = data.Name
    local iconID = 134400
    local speciesID = 0

    if C_Item.IsItemDataCachedByID(data.PetItemID) then
        petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(data.PetItemID)
    else
        local continuableContainer = ContinuableContainer:Create()
        for _, pet in ipairs(self.InstancePets) do
            continuableContainer:AddContinuable(Item:CreateFromItemID(pet.PetItemID))
        end
        continuableContainer:ContinueOnLoad(function()
            self:UpdateListContents("ICH_ITEM_CACHE")
        end)
    end
    local numOwned, ownedLimit = C_PetJournal.GetNumCollectedInfo(speciesID)
    if not numOwned then numOwned = 0 end
    if not ownedLimit then ownedLimit = 0 end

    return petName, iconID, numOwned == ownedLimit and numOwned > 0
end

---Initializes how pet data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data Pet
---@see ICHListItem
---@see Pet
function AddOn.PetDataProviderInit(frame, data)
    if not frame or not data then return end
    frame.isMount = false
    frame.relevantID = data.PetItemID

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local localizedPetName, iconID, isOwned = AddOn:GetCachedPetInfo(data)
    local localizedInstanceName = EJ_GetInstanceInfo(data.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, localizedPetName) -- Localized pet name truncated if text width exceeds allocated space
    frame.NameContainer.name = localizedPetName
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)  -- Localized instance name truncated if text width exceeds allocated space

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(iconID)

    frame.InstanceContainer.encounterID = data.EncounterID or -1
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, data, isOwned)
    if data.Notes then
        frame.OtherInfoContainer.ICHNote.notes = data.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, data)

    frame.NameContainer.ViewButton:SetScript("OnClick", function()
        -- Try to find a way to show in the pet journal
    end)

    frame.InstanceContainer.ViewButton:SetScript("OnClick", function()
        -- Open the Encounter Journal to the specified instance, difficulty, and encounter
        EncounterJournal_OpenJournal(data.DifficultyIDs and data.DifficultyIDs[1] or nil, data.InstanceID, data.EncounterID)
        -- If the loot tab is not already opened, open it by clicking on it programmatically
        if EncounterJournalEncounterFrameInfo.tab ~= 2 then
            EncounterJournalEncounterFrameInfoLootTab:Click()
        end
        -- Show only non-equipment loot for all classes and specs
        EJ_SetLootFilter(0, 0)
        C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
    end)
end