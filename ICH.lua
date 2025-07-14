local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)
local LDB = LibStub("LibDataBroker-1.1")
ICH = {}

---Handles slash commands in a way that overrides the default behavior of Ace3 slash commands. Executing the command with no arguments
---opens the AddOn options window, providing the `help` argument displays a list of available arguments and uses for the slash command,
---and all other arguments are handled using Ace3's default behavior.
---@param cmd string The slash command used (should be exactly `/ich`)
---@param input string The argument provided to the slash command
function AddOn.HandleSlashCommand(cmd, input)
    input = strtrim(input)
    local AceConfigCmd = LibStub("AceConfigCmd-3.0")
    if input == "" then
        if AddOn.Container then AddOn.Container:Show() end
    elseif input == "help" then AceConfigCmd:HandleCommand(cmd, name, "")
    else AceConfigCmd:HandleCommand(cmd, name, input)
    end
end

function AddOn:OnInitialize()
    -- Load database
	self.db = LibStub("AceDB-3.0"):New("ICH_DB", AddOn.DatabaseDefaults, true)

    -- Data broker registration for minimap icon
    local broker = LDB:NewDataObject(name, {
        type = "launcher",
        text = name,
        icon = "Interface/AddOns/InstanceCollectionHelper/Media/Logo.png",
        OnClick = function() if self.Container then self.Container:Show() end end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine(name)
            tooltip:AddLine("Track available mounts from instances and easily set required instance difficulty", 1, 1, 1, 1)
        end
    })
    self.Icon:Register(name, broker, self.db.global.minimap)

    -- Setup config options
    local config = LibStub("AceConfig-3.0")
    config:RegisterOptionsTable(name, self.SlashOptions, "ich")
    -- Override default slash command behavior so /ich opens the addon
    self:RegisterChatCommand("ich", function(input) self.HandleSlashCommand("ich", input) end)
    
    self:CreateMainFrame()
    self.Container:HookScript("OnShow", function() self:UpdateListContents("ICH_OPEN") end)
    self:RegisterEvent("ZONE_CHANGED", "UpdateListContents")
end

---Initializes the AddOn window.<br/>
---Internally creates a scrollable list of data to display initially as well.
function AddOn:CreateMainFrame()
    local f = CreateFrame("Frame", "ICHMain", UIParent)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetSize(800, 600)
    f:EnableMouse(true)
    f:SetMovable(true)

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
    f.SearchBox:SetSize(350, 30)
    f.SearchBox.Instructions:SetText("Search by mount/instance name, instance type, or difficulty")
    f.SearchBox:HookScript("OnTextChanged", function() self:UpdateListContents("ICH_SEARCH") end)
    
    -- Close button
    f.CloseButton = CreateFrame("Button", "ICHCloseButton", f, "UIPanelCloseButtonDefaultAnchors")
    f.CloseButton:SetSize(20, 20)

    -- Search Hints button
    f.SearchHintsButton = CreateFrame("Button", "ICHSearchHintsButton", f, "ICHGenericButtonTemplate")
    f.SearchHintsButton.action = "SEARCH"
    f.SearchHintsButton:SetPoint("TOPRIGHT", f.CloseButton, "TOPLEFT", -10, 0)
    f.SearchHintsButton:SetNormalTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\SearchHintsIcon.png")
    f.SearchHintsButton:SetHighlightTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\SearchHintsIcon.png")

    -- Info button
    f.InfoButton = CreateFrame("Button", "ICHInfoButton", f, "ICHGenericButtonTemplate")
    f.InfoButton.action = "INFO"
    f.InfoButton:SetPoint("RIGHT", f.SearchHintsButton, "LEFT", -10, 0)
    f.InfoButton:SetNormalTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\InfoIcon.png")
    f.InfoButton:SetHighlightTexture("Interface\\AddOns\\InstanceCollectionHelper\\Media\\InfoIcon.png")

    -- Allows closing via ESC key
    tinsert(UISpecialFrames, f:GetName())

    self.Container = f
    self:CreateScrollingView()

    -- Hide by default
    self.Container:Hide()
end

---Initializes the scrollable list of data to display.<br/>
---Currently only displays mount information.
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
    self.ScrollView:SetElementInitializer("ICHListItemTemplate", self.DataProviderInit)
end

function AddOn:UpdateListContents(event)
    if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then UIParentLoadAddOn("Blizzard_Collections") end
    if not C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then UIParentLoadAddOn("Blizzard_EncounterJournal") end
    local newData = {}
    for _, data in ipairs(self.InstanceMounts) do
        local isOwned = select(11, C_MountJournal.GetMountInfoByID(data.MountID))
        if not isOwned then tinsert(newData, data) end
    end

    -- Filter list results based on search criteria when present
    if self.Container.SearchBox and self.Container.SearchBox:GetText() ~= "" then
        local filteredData = {}
        local searchBox = self.Container.SearchBox
        local query = searchBox:GetText():lower()
        for _, nData in ipairs(newData) do
            local nameMatches = nData.Name:lower():gsub("|.+|.*", ""):match(query) and true or false
            local instanceMatches = nData.Instance:lower():match(query) and true or false
            local instanceTypeMatches = query == "raid" and self:IsInstanceRaid(nData) or (query == "dungeon" and not self:IsInstanceRaid(nData))
            local difficultyMatches = false
            for _, diffID in ipairs(nData.DifficultyIDs) do
                if self:GetDifficultyButtonText(diffID):lower() == query or self:GetInstanceDifficultyText(diffID):lower() == query then
                    difficultyMatches = true
                    break
                end
            end
            if not difficultyMatches and nData.SharedDifficulties then
                for shared, _ in pairs(nData.SharedDifficulties) do
                    if self:GetDifficultyButtonText(shared):lower() == query or self:GetInstanceDifficultyText(shared):lower() == query then
                        difficultyMatches = true
                        break
                    end
                end
            end

            if nameMatches or instanceMatches or instanceTypeMatches or difficultyMatches then
                tinsert(filteredData, nData)
            end
        end

        newData = filteredData
    end

    self.ICHDataProvider = CreateDataProvider(newData)
    self.ScrollView:SetDataProvider(self.ICHDataProvider)
    if #newData ~= self.ICHDataProvider:GetSize() and event == "ZONE_CHANGED" then
         self:PrintChatMessage("Updated available mount list")
    end
end

-- Exposes AddOn functionality for use in XML
ICH = AddOn