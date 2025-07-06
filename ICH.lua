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
        icon = "Interface/Icons/Spell_Frost_FrostArmor", -- TODO: Create/add an icon later
        OnClick = function()
            if self.Container then self.Container:Show() end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:AddLine(name)
            tooltip:AddLine("Makes sure you set your instance settings are farm-ready", 1, 1, 1, 1)
        end
    })
    self.Icon:Register(name, broker, self.db.global.minimap)

    -- Setup config options
    local config = LibStub("AceConfig-3.0")
    config:RegisterOptionsTable(name, self.SlashOptions, "ich")
    -- Override default slash command behavior so /ich opens the addon
    self:RegisterChatCommand("ich", function(input) self.HandleSlashCommand("ich", input) end)

    self:CreateMainFrame()
end

---Initializes the AddOn window.<br/>
---Internally creates a scrollable list of data to display initially as well.
function AddOn:CreateMainFrame()
    local f = CreateFrame("Frame", "ICHMain", UIParent)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
    f:SetSize(900, 500) -- Wider for split view
    f:EnableMouse(true)
    f:SetMovable(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", function(frame) frame:StartMoving() end)
    f:SetScript("OnDragStop", function(frame) frame:StopMovingOrSizing() end)

    -- Left Pane (for boss/map info, etc.)
    f.LeftPane = CreateFrame("Frame", nil, f)
    f.LeftPane:SetPoint("TOPLEFT", f, "TOPLEFT", 10, -40)
    f.LeftPane:SetPoint("BOTTOMLEFT", f, "BOTTOMLEFT", 10, 10)
    f.LeftPane:SetWidth(320) -- Adjust as needed
    f.LeftPane.Bg = f.LeftPane:CreateTexture(nil, "BACKGROUND")
    f.LeftPane.Bg:SetAllPoints(f.LeftPane)
    f.LeftPane.Bg:SetColorTexture(0.12, 0.12, 0.12, 0.7)

    -- Right Pane (for object list)
    f.RightPane = CreateFrame("Frame", nil, f)
    f.RightPane:SetPoint("TOPLEFT", f.LeftPane, "TOPRIGHT", 10, 0)
    f.RightPane:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 10)
    f.RightPane.Bg = f.RightPane:CreateTexture(nil, "BACKGROUND")
    f.RightPane.Bg:SetAllPoints(f.RightPane)
    f.RightPane.Bg:SetColorTexture(0.18, 0.18, 0.18, 0.7)

    -- Mouse drag operations
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
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, f:GetName())

    -- Store reference for later use
    self.Container = f
    self.LeftPane = f.LeftPane
    self.RightPane = f.RightPane
    self:CreateScrollingView()

    -- Hide by default
    self.Container:Hide()
end

---Initializes the scrollable list of data to display.<br/>
---Currently only displays mount information.
function AddOn:CreateScrollingView()
    self.RightPane.ListHeaders = CreateFrame("Frame", "ICHListHeaders", self.RightPane, "ICHListHeadersTemplate")
    self.RightPane.ListHeaders:SetPoint("TOPLEFT", self.RightPane, "TOPLEFT", 10, -10)
    self.RightPane.ListHeaders:SetPoint("TOPRIGHT", self.RightPane, "TOPRIGHT", -10, -10)

    -- ScrollBox: leave space for the scrollbar on the right
    -- Anchored to the bottom of ListHeaders, fills the remaining space in RightPane
    self.ScrollBox = CreateFrame("Frame", "ICHScrollBox", self.RightPane, "WowScrollBoxList")
    self.ScrollBox:SetPoint("TOPLEFT", self.RightPane.ListHeaders, "BOTTOMLEFT", 0, -5)
    self.ScrollBox:SetPoint("BOTTOMLEFT", self.RightPane, "BOTTOMLEFT", 0, 20)
    self.ScrollBox:SetPoint("TOPRIGHT", self.RightPane, "TOPRIGHT", -20, -5)
    self.ScrollBox:SetPoint("BOTTOMRIGHT", self.RightPane, "BOTTOMRIGHT", -20, 20)

    -- ScrollBar: fixed width, anchored to the right edge of RightPane
    self.ScrollBar = CreateFrame("EventFrame", "ICHScrollBar", self.RightPane, "MinimalScrollBar")
    self.ScrollBar:SetPoint("TOPRIGHT", self.RightPane.ListHeaders, "BOTTOMRIGHT", 5, -5)
    self.ScrollBar:SetPoint("BOTTOMRIGHT", self.RightPane, "BOTTOMRIGHT", 5, 20)
    self.ScrollBar:SetWidth(12)
    self.ScrollBar:SetHideIfUnscrollable(true)

    self.ICHDataProvider = CreateDataProvider()
    self.ScrollView = CreateScrollBoxListLinearView()
    self.ScrollView:SetDataProvider(self.ICHDataProvider)

    ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView)
    self.ScrollView:SetElementInitializer("ICHListItemTemplate", self.DataProviderInit)
    for _, data in ipairs(self.InstanceMounts) do
        self.ICHDataProvider:Insert(data)
    end
end

-- Exposes AddOn functionality for use in XML
ICH = AddOn