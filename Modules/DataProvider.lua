local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class NameContainer: Frame Frame that displays elements relevant to the "Name" column in the scrollable list
---@field Text FontString Name of an item
---@field ViewButton Button Button to view the item in the appropriate collection journal in-game

---@class InstanceContainer: Frame Frame that displays elements relevant to the "Instance" column in the scrollable list
---@field Text FontString Name of an instance
---@field ViewButton Button Button to view the instance in the encounter journal in-game

---@class DifficultyButton: Button
---@field difficultyID number

---@class DifficultyContainer: Frame Frame that displays elements relevant to the "Difficulty" column in the scrollable list
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

---@class ICHListItem: Frame
---@field Bg Frame The background texture for the list item
---@field NameContainer NameContainer
---@field InstanceContainer InstanceContainer
---@field DifficultyContainer DifficultyContainer

---Unsets all difficulty button points and hides them before attempting to show the correct ones based on provided data
---@param container DifficultyContainer
local function HideAllDifficultyButtons(container)
    for _, button in ipairs({ container:GetChildren() }) do
        button:Hide()
    end
end

local function IsEncounterCompleted(data, difficultyID)
    local encounterName
    if data.EncounterID then encounterName = select(1, EJ_GetEncounterInfo(data.EncounterID)) end
    for i = 1, GetNumSavedInstances() do
        local instanceName, lockoutID, secTilReset, diff, isLocked, isExtended, _, isRaid, maxPlayers, diffName, numEncounters, encProg, isExtendDisabled, mapID = GetSavedInstanceInfo(i)
        if isLocked and diff == difficultyID then
            if mapID == data.MapID then
                if not encounterName then return isLocked
                else
                    for idx = 1, numEncounters do
                        local bossName, fileDataID, isKilled = GetSavedInstanceEncounterInfo(i, idx)
                        if encounterName:match(bossName) then return isKilled end
                    end
                end
            end
        end
    end

    return false
end

---@param container DifficultyContainer See `Templates.xml` for "ICHListItemTemplate"
---@param data InstanceMount The data to process and display in a list item.
local function ShowDifficultyButtons(container, data)
    for i, diffID in ipairs(data.DifficultyIDs) do
        local button
        if AddOn:IsInstanceRaid(data) then
            if diffID == AddOn.RaidDifficulty.Legacy10 then button = container.RaidDiff10Button
            elseif diffID == AddOn.RaidDifficulty.Legacy10H then button = container.RaidDiff10HeroicButton
            elseif diffID == AddOn.RaidDifficulty.Legacy25 then button = container.RaidDiff25Button
            elseif diffID == AddOn.RaidDifficulty.Legacy25H then button = container.RaidDiff25HeroicButton
            elseif diffID == AddOn.RaidDifficulty.Normal then button = container.RaidDiffNormalButton
            elseif diffID == AddOn.RaidDifficulty.Heroic then button = container.RaidDiffHeroicButton
            elseif diffID == AddOn.RaidDifficulty.Mythic then button = container.RaidDiffMythicButton
            end
        else
            if diffID == AddOn.DungeonDifficulty.Normal then button = container.DungDiffNormalButton
            elseif diffID == AddOn.DungeonDifficulty.Heroic then button = container.DungDiffHeroicButton
            elseif diffID == AddOn.DungeonDifficulty.Mythic then button = container.DungDiffMythicButton
            end
        end

        if button then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", container, "TOPLEFT", i == 1 and 0 or ((50 * (i - 1)) + 2), -2.5)
            button:SetPoint("BOTTOMLEFT", container, "BOTTOMLEFT", i == 1 and 0 or ((50 * (i - 1)) + 2), 2.5)
            button:SetText(AddOn:GetDifficultyButtonText(button.difficultyID))
            button:GetFontString():SetTextColor(1, 1, 1, 1)
            button:GetFontString():SetDrawLayer("OVERLAY")
            button:Enable()
            button.ButtonTint:Show()
            if IsEncounterCompleted(data, diffID) then
                -- If an encounter has already been attempted in the current reset period, disable the button and don't show a tinted overlay
                button:Disable()
                if button.ButtonTint:IsShown() then button.ButtonTint:Hide() end
            else
                -- Tint dungeon buttons blue and raids green
                if AddOn:IsInstanceRaid(data) then button.ButtonTint:SetVertexColor(0.082, 0.702, 0, 0.75)
                else button.ButtonTint:SetVertexColor(0, 0.569, 0.949, 0.75) end
                --Mask ButtonTint with the same texture as the button background
                if not button.TintMask then
                    button.TintMask = button:CreateMaskTexture()
                    button.TintMask:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
                    button.ButtonTint:AddMaskTexture(button.TintMask)
                end
                button.TintMask:ClearAllPoints()
                button.TintMask:SetPoint("TOPLEFT", button.ButtonTint, "TOPLEFT", 3, -3)
                button.TintMask:SetPoint("BOTTOMRIGHT", button.ButtonTint, "TOPLEFT", 73, -24)
            end
            button:Show()
        end
    end
end

---Initializes how data in the scrollable list should be displayed.
---@param frame ICHListItem See `Templates.xml` for "ICHListItemTemplate"
---@param data InstanceMount The data to process and display in a list item.
---@param index number The row index (for alternating backgrounds)
function AddOn.DataProviderInit(frame, data, index)
    if not frame or not data then return end
    if type(index) ~= "number" then index = 1 end
    if index % 2 == 0 then frame.Bg:Show() elseif frame.Bg:IsShown() then frame.Bg:Hide() end
    frame.NameContainer.Text:SetText(data.Name)
    frame.InstanceContainer.Text:SetText(data.Instance)

    local mountSpellID = select(2, C_MountJournal.GetMountInfoByID(data.MountID))
    local iconID = C_Spell.GetSpellInfo(mountSpellID) and C_Spell.GetSpellInfo(mountSpellID).originalIconID
    if iconID then
        frame.NameContainer.ViewButton:SetNormalTexture(iconID)
        frame.NameContainer.ViewButton:SetHighlightTexture(iconID)
    end

    frame.InstanceContainer.ViewButton:SetNormalAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")
    frame.InstanceContainer.ViewButton:SetHighlightAtlas(AddOn:IsInstanceRaid(data) and "questlog-questtypeicon-raid" or "questlog-questtypeicon-dungeon")

    HideAllDifficultyButtons(frame.DifficultyContainer)
    ShowDifficultyButtons(frame.DifficultyContainer, data)

    if data.Notes then
        frame.NotesContainer.ICHNote.Notes = data.Notes
        frame.NotesContainer:Show()
    elseif frame.NotesContainer:IsShown() then
        frame.NotesContainer:Hide()
    end

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