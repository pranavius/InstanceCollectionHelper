local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Initializes how mount data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data Mount
---@see ICHListItem
---@see Mount
function AddOn.MountDataProviderInit(frame, data)
    if not frame or not data then return end
    -- Resetting these values to avoid conflicts or incorrect tooltip displays
    frame.isMount = true
    frame.relevantID = data.ID
    -- Hide the pet count frame for non-pets
    frame.OtherInfoContainer.ICHPetCount:Hide()

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local localizedMountName, mountSpellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(data.ID)
    local localizedInstanceName = EJ_GetInstanceInfo(data.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end
    AddOn:SetTruncatedText(frame.NameContainer.Text, localizedMountName or data.Name) -- Localized mount name truncated if text width exceeds allocated space
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName or data.Instance)  -- Localized instance name truncated if text width exceeds allocated space

    local iconID = C_Spell.GetSpellInfo(mountSpellID) and C_Spell.GetSpellInfo(mountSpellID).originalIconID
    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(iconID or 134400)
    frame.NameContainer.ViewButton:SetHighlightTexture(iconID or 134400)

    frame.InstanceContainer.encounterID = data.EncounterID or -1
    --@retail@
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    --@end-retail@
    --@version-mists@
    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(data) and "Raid" or "Dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(data) and "Raid" or "Dungeon")
    --@end-version-mists@

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, data, isOwned)

    if data.Notes then
        frame.OtherInfoContainer.ICHNote.notes = data.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, data)

    frame.NameContainer.ViewButton:HookScript("OnClick", function()
        if data.ID then
            SetCollectionsJournalShown(true, 1)
            MountJournal_SetSelected(data.ID, mountSpellID)
        end
    end)

    frame.InstanceContainer.ViewButton:HookScript("OnClick", function()
        if localizedInstanceName then
            -- Open the Encounter Journal to the specified instance, difficulty, and encounter
            EncounterJournal_OpenJournal(data.DifficultyIDs and data.DifficultyIDs[1] or nil, data.InstanceID, data.EncounterID)
            -- If the loot tab is not already opened, open it by clicking on it programmatically
            if EncounterJournalEncounterFrameInfo.tab ~= 2 then
                EncounterJournalEncounterFrameInfoLootTab:Click()
            end
            --@retail@
            -- Show only non-equipment loot for all classes and specs
            EJ_SetLootFilter(0, 0)
            C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
            --@end-retail@
        end
    end)

end