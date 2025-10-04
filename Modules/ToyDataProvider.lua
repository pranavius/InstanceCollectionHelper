local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ToyCacheData
---@field itemName string Localized name for the item that adds the toy to the collection
---@field itemID integer ID for the item that adds the toy to the collection
---@field toyName string Localized toy name
---@field iconID integer ID for the icon associated with the toy
---@field isOwned boolean `true` if the toy is owned, `false` otherwise

function AddOn:CreateToyCache()
    ---@type table<number, ToyCacheData> Stores necessary toy data in a local cache - attempting to reduce the amount of stutter/freezing when viewing toys
    self.ToyCache = {}
    local toLoad = #self.Toys
    
    for _, toy in ipairs(self.Toys) do
        Item:CreateFromItemID(toy.ItemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local _, toyName, iconID = C_ToyBox.GetToyInfo(toy.ItemID)
    
            self.ToyCache[toy.ItemID] = {
                itemName = C_Item.GetItemNameByID(toy.ItemID) or "",
                itemID = toy.ItemID,
                toyName = toyName or toy.Name,
                iconID = iconID or 134400,
                isOwned = PlayerHasToy(toy.ItemID)
            }
    
            if toLoad == 0 then self:PrintDebugMessage("Toy data loaded") end
        end)
    end
end

---Initializes how toy data in the scrollable list should be displayed
---@param frame ICHListItem
---@param toy Toy
---@see ICHListItem
---@see Toy
function AddOn.ToyDataProviderInit(frame, toy)
    if not frame or not toy then return end
    frame.isMount = false
    frame.relevantID = toy.ItemID
    -- Hide the pet count frame for non-pets
    frame.OtherInfoContainer.ICHPetCount:Hide()

    local index = AddOn.ICHDataProvider:FindIndex(toy)

    local toyData = AddOn.ToyCache[toy.ItemID]
    local localizedInstanceName = EJ_GetInstanceInfo(toy.InstanceID)
    if toyData.isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, toyData.toyName)
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(toyData.iconID)

    frame.InstanceContainer.encounterID = toy.EncounterID or -1
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(toy) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(toy) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, toy, toyData.isOwned)
    if toy.Notes then
        frame.OtherInfoContainer.ICHNote.notes = toy.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, toy)

    frame.NameContainer.ViewButton:HookScript("OnClick", function()
        -- Try to find a way to show in the toy journal
    end)

    frame.InstanceContainer.ViewButton:HookScript("OnClick", function()
        -- Open the Encounter Journal to the specified instance, difficulty, and encounter
        EncounterJournal_OpenJournal(toy.DifficultyIDs and toy.DifficultyIDs[1] or nil, toy.InstanceID, toy.EncounterID)
        -- If the loot tab is not already opened, open it by clicking on it programmatically
        if EncounterJournalEncounterFrameInfo.tab ~= 2 then
            EncounterJournalEncounterFrameInfoLootTab:Click()
        end
        -- Show only non-equipment loot for all classes and specs
        EJ_SetLootFilter(0, 0)
        C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
    end)
end