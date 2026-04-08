local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

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
            }
    
            if toLoad == 0 then
                self:PrintDebugMessage("Toy data loaded")
                self.ToyCacheReady = true
                ICHInstanceHelper:UpdateHelperWindow()
            end
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

    local toyData = AddOn.ToyCache[toy.ItemID]
    
    local index = AddOn.ICHDataProvider:FindIndex(toy)
    local isOwned = AddOn.GetIsOwned(toy.ItemID, "Toy")
    AddOn.ConfigureListItemBackground(frame, index, isOwned)
    
    local localizedInstanceName = EJ_GetInstanceInfo(toy.InstanceID)
    AddOn:SetTruncatedText(frame.NameContainer.Text, toyData.toyName)
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)

    AddOn.SetItemIcon(frame.NameContainer.ViewButton, toyData.iconID)

    frame.InstanceContainer.encounterID = toy.EncounterID or -1
    AddOn:SetInstanceTypeIcon(frame, toy)

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, toy, isOwned)
    if toy.Notes then
        frame.OtherInfoContainer.ICHNote.notes = toy.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, toy)

    -- Clear existing OnClick scripts since frames are reused/repurposed
    -- TODO: Try to find a way to show in the toy journal
    frame.NameContainer.ViewButton:SetScript("OnClick", nil)
    frame.InstanceContainer.ViewButton:SetScript("OnClick", nil)

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