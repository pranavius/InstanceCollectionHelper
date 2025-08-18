local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Initializes how toy data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data InstanceToy
---@see ICHListItem
---@see InstanceToy
function AddOn.ToyDataProviderInit(frame, data)
    if not frame or not data then return end
    frame.isToy = true

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local _, localizedToyName, iconID = C_ToyBox.GetToyInfo(data.ToyItemID)
    -- if localizedToyName == nil or iconID == nil then
    --     --Retry.
    --     _, localizedToyName, iconID = C_ToyBox.GetToyInfo(data.ToyItemID)
    -- end
    local localizedInstanceName = EJ_GetInstanceInfo(data.InstanceID)
    local isOwned = PlayerHasToy(data.ToyItemID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    AddOn:SetTruncatedText(frame.NameContainer.Text, localizedToyName) -- Localized toy name truncated if text width exceeds allocated space
    frame.NameContainer.name = localizedToyName
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)  -- Localized instance name truncated if text width exceeds allocated space

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    if iconID then
        frame.NameContainer.ViewButton:SetNormalTexture(iconID)
        -- frame.NameContainer.ViewButton:SetHighlightTexture(iconID)
    else
        print("iconID not found for toy", localizedToyName, "with ID", data.ToyItemID)
    end

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
        -- Try to find a way to show in the toy journal
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