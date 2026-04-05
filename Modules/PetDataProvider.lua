local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

function AddOn:CreatePetCache()
    ---@type table<number, PetCacheData> Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets
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
                speciesID = speciesID
            }
    
            if toLoad == 0 then
                self:PrintDebugMessage("Pet data loaded")
                self.PetCacheReady = true
                ICHInstanceHelper:UpdateHelperWindow()
            end
        end)
    end
end

---Initializes how pet data in the scrollable list should be displayed
---@param frame ICHListItem
---@param pet Pet
---@see ICHListItem
---@see Pet
function AddOn.PetDataProviderInit(frame, pet)
    if not frame or not pet then return end
    frame.isMount = false
    frame.relevantID = pet.PetItemID

    local index = AddOn.ICHDataProvider:FindIndex(pet)

    local petData = AddOn.PetCache[pet.PetItemID]
    local owned, limit = AddOn.GetPetOwnedAndLimitCount(petData.speciesID)
    local isOwned = (owned > 0 and (AddOn.db.global.countPetOwnedOnlyIfMaxOwned and owned == limit or true)) or false
    local localizedInstanceName = EJ_GetInstanceInfo(pet.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, petData.petName)
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(petData.iconID)

    frame.InstanceContainer.encounterID = pet.EncounterID or -1
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(pet) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(pet) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, pet, isOwned)

    frame.OtherInfoContainer.ICHPetCount:SetText(AddOn.ColorOwnedPetCountText(owned, limit))
    frame.OtherInfoContainer.ICHPetCount:Show()

    if pet.Notes then
        frame.OtherInfoContainer.ICHNote.notes = pet.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, pet)

    -- Clear existing OnClick scripts since frames are reused/repurposed
    frame.NameContainer.ViewButton:SetScript("OnClick", nil) -- Try to find a way to show in the pet journal
    frame.InstanceContainer.ViewButton:SetScript("OnClick", nil)

    frame.InstanceContainer.ViewButton:HookScript("OnClick", function()
        -- Open the Encounter Journal to the specified instance, difficulty, and encounter
        EncounterJournal_OpenJournal(pet.DifficultyIDs and pet.DifficultyIDs[1] or nil, pet.InstanceID, pet.EncounterID)
        -- If the loot tab is not already opened, open it by clicking on it programmatically
        if EncounterJournalEncounterFrameInfo.tab ~= 2 then
            EncounterJournalEncounterFrameInfoLootTab:Click()
        end
        -- Show only non-equipment loot for all classes and specs
        EJ_SetLootFilter(0, 0)
        C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
    end)
end
