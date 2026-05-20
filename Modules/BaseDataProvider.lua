local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---Shared init for the four instance-based list tabs (Mounts, Toys, Pets, Decor).
---Centralizes the common row layout work and uses SetScript for per-row click handlers so they do not accumulate across row recycles.
---@param frame ICHListItem
---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem
---@param config InstanceListItemConfig
function AddOn.InstanceListItemInit(frame, data, config)
    if not frame or not data then return end

    local cached
    if config.cache then
        cached = config.cache[config.cacheKey(data)]
        if not cached then return end
    end

    local displayName, icon, isOwned, relevantID = config.getInfo(data, cached)

    frame.isMount = config.isMount
    frame.relevantID = relevantID

    if not config.hasPetCount then frame.OtherInfoContainer.ICHPetCount:Hide() end

    local index = AddOn.ICHDataProvider:FindIndex(data)
    if isOwned then
        frame.Bg:Hide()
        frame.OwnedBg:Show()
    else
        frame.OwnedBg:Hide()
        if index % 2 == 0 then frame.Bg:Show() else frame.Bg:Hide() end
    end

    local localizedInstanceName = EJ_GetInstanceInfo(data.InstanceID)
    AddOn:SetTruncatedText(frame.NameContainer.Text, displayName)
    AddOn:SetTruncatedText(frame.InstanceContainer.Text, localizedInstanceName or data.Instance)

    frame.NameContainer.ViewButton:ClearNormalTexture()
    frame.NameContainer.ViewButton:ClearHighlightTexture()
    frame.NameContainer.ViewButton:SetNormalTexture(icon or 134400)
    if config.isMount then frame.NameContainer.ViewButton:SetHighlightTexture(icon or 134400) end

    frame.InstanceContainer.encounterID = data.EncounterID or -1
    local isRaid = AddOn:IsInstanceRaid(data)
    frame.InstanceContainer.ViewButton:SetNormalAtlas(isRaid and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(isRaid and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    AddOn.HideAllDifficultyButtons(frame.DifficultyContainer)
    AddOn:ShowDifficultyButtons(frame.DifficultyContainer, data, isOwned)

    if data.Notes then
        frame.OtherInfoContainer.ICHNote.notes = data.Notes
        frame.OtherInfoContainer.ICHNote:Show()
    elseif frame.OtherInfoContainer.ICHNote:IsShown() then
        frame.OtherInfoContainer.ICHNote:Hide()
    end

    AddOn:ConfigureWaypointButton(localizedInstanceName, frame, data)

    -- SetScript replaces, so per-row handlers do not accumulate as the scroll view recycles frames
    if config.onNameClick then
        frame.NameContainer.ViewButton:SetScript("OnClick", function() config.onNameClick(frame, data, cached) end)
    else
        frame.NameContainer.ViewButton:SetScript("OnClick", nil)
    end

    frame.InstanceContainer.ViewButton:SetScript("OnClick", function()
        EncounterJournal_OpenJournal(data.DifficultyIDs and data.DifficultyIDs[1] or nil, data.InstanceID, data.EncounterID)
        if EncounterJournalEncounterFrameInfo.tab ~= 2 then
            EncounterJournalEncounterFrameInfoLootTab:Click()
        end
        EJ_SetLootFilter(0, 0)
        C_EncounterJournal.SetSlotFilter(Enum.ItemSlotFilterType.Other)
    end)

    if config.afterRender then config.afterRender(frame, data, cached, isOwned) end
end
