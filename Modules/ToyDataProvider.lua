local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Attempts to fetch and cache the toy information, displaying fallback values in the list until data can be retrieved<br/>
---This prevents a bad user experience where multiple list entries are just missing information
---@param data InstanceToy
---@return string toyName The localized name of the toy. If toy information cannot be retrieved, this falls back to the `enUS` locale
---@return number iconID The icon ID for the toy. If toy information cannot be retrieved, this falls back to the standard question mark icon used commonly in WoW
local function GetCachedToyInfo(data)
    -- Set fallback values for name and icon to be the English name stored in the AddOn table and a question mark icon
    local toyName = data.Name
    local iconID = 134400

    if C_Item.IsItemDataCachedByID(data.ToyItemID) then
        _, toyName, iconID = C_ToyBox.GetToyInfo(data.ToyItemID)
    else
        local continuableContainer = ContinuableContainer:Create()
        continuableContainer:AddContinuable(Item:CreateFromItemID(data.ToyItemID))
        continuableContainer:ContinueOnLoad(function()
            _, toyName, iconID = C_ToyBox.GetToyInfo(data.ToyItemID)
            AddOn:UpdateListContents("ICH_ITEM_CACHE")
        end)
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
    frame.relevantID = data.ToyItemID

    local index = AddOn.ICHDataProvider:FindIndex(data)

    local localizedToyName, iconID = GetCachedToyInfo(data)
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