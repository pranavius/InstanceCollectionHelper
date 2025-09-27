local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class PetCacheData
---@field itemName string Localized name for the item that adds the pet to the collection
---@field itemID integer ID for the item that adds the pet to the collection
---@field petName string Localized pet name
---@field iconID integer ID for the icon associated with the pet
---@field speciesID integer ID for the pet species
---@field owned integer Number of the pet currently owned
---@field limit integer Maximum number of the pet that can be owned

function AddOn:CreatePetCache()
    ---@type table<number, PetCacheData> Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets
    self.PetCache = {}
    local toLoad = #self.Pets
    
    for _, pet in ipairs(self.Pets) do
        Item:CreateFromItemID(pet.PetItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local petName, iconID, _, _, _, _, _, _, _, _, _, _, speciesID = C_PetJournal.GetPetInfoByItemID(pet.PetItemID)
            local owned, limit
            if speciesID then
                local o, l = C_PetJournal.GetNumCollectedInfo(speciesID)
                owned = o or 0
                limit = l or 0
            else
                owned, limit = 0, 0
            end
    
            self.PetCache[pet.PetItemID] = {
                itemName = C_Item.GetItemNameByID(pet.PetItemID) or "",
                itemID = pet.PetItemID,
                petName = petName or pet.Name,
                iconID = iconID or 134400,
                speciesID = speciesID,
                owned = owned,
                limit = limit
            }
    
            if toLoad == 0 then self:PrintDebugMessage("Pet data loaded") end
        end)
    end
end

---Formats and returns text indicating the number of a pet owned against the maximum number that can be owned
---@param petData PetCacheData
---@return string
local function ColorOwnedCountText(petData)
    local text = petData.owned.."/"..petData.limit
    local percOwned = petData.owned / petData.limit
    if percOwned == 0 then return ""
    elseif percOwned <= 0.5 then return RED_FONT_COLOR:WrapTextInColorCode(text)
    elseif percOwned > 0.5 and percOwned < 1 then return DARKYELLOW_FONT_COLOR:WrapTextInColorCode(text)
    else return text
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
    local isOwned = petData.owned > 0 and (AddOn.db.global.countPetOwnedOnlyIfMaxOwned and petData.owned == petData.limit or true)
    local localizedInstanceName = EJ_GetInstanceInfo(pet.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, petData.petName)
    frame.NameContainer.name = petData.petName
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(petData.iconID)

    frame.InstanceContainer.encounterID = pet.EncounterID or -1
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(pet) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(pet) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, pet, isOwned)

    frame.OtherInfoContainer.ICHPetCount:SetText(ColorOwnedCountText(petData))
    frame.OtherInfoContainer.ICHPetCount:Show()

    if pet.Notes then
        frame.OtherInfoContainer.ICHNote.notes = pet.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, pet)

    frame.NameContainer.ViewButton:SetScript("OnClick", function()
        -- Try to find a way to show in the pet journal
    end)

    frame.InstanceContainer.ViewButton:SetScript("OnClick", function()
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
