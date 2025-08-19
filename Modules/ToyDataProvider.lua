local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Attempts to fetch the toy information up to 3 times before displaying fallback values in the list until data can be retrieved<br/>
---This prevents a bad user experience where multiple list entries are just missing information
---@param data InstanceToy
---@return string toyName The localized name of the toy. If toy information cannot be retrieved, this falls back to the `enUS` locale
---@return number iconID The icon ID for the toy. If toy information cannot be retrieved, this falls back to the standard question mark icon used commonly in WoW
local function RetryGetToyInfo(data)
    if not C_Item.IsItemDataCachedByID(data.ToyItemID) then C_Item.RequestLoadItemDataByID(data.ToyItemID) end

    local toyName, iconID
    local attempts = 1
    -- Attempt to fetch toy info multiple times
    while attempts < 4 do
        _, toyName, iconID = C_ToyBox.GetToyInfo(data.ToyItemID)
        if toyName and iconID then break else attempts = attempts + 1 end
    end
    -- If values are not fetched, fallback on the English name stored in the AddOn table and a question mark icon
    if not toyName or not iconID then
        toyName = data.Name
        iconID = 134400
    end

    return toyName, iconID
end

---Initializes how toy data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data InstanceToy
---@see ICHListItem
---@see InstanceToy
function AddOn.ToyDataProviderInit(frame, data)
    if not frame or not data then return end
    frame.isToy = true

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local localizedToyName, iconID = RetryGetToyInfo(data)
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
    frame.NameContainer.ViewButton:SetNormalTexture(iconID)

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