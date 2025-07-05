local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class NameContainerFrame
---@field Text FontString Name of an item
---@field ViewButton Button Button to view the item in the appropriate collection journal in-game

---@class InstanceContainerFrame
---@field Text FontString Name of an instance
---@field ViewButton Button Button to view the instance in the encounter journal in-game

---@class ICHListItem: Frame
---@field Bg Frame The background texture for the list item
---@field NameContainer NameContainerFrame
---@field InstanceContainer InstanceContainerFrame

---Initializes how data in the scrollable list should be displayed.
---@param frame ICHListItem See `Templates.xml` for "ICHListItemTemplate"
---@param data InstanceMount The data to process and display in a list item.
function AddOn.DataProviderInit(frame, data)
    local index = AddOn.ICHDataProvider:FindIndex(data)
    if index % 2 == 0 then frame.Bg:Show() elseif frame.Bg:IsShown() then frame.Bg:Hide() end
    frame.NameContainer.Text:SetText(data.Name)
    frame.InstanceContainer.Text:SetText(data.Instance)

    local mountSpellID = select(2, C_MountJournal.GetMountInfoByID(data.MountID))
    local iconID = C_Spell.GetSpellInfo(mountSpellID).originalIconID
    frame.NameContainer.ViewButton:SetNormalTexture(iconID)
    frame.NameContainer.ViewButton:SetHighlightTexture(iconID)

    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

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

---@param data InstanceMount
---@return boolean `true` if the instance is a raid, `false` otherwise
function AddOn:IsInstanceRaid(data)
    -- AQ has no difficulty IDs listed since it defaults to a 40-man when zoned in (not settable from the UI)
    if #data.DifficultyIDs == 0 then return true end
    for _, id in pairs(self.DungeonDifficulty) do
        if id == data.DifficultyIDs[1] then return false end
    end

    return true
end