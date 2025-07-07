local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)
local LDB = LibStub("LibDataBroker-1.1")
ICH = {}

function AddOn:PrintChatMessage(...)
    print("|cFF00CCFFInstance Collection Helper: |r", ...)
end

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
        icon = "Interface/Icons/Spell_Tailor_MountSpeedUp01", -- TODO: Create an icon later
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
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateListContents")
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

    -- Info section
    f.Info = f:CreateFontString("ICHInfo", "OVERLAY", "GameTooltipText")
    f.Info:SetPoint("TOPLEFT", f.Title, "BOTTOMLEFT", 25, -10)
    f.Info:SetPoint("TOPRIGHT", f.Title, "BOTTOMRIGHT", -25, -10)
    f.Info:SetText("Find the mount you want to collect in the list and click the button for the difficulty you want to run on to make sure it is updated. Search functionality for mounts will be added soon.\n\nWhen you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled.")
    f.Info:SetTextColor(1, 0.82, 0, 1)
    
    -- Close button
    f.CloseButton = CreateFrame("Button", "ICHCloseButton", f, "UIPanelCloseButtonDefaultAnchors")
    f.CloseButton:SetSize(20, 20)
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
    self.Container.ListHeaders:SetPoint("TOPLEFT", self.Container.Info, "BOTTOMLEFT", -15, -10)
    self.Container.ListHeaders:SetPoint("TOPRIGHT", self.Container.Info, "BOTTOMRIGHT", 15, -10)

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
    local newData = {}
    for _, data in ipairs(self.InstanceMounts) do
        local isOwned = select(11, C_MountJournal.GetMountInfoByID(data.MountID))
        if not isOwned then tinsert(newData, data) end
    end

    if #newData ~= self.ICHDataProvider:GetSize() then
        if event ~= "PLAYER_ENTERING_WORLD" then self:PrintChatMessage("Number of obtainable mounts changed. The mount list will be updated.") end
        self.ICHDataProvider = CreateDataProvider(newData)
        self.ScrollView:SetDataProvider(self.ICHDataProvider)
    end

end

-- Exposes AddOn functionality for use in XML
ICH = AddOn