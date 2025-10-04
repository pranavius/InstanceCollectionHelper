local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)
local LDB = LibStub("LibDataBroker-1.1")
ICH = {}

---Handles slash commands in a way that overrides the default behavior of Ace3 slash commands. Executing the command with no arguments
---opens the AddOn options window, providing the `help` argument displays a list of available arguments and uses for the slash command,
---and all other arguments are handled using Ace3's default behavior.
---@param cmd string The slash command used (should be exactly `ich`)
---@param input string The argument provided to the slash command
function AddOn.HandleSlashCommand(cmd, input)
    input = strtrim(input):lower()
    local AceConfigCmd = LibStub("AceConfigCmd-3.0")
    if input == "" then
        if AddOn.Container and not AddOn.Container:IsShown() then
            AddOn.Container:Show()
        elseif AddOn.Container then
            AddOn.Container:Hide()
        end
    elseif input == "debug" then
        AddOn.db.global.debugMessages = not AddOn.db.global.debugMessages
        AddOn:PrintChatMessage("Debug messages", AddOn.db.global.debugMessages and "enabled" or "disabled")
    elseif input == "help" then AceConfigCmd:HandleCommand(cmd, name, "")
    else AceConfigCmd:HandleCommand(cmd, name, input)
    end
end

function AddOn:OnInitialize()
    -- Generate proper search tags for all collectibles
    for _, mount in ipairs(AddOn.Mounts) do self.AppendMapSearchTags(mount) end
    for _, toy in ipairs(AddOn.Toys) do self.AppendMapSearchTags(toy) end
    for _, pet in ipairs(AddOn.Pets) do self.AppendMapSearchTags(pet) end

    -- Load database
	self.db = LibStub("AceDB-3.0"):New("ICH_DB", AddOn.DatabaseDefaults, true)
    -- Create local caches for Toys, Pets, and Timewalking Items
    self:CreateToyCache()
    self:CreatePetCache()
    self:CreateTimewalkingCache()

    -- Data broker registration for minimap icon
    local broker = LDB:NewDataObject(name, {
        type = "launcher",
        text = name,
        icon = "Interface/AddOns/InstanceCollectionHelper/Media/Logo.png",
        OnClick = function() if self.Container then self.Container:Show() end end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText(AddOn.Title)
            tooltip:AddLine(L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"], 1, 1, 1, true)
            tooltip:AddLine(L["Type \"/ich help\" in the chat window for available slash commands"])
        end
    })
    self.Icon:Register(name, broker, self.db.global.minimap)

    -- Setup config options
    local config = LibStub("AceConfig-3.0")
    config:RegisterOptionsTable(name, self.SlashOptions, "ich")
    -- Override default slash command behavior so /ich opens the addon
    self:RegisterChatCommand("ich", function(input) self.HandleSlashCommand("ich", input) end)
    
    self:PrintDebugMessage("TomTom is", C_AddOns.IsAddOnLoaded("TomTom") and "enabled" or "disabled")
    self:ConfigureOnInit()
    self:RegisterEvent("ZONE_CHANGED", "UpdateListContents")
    self:RegisterEvent("PLAYER_LOGOUT", function()
        if C_AddOns.IsAddOnLoaded("TomTom") and self.db.global.currentTomTomWaypoint then
            TomTom:RemoveWaypoint(self.db.global.currentTomTomWaypoint)
            self.db.global.currentTomTomWaypoint = nil
        end
    end)
end

function AddOn:ConfigureOnInit()
    ICHScrollBox:InitializeScrollView()
    local isInvalidScale = tonumber(self.db.global.windowScale) == nil or tonumber(self.db.global.windowScale) == 0
    if isInvalidScale then self.db.global.windowScale = 1 end
    ICHFooter.ScaleContainer.WindowScale:Init(AddOn.db.global.windowScale, 0.8, 1.2, 80)
    ICHFooter.OwnedContainer.Checkbox:SetChecked(self.db.global.showOwned)
    ICHFooter.TomTomContainer.Checkbox:SetChecked(self.db.global.useTomTomPoints)
    self:CreateTabSystem()
    self.Tabs:SetTab(self.Tabs.MountsTab)
    -- Set window scale
    self.Container:SetScale(self.db.global.windowScale)
end

---Filters a list of data based on search parameters
---@param listData (Mount|Toy|Pet|TimewalkingItem)[]
---@return (Mount|Toy|Pet|TimewalkingItem)[]
---@see Mount
---@see Toy
---@see Pet
---@see TimewalkingItem
function AddOn:FilterListContentsByQuery(listData)
    local filtered = {}
    local query = self.Container.SearchBox:GetText():lower()
    local selectedTab = self.db.global.selectedTab

    local nameMatches, instanceMatches, encounterMatches, instanceTypeMatches, difficultyMatches, searchTagMatches, itemTypeMatches = false, false, false, false, false, false, false
    for _, data in ipairs(listData) do
        -- Using localized names for mounts, instances, encounters, etc for better search results
        local itemName
        local instanceName = EJ_GetInstanceInfo(data.InstanceID) or ""
        local encounterName = data.EncounterID and EJ_GetEncounterInfo(data.EncounterID) or ""
        if selectedTab == self.Tabs.MountsTab then
            itemName = C_MountJournal.GetMountInfoByID(data.ID) or ""
        elseif selectedTab == self.Tabs.ToysTab then
            itemName = select(2, C_ToyBox.GetToyInfo(data.ItemID)) or ""
            if not itemName then itemName = "" end
        elseif selectedTab == self.Tabs.PetsTab then
            itemName = C_PetJournal.GetPetInfoByItemID(data.PetItemID) or ""
        elseif selectedTab == self.Tabs.TimewalkingVendorTab then
            itemName = self.TimewalkingCache[data.ItemID].itemName or ""

        end
        local cleanName = itemName:lower():gsub("|.+|.*", "")
        nameMatches = cleanName:match(query) and true or false
        instanceMatches = instanceName:lower():match(query) and true or false
        encounterMatches = encounterName:lower():match(query) and true or false
        instanceTypeMatches = query == L["raid"] and self:IsInstanceRaid(data) or (query == L["dungeon"] and not self:IsInstanceRaid(data))
        difficultyMatches = false
        for _, diffID in ipairs(data.DifficultyIDs or {}) do
            if self:GetDifficultyButtonText(diffID):lower() == query or self:GetInstanceDifficultyText(diffID):lower() == query then
                difficultyMatches = true
                break
            end
        end
        if not difficultyMatches and data.SharedDifficulties then
            for shared, _ in pairs(data.SharedDifficulties) do
                if self:GetDifficultyButtonText(shared):lower() == query or self:GetInstanceDifficultyText(shared):lower() == query then
                    difficultyMatches = true
                    break
                end
            end
        end
        searchTagMatches = false
        for _, tag in ipairs(data.SearchTags) do
            if tag:lower() == query then
                searchTagMatches = true
                break
            end
        end
        itemTypeMatches = false
        if data.Type then itemTypeMatches = query == L[data.Type]:lower() end

        if nameMatches or instanceMatches or encounterMatches or instanceTypeMatches or difficultyMatches or searchTagMatches or itemTypeMatches then
            tinsert(filtered, data)
        end
    end
    return filtered
end

---Update the contents of the list shown in the UI
function AddOn:UpdateListContents()
    if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then UIParentLoadAddOn("Blizzard_Collections") end
    if not C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then UIParentLoadAddOn("Blizzard_EncounterJournal") end
    ---@type (Mount|Toy|Pet|TimewalkingItem)[]
    local newData = {}
    local selectedTab = self.db.global.selectedTab
    if selectedTab == self.Tabs.MountsTab then
        for _, mount in ipairs(self.Mounts) do
            -- Checking hideOnChar for mounts like Grand Black War Mammoth, which has a faction specific version
            local _, _, _, _, _, _, _, _, _, hideOnChar, isOwned = C_MountJournal.GetMountInfoByID(mount.ID)
            if not hideOnChar and (not isOwned or (isOwned and self.db.global.showOwned)) then tinsert(newData, mount) end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by mount/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.ToysTab then
        for _, toy in ipairs(self.Toys) do
            local toyData = self.ToyCache[toy.ItemID]
            if not toyData.isOwned or (toyData.isOwned and self.db.global.showOwned) then tinsert(newData, toy) end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by toy/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.PetsTab then
        for _, pet in ipairs(self.Pets) do
            local petData = self.PetCache[pet.PetItemID]
            local isOwned = petData.owned > 0 and (self.db.global.countPetOwnedOnlyIfMaxOwned and petData.owned == petData.limit or true)
            if not isOwned or (isOwned and self.db.global.showOwned) then tinsert(newData, pet) end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by pet/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.TimewalkingVendorTab then
        for _, item in ipairs(self.TimewalkingItems) do
            local itemData = self.TimewalkingCache[item.ItemID]
            if item.Type == "Mount" then
                local hideOnChar = select(10, C_MountJournal.GetMountInfoByID(itemData.mountID))
                if not hideOnChar and (not itemData.owned or (itemData.owned and self.db.global.showOwned)) then tinsert(newData, item) end
            elseif item.Type == "Pet" then
                local isOwned = itemData.owned > 0 and (self.db.global.countPetOwnedOnlyIfMaxOwned and itemData.owned == itemData.limit or true)
                if not isOwned or (isOwned and self.db.global.showOwned) then tinsert(newData, item) end
            else
                if not itemData.owned or (itemData.owned and self.db.global.showOwned) then tinsert(newData, item) end
            end
        end
        -- Update search box instructions somehow
    end

    -- Filter list results based on search criteria when present
    if self.Container.SearchBox and self.Container.SearchBox:GetText() ~= "" then
        newData = self:FilterListContentsByQuery(newData)
    end

    self.ICHDataProvider = CreateDataProvider(newData)
    self.ScrollView:SetDataProvider(self.ICHDataProvider)
end

-- AddOn Compartment Functions
function ICH_AddonCompartmentOnClick()
    -- Same as typing "/ich" in a chat window
    AddOn.HandleSlashCommand("ich", "")
end

function ICH_AddonCompartmentOnEnter(_, btn)
    MenuUtil.ShowTooltip(btn, function(tooltip)
        tooltip:SetText(AddOn.Title)
        tooltip:AddLine(L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"], 1, 1, 1, true)
        tooltip:AddLine(L["Type \"/ich help\" in the chat window for available slash commands"])
    end)
end

function ICH_AddonCompartmentOnLeave(_, btn)
    MenuUtil.HideTooltip(btn)
end

-- Exposes AddOn functionality for use in XML Templates
ICH = AddOn
ICH_LANG = L
