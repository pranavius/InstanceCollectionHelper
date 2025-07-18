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
            tooltip:SetText(name)
            tooltip:AddLine(L["Track available mounts from instances and easily set required instance difficulty"], 1, 1, 1, true)
            tooltip:AddLine(L["Type \"/ich help\" in the chat window for available slash commands"])
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
    f:SetFrameStrata("HIGH")

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
    f.SearchBox.Instructions:SetText(L["Search by mount/instance name, instance type, or difficulty"])
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
    self:CreateFooter()

    -- Set window scale
    self.Container:SetScale(self.db.global.windowScale)

    -- Hide by default
    self.Container:Hide()
end

---Initializes the scrollable list of data to display in the AddOn.<br/>
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
    end)
    scale.Back:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        self.db.global.windowScale = val
        self.Container:SetScale(val)
    end)
    scale.Forward:HookScript("OnClick", function()
        local val = scale.Slider:GetValue()
        self.db.global.windowScale = val
        self.Container:SetScale(val)
    end)

    foot.ScaleContainer.WindowScale = scale

    -- "Show Owned Mounts" Checkbox
    foot.OwnedContainer = CreateFrame("Frame", nil, foot)
    foot.OwnedContainer:SetWidth(175)
    foot.OwnedContainer:SetPoint("TOPLEFT", foot.ScaleContainer, "TOPRIGHT", 5, 0)
    foot.OwnedContainer:SetPoint("BOTTOMLEFT", foot.ScaleContainer, "BOTTOMRIGHT", 5, 0)
    
    local checkbox = CreateFrame("CheckButton", nil, foot.OwnedContainer, "UICheckButtonTemplate")
    checkbox:SetPoint("TOPRIGHT", foot.OwnedContainer, "TOPRIGHT", 0, 0)
    checkbox:SetPoint("BOTTOMLEFT", foot.OwnedContainer, "BOTTOMRIGHT", -32, 0)
    checkbox:SetChecked(self.db.global.showOwned)
    
    checkbox.Text:SetText(L["Show Owned Mounts"])
    checkbox.Text:ClearAllPoints()
    checkbox.Text:SetPoint("RIGHT", checkbox, "LEFT", -5, 2)
    checkbox.Text:SetJustifyH("RIGHT")
    checkbox.Text:SetFontObject("GameTooltipText")
    
    checkbox:HookScript("OnClick", function(cb)
        local value = cb:GetChecked()
        self.db.global.showOwned = value
        self:UpdateListContents("ICH_OWNED")
    end)
    
    foot.OwnedContainer.Checkbox = checkbox
end

---Filters a list of data based on search parameters
---@param listData InstanceMount[]
---@return InstanceMount[]
function AddOn:FilterListContentsByQuery(listData)
    local filtered = {}
    local query = self.Container.SearchBox:GetText():lower()
    for _, item in ipairs(listData) do
        -- Remove things like textures or atlases from names
        local cleanName = item.Name:lower():gsub("|.+|.*", "")
        local nameMatches = cleanName:match(query) and true or false
        local instanceMatches = item.Instance:lower():match(query) and true or false
        local instanceTypeMatches = query == "raid" and self:IsInstanceRaid(item) or (query == "dungeon" and not self:IsInstanceRaid(item))
        local difficultyMatches = false
        for _, diffID in ipairs(item.DifficultyIDs) do
            if self:GetDifficultyButtonText(diffID):lower() == query or self:GetInstanceDifficultyText(diffID):lower() == query then
                difficultyMatches = true
                break
            end
        end
        if not difficultyMatches and item.SharedDifficulties then
            for shared, _ in pairs(item.SharedDifficulties) do
                if self:GetDifficultyButtonText(shared):lower() == query or self:GetInstanceDifficultyText(shared):lower() == query then
                    difficultyMatches = true
                    break
                end
            end
        end

        if nameMatches or instanceMatches or instanceTypeMatches or difficultyMatches then
            tinsert(filtered, item)
        end
    end

    return filtered
end

---Update the contents of the list shown in the UI
---@param event string The event that triggered the list update
function AddOn:UpdateListContents(event)
    if not C_AddOns.IsAddOnLoaded("Blizzard_Collections") then UIParentLoadAddOn("Blizzard_Collections") end
    if not C_AddOns.IsAddOnLoaded("Blizzard_EncounterJournal") then UIParentLoadAddOn("Blizzard_EncounterJournal") end
    ---@type InstanceMount[]
    local newData = {}
    for _, data in ipairs(self.InstanceMounts) do
        local isOwned = select(11, C_MountJournal.GetMountInfoByID(data.MountID))
        if not isOwned or (isOwned and self.db.global.showOwned) then tinsert(newData, data) end
    end

    -- Filter list results based on search criteria when present
    if self.Container.SearchBox and self.Container.SearchBox:GetText() ~= "" then
        newData = self:FilterListContentsByQuery(newData)
    end

    self.ICHDataProvider = CreateDataProvider(newData)
    self.ScrollView:SetDataProvider(self.ICHDataProvider)
    if #newData ~= self.ICHDataProvider:GetSize() and event == "ZONE_CHANGED" then
        self:PrintChatMessage(L["Updated available mount list"])
    end
end

-- Exposes AddOn functionality for use in XML Templates
ICH = AddOn
ICH_LANG = L