local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class NameContainer: Frame Displays elements relevant to a collectible's name<br/>
---For frame definition and more layout information, see `Templates.xml`
---@field name string The full name of the collectible
---@field Text FontString Name of a collectible (can be truncated if length exceeds allocated space)
---@field ViewButton Button Button to view the collectible in the appropriate collection journal in-game

---@class InstanceContainer: Frame Displays elements relevant to the instance where a collectible can be obtained<br/>
---For frame definition and more layout information, see `Templates.xml`
---@field Text FontString Name of an instance
---@field ViewButton Button Button to view the instance in the encounter journal in-game

---@class DifficultyButton: Button Sets instance difficulty to the associated value
---@field difficultyID number ID number for instance, scenario, and raid difficulty (see https://wago.tools/db2/Difficulty)

---@class DifficultyContainer: Frame Displays elements relevant to the instance difficulty for a collectible<br/>
---For frame definition and more layout information, see `Templates.xml`
---@field sharedDifficulties? table<RaidDifficulty, RaidDifficulty> Difficulties that share a lockout with a difficulty displayed using the appropriate button
---@field RaidDiffLFRButton DifficultyButton Button for tracking LFR lockout (no action taken when clicked)
---@field RaidDiff10Button DifficultyButton Button for setting Legacy Raid difficulty to 10 player
---@field RaidDiff10HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 10 player (Heroic)
---@field RaidDiff25Button DifficultyButton Button for setting Legacy Raid difficulty to 25 player
---@field RaidDiff25HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 25 player (Heroic)
---@field RaidDiffNormalButton DifficultyButton Button for setting Raid difficulty to Normal
---@field RaidDiffHeroicButton DifficultyButton Button for setting Raid difficulty to Heroic
---@field RaidDiffMythicButton DifficultyButton Button for setting Raid difficulty to Mythic
---@field DungDiffNormalButton DifficultyButton Button for setting Dungeon difficulty to Normal
---@field DungDiffHeroicButton DifficultyButton Button for setting Dungeon difficulty to Heroic
---@field DungDiffMythicButton DifficultyButton Button for setting Dungeon difficulty to Mythic

---@class ICHNote: Frame Handles displaying notes about a mount or instance in a tooltip when hovered
---@field notes string? The note(s) to display when hovering over the texture in `ICHNote`

---@class ICHWaypointButton: Button Creates a map pin or TomTom waypoint to the corresponding instance entrance based on user's preferences
---@field instanceID number ID number for instance

---@class OtherInfoContainer: Frame Displays other elements associated with a collectible
---@field ICHNote ICHNote
---@field ICHWaypointButton ICHWaypointButton

---@class ICHListItem: Frame List item that displays relevant information for a given collectible
---@field isToy boolean Whether or not the list item is for a toy
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field InstanceContainer InstanceContainer
---@field DifficultyContainer DifficultyContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see InstanceContainer
---@see DifficultyContainer
---@see OtherInfoContainer

---Initializes how mount data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data InstanceMount
---@see ICHListItem
---@see InstanceMount
function AddOn.MountDataProviderInit(frame, data)
    if not frame or not data then return end

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local localizedMountName, mountSpellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(data.MountID)
    local localizedInstanceName = EJ_GetInstanceInfo(data.InstanceID)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end
    AddOn:SetTruncatedText(frame.NameContainer.Text, localizedMountName) -- Localized mount name truncated if text width exceeds allocated space
    frame.NameContainer.name = localizedMountName
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName)  -- Localized instance name truncated if text width exceeds allocated space

    local iconID = C_Spell.GetSpellInfo(mountSpellID) and C_Spell.GetSpellInfo(mountSpellID).originalIconID
    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    if iconID then
        frame.NameContainer.ViewButton:SetNormalTexture(iconID)
        frame.NameContainer.ViewButton:SetHighlightTexture(iconID)
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
        -- Currently only supports Mounts, but additional conditions could be added for showing things like Battle Pets and Achievements
        if data.MountID then
            SetCollectionsJournalShown(true, 1)
            MountJournal_SetSelected(data.MountID, mountSpellID)
        end
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