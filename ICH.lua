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

    -- Load database
	self.db = LibStub("AceDB-3.0"):New("ICH_DB", AddOn.DatabaseDefaults, true)
    -- Create local caches for Toys and Pets
    self:CreateToyCache()
    self:CreatePetCache()

    -- Data broker registration for minimap icon
    local broker = LDB:NewDataObject(name, {
        type = "launcher",
        text = name,
        icon = "Interface/AddOns/InstanceCollectionHelper/Media/Logo.png",
        OnClick = function() if self.Container then self.Container:Show() end end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText(name)
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
    self:CreateMainFrame()
    self.Container:HookScript("OnShow", function() self:UpdateListContents() end)
    self:RegisterEvent("ZONE_CHANGED", "UpdateListContents")
    self:RegisterEvent("PLAYER_LOGOUT", function()
        if C_AddOns.IsAddOnLoaded("TomTom") and self.db.global.currentTomTomWaypoint then
            TomTom:RemoveWaypoint(self.db.global.currentTomTomWaypoint)
            self.db.global.currentTomTomWaypoint = nil
        end
    end)
end

---Initializes the AddOn window.<br>
---Internally creates a scrollable list of data to display initially as well.
function AddOn:CreateMainFrame()
    local f = CreateFrame("Frame", "ICHMain", UIParent)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetSize(800, 600)
    f:EnableMouse(true)
    f:SetMovable(true)
    f:SetFrameStrata("MEDIUM")

    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(frame)
        frame:StartMoving()
    end)
    f:SetScript("OnDragStop", function(frame) frame:StopMovingOrSizing() end)

    -- Frame background
    f.Bg = f:CreateTexture("ICHBackground", "BACKGROUND")
    f.Bg:SetAllPoints(f)
    f.Bg:SetColorTexture(0, 0, 0, 0.8)

    -- Frame Title
    f.Title = f:CreateFontString("ICHTitle", "OVERLAY", "GameFontHighlightMedium")
    f.Title:SetPoint("TOPLEFT", f, "TOPLEFT", 0, -10)
    f.Title:SetPoint("TOPRIGHT", f, "TOPRIGHT", 0, -10)
    f.Title:SetText(name)

    -- Search box
    f.SearchBox = CreateFrame("EditBox", "ICHSearchBox", f, "SearchBoxTemplate")
    f.SearchBox:SetPoint("TOPRIGHT", f.Title, "BOTTOMRIGHT", -25, -10)
    f.SearchBox:SetAutoFocus(false)
    f.SearchBox:SetSize(400, 30)
    f.SearchBox:HookScript("OnTextChanged", function() self:UpdateListContents() end)
    
    -- Close button
    f.CloseButton = CreateFrame("Button", "ICHCloseButton", f, "UIPanelCloseButtonDefaultAnchors")
    f.CloseButton:SetSize(20, 20)

    -- Search Hints button
    f.SearchHintsButton = CreateFrame("Button", "ICHSearchHintsButton", f, "ICHGenericButtonTemplate")
    f.SearchHintsButton.action = "SEARCH"
    f.SearchHintsButton:SetPoint("TOPRIGHT", f.CloseButton, "TOPLEFT", -10, 0)
    f.SearchHintsButton:SetNormalTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\SearchHintsIcon.png")
    f.SearchHintsButton:SetHighlightTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\SearchHintsIcon.png")

    -- Help button
    f.HelpButton = CreateFrame("Button", "ICHHelpButton", f, "ICHGenericButtonTemplate")
    f.HelpButton.action = "HELP"
    f.HelpButton:SetPoint("RIGHT", f.SearchHintsButton, "LEFT", -10, 0)
    f.HelpButton:SetNormalTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\HelpIcon.png")
    f.HelpButton:SetHighlightTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\HelpIcon.png")

    -- Info button
    f.InfoButton = CreateFrame("Button", "ICHInfoButton", f, "ICHGenericButtonTemplate")
    f.InfoButton.action = "INFO"
    f.InfoButton:SetPoint("RIGHT", f.HelpButton, "LEFT", -10, 0)
    f.InfoButton:SetNormalTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\InfoIcon.png")
    f.InfoButton:SetHighlightTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\InfoIcon.png")

    self.Container = f
    self:CreateScrollingView()
    self:CreateFooter()
    self:CreateAboutFrame()
    self:CreateTabSystem()
    self.Tabs:SetTab(self.Tabs.MountsTab)

    f.InfoButton:SetScript("OnClick", function()
        self.About:Show()
        self.Container:Hide()
    end)

    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self.Container:GetName())
    tinsert(UISpecialFrames, self.About:GetName())

    -- Set window scale
    self.Container:SetScale(self.db.global.windowScale)

    -- Hide by default
    self.Container:Hide()
end

---Initializes the scrollable list of data to display in the AddOn<br>
---By default, the list of mounts is shown
function AddOn:CreateScrollingView()
    self.Container.ListHeaders = CreateFrame("Frame", "ICHListHeaders", self.Container, "ICHListHeadersTemplate")
    self.Container.ListHeaders:SetPoint("TOPLEFT", self.Container.Title, "BOTTOMLEFT", 10, -45)
    self.Container.ListHeaders:SetPoint("TOPRIGHT", self.Container.Title, "BOTTOMRIGHT", -10, -45)

    self.ScrollBox = CreateFrame("Frame", "ICHScrollBox", self.Container, "WowScrollBoxList")
    self.ScrollBox:SetPoint("TOPLEFT", self.Container.ListHeaders, "BOTTOMLEFT", 0, -5)
    self.ScrollBox:SetPoint("BOTTOMRIGHT", self.Container, "BOTTOMRIGHT", -30, 20)

    self.ScrollBar = CreateFrame("EventFrame", "ICHScrollBar", self.Container, "MinimalScrollBar")
    self.ScrollBar:SetPoint("TOPLEFT", self.ScrollBox, "TOPRIGHT", 15, -10)
    self.ScrollBar:SetPoint("BOTTOMLEFT", self.ScrollBox, "BOTTOMRIGHT", 15, 0)
    self.ScrollBar:SetHideIfUnscrollable(true)

    self.ICHDataProvider = CreateDataProvider()
    self.ScrollView = CreateScrollBoxListLinearView()
    self.ScrollView:SetDataProvider(self.ICHDataProvider)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView)
    self.ScrollView:SetElementFactory(function(factory, elementData)
        if elementData.ID then factory("ICHListItemTemplate", self.MountDataProviderInit)
        elseif elementData.ItemID then factory("ICHListItemTemplate", self.ToyDataProviderInit)
        elseif elementData.PetItemID then factory("ICHListItemTemplate", self.PetDataProviderInit)
        end

    end)
    self.ScrollView:SetElementExtent(self.ScrollView:GetTemplateExtent("ICHListItemTemplate"))
end

---Initializes the footer in the AddOn that contains some display options for the window
function AddOn:CreateFooter()
    local foot = CreateFrame("Frame", "ICHFooter", self.Container)
    foot:SetHeight(35)
    foot:SetPoint("TOPLEFT", self.Container, "BOTTOMLEFT")
    foot:SetPoint("TOPRIGHT", self.Container, "BOTTOMRIGHT")
    -- Footer background
    foot.Bg = foot:CreateTexture("ICHFooterBackground", "BACKGROUND")
    foot.Bg:SetAllPoints(foot)
    foot.Bg:SetColorTexture(0, 0, 0, 1)

    -- AddOn Window Scale
    foot.ScaleContainer = CreateFrame("Frame", nil, foot)
    foot.ScaleContainer:SetWidth(200)
    foot.ScaleContainer:SetPoint("TOPLEFT")
    foot.ScaleContainer:SetPoint("BOTTOMLEFT")

    foot.ScaleContainer.Text = foot.ScaleContainer:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    foot.ScaleContainer.Text:SetJustifyH("LEFT")
    foot.ScaleContainer.Text:SetPoint("TOPLEFT", 5, -5)
    foot.ScaleContainer.Text:SetPoint("BOTTOMLEFT", 5, 5)
    foot.ScaleContainer.Text:SetText(L["Scale"])

    local scale = CreateFrame("Slider", nil, foot.ScaleContainer, "MinimalSliderWithSteppersTemplate")
    scale:SetObeyStepOnDrag(true)
    scale:SetPoint("TOPLEFT", foot.ScaleContainer.Text, "TOPRIGHT", 5, 0)
    scale:SetPoint("BOTTOMRIGHT", foot.ScaleContainer, "BOTTOMRIGHT", 0, 5)
    -- Initialize the DB to have a default scale of 1 if there is not already an existing value
    if tonumber(self.db.global.windowScale) == nil then self.db.global.windowScale = 1 end
    scale:Init(self.db.global.windowScale, 0.8, 1.2, 80)
    scale.Slider:HookScript("OnMouseUp", function(slider)
        self.db.global.windowScale = slider:GetValue()
        self.Container:SetScale(slider:GetValue())
        self:PrintDebugMessage("AddOn scale:", self.db.global.windowScale)
    end)
    scale.Back:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        self.db.global.windowScale = val
        self.Container:SetScale(val)
        self:PrintDebugMessage("AddOn scale:", self.db.global.windowScale)
    end)
    scale.Forward:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        self.db.global.windowScale = val
        self.Container:SetScale(val)
        self:PrintDebugMessage("AddOn scale:", self.db.global.windowScale)
    end)

    foot.ScaleContainer.WindowScale = scale

    foot.OwnedContainer = CreateFrame("Frame", nil, foot)
    foot.OwnedContainer:SetWidth(125)
    foot.OwnedContainer:SetPoint("TOPRIGHT", foot, "TOPRIGHT", 0, 0)
    foot.OwnedContainer:SetPoint("BOTTOMRIGHT", foot, "BOTTOMRIGHT", 20, 0)
    
    -- "Show Owned" Checkbox
    local ownedCb = CreateFrame("CheckButton", nil, foot.OwnedContainer, "UICheckButtonTemplate")
    ownedCb:SetPoint("TOPRIGHT", foot.OwnedContainer, "TOPRIGHT", 0, 0)
    ownedCb:SetPoint("BOTTOMLEFT", foot.OwnedContainer, "BOTTOMRIGHT", -32, 0)
    ownedCb:SetChecked(self.db.global.showOwned)
    
    ownedCb.Text:SetText(L["Show Owned"])
    ownedCb.Text:ClearAllPoints()
    ownedCb.Text:SetPoint("RIGHT", ownedCb, "LEFT", -5, 2)
    ownedCb.Text:SetPoint("LEFT", foot.OwnedContainer, "LEFT")
    ownedCb.Text:SetJustifyH("RIGHT")
    ownedCb.Text:SetFontObject("GameTooltipText")
    
    ownedCb:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        self.db.global.showOwned = value
        self:UpdateListContents()
    end)

    foot.OwnedContainer.Checkbox = ownedCb
    foot.OwnedContainer.Checkbox:Show()

    -- "Use TomTom Waypoints" Checkbox
    foot.TomTomContainer = CreateFrame("Frame", nil, foot)
    foot.TomTomContainer:SetWidth(175)
    foot.TomTomContainer:SetPoint("TOPRIGHT", foot.OwnedContainer, "TOPLEFT", -10, 0)
    foot.TomTomContainer:SetPoint("BOTTOMRIGHT", foot.OwnedContainer, "BOTTOMLEFT", -10, 0)

    local tomtomCb = CreateFrame("CheckButton", nil, foot.TomTomContainer, "UICheckButtonTemplate")
    tomtomCb:SetPoint("TOPRIGHT", foot.TomTomContainer, "TOPRIGHT", 0, 0)
    tomtomCb:SetPoint("BOTTOMLEFT", foot.TomTomContainer, "BOTTOMRIGHT", -32, 0)
    tomtomCb:SetChecked(self.db.global.useTomTomPoints)

    tomtomCb.Text:SetText(L["Use TomTom waypoints"])
    tomtomCb.Text:ClearAllPoints()
    tomtomCb.Text:SetPoint("RIGHT", tomtomCb, "LEFT", -5, 0)
    tomtomCb.Text:SetJustifyH("RIGHT")
    tomtomCb.Text:SetFontObject("GameTooltipText")

    tomtomCb:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        self.db.global.useTomTomPoints = value
        self:UpdateListContents()
    end)

    foot.TomTomContainer.Checkbox = tomtomCb
    if C_AddOns.IsAddOnLoaded("TomTom") then foot.TomTomContainer:Show()
    else foot.TomTomContainer:Hide() end

    self.Footer = foot
end

---Filters a list of data based on search parameters
---@param listData (Mount|Toy|Pet)[]
---@return (Mount|Toy|Pet)[]
function AddOn:FilterListContentsByQuery(listData)
    local filtered = {}
    local query = self.Container.SearchBox:GetText():lower()
    local selectedTab = self.db.global.selectedTab

    local nameMatches, instanceMatches, encounterMatches, instanceTypeMatches, difficultyMatches, searchTagMatches = false, false, false, false, false, false
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
        end
        local cleanName = itemName:lower():gsub("|.+|.*", "")
        nameMatches = cleanName:match(query) and true or false
        instanceMatches = instanceName:lower():match(query) and true or false
        encounterMatches = encounterName:lower():match(query) and true or false
        instanceTypeMatches = query == L["raid"] and self:IsInstanceRaid(data) or (query == L["dungeon"] and not self:IsInstanceRaid(data))
        difficultyMatches = false
        for _, diffID in ipairs(data.DifficultyIDs) do
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

        if nameMatches or instanceMatches or encounterMatches or instanceTypeMatches or difficultyMatches or searchTagMatches then
            tinsert(filtered, data)
        end
    end
    return filtered
end

---Update the contents of the list shown in the UI
function AddOn:UpdateListContents()
    if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then UIParentLoadAddOn("Blizzard_Collections") end
    if not C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then UIParentLoadAddOn("Blizzard_EncounterJournal") end
    ---@type (Mount|Toy|Pet)[]
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
    end

    -- Filter list results based on search criteria when present
    if self.Container.SearchBox and self.Container.SearchBox:GetText() ~= "" then
        newData = self:FilterListContentsByQuery(newData)
    end

    self.ICHDataProvider = CreateDataProvider(newData)
    self.ScrollView:SetDataProvider(self.ICHDataProvider)
    -- if #newData ~= self.ICHDataProvider:GetSize() and event == "ZONE_CHANGED" then
        -- self:PrintChatMessage(L["Updated available mount list"])
    -- end
end

-- Exposes AddOn functionality for use in XML Templates
ICH = AddOn
ICH_LANG = L
