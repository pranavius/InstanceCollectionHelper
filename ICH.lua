local name, AddOn = ...

---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)
local LDB = LibStub("LibDataBroker-1.1")

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
        AddOn.PrintChatMessage(L["Debug messages"], AddOn.db.global.debugMessages and L["enabled"] or L["disabled"])
    elseif input == "wt" or input:match("^wt%s") then
        local arg = input:match("^wt%s+(%S+)$")
        if not arg then ICHWorldTour:Toggle()
        elseif arg == "next" then AddOn.WorldTour:Next()
        elseif arg == "prev" then AddOn.WorldTour:Prev()
        elseif arg == "start" then AddOn.WorldTour:Start()
        elseif arg == "stop" then AddOn.WorldTour:Stop()
        else
            AddOn.PrintChatMessage(ERROR_COLOR:WrapTextInColorCode(L["Invalid world tour command."]))
        end
    elseif input == "help" then AceConfigCmd:HandleCommand(cmd, name, "")
    else AceConfigCmd:HandleCommand(cmd, name, input)
    end
end

function AddOn:OnInitialize()
    -- Generate proper search tags for all collectibles
    for _, mount in ipairs(self.Mounts) do self.AppendMapSearchTags(mount) end
    for _, toy in ipairs(self.Toys) do self.AppendMapSearchTags(toy) end
    for _, pet in ipairs(self.Pets) do self.AppendMapSearchTags(pet) end
    for _, item in ipairs(self.DecorItems) do self.AppendMapSearchTags(item) end

    -- Load database
	self.db = LibStub("AceDB-3.0"):New("ICH_DB", AddOn.DatabaseDefaults, true)
    -- Create local caches for Toys, Pets, Decor, and Timewalking Items
    self:CreateToyCache()
    self:CreatePetCache()
    self:CreateDecorCache()
    self:CreateTimewalkingCache()
    self.WorldTour:BuildRoute(false)

    -- Data broker registration for minimap icon
    local broker = LDB:NewDataObject(name, {
        type = "launcher",
        label = name,
        icon = "Interface/AddOns/InstanceCollectionHelper/Media/Logo",
        OnClick = function(_, btn)
        if btn == "RightButton" then self.Settings:ToggleWindow()
        else self:ToggleWindow() end
        end,
        OnTooltipShow = function(tooltip)
            tooltip:SetText(self.Title)
            tooltip:AddLine(L["Track available collectibles from instances and easily set required instance difficulty"], 1, 1, 1, true)
            tooltip:AddLine(" ")
            tooltip:AddLine(L["Click to open the AddOn window"], 1, 1, 1, true)
            tooltip:AddLine(L["Right-click to open the settings window"], 1, 1, 1, true)
            tooltip:AddLine(L["Type /ich help in the chat window for available slash commands"], 0.67, 0.67, 0.67)
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
    self:RegisterEvent("ZONE_CHANGED", function() self:UpdateListContents() end)
    -- Auto-progression of World Tour step based on DestinationID (work in progress)
    -- self:RegisterEvent("ZONE_CHANGED_NEW_AREA", function()
    --     if not self.db.global.worldTour.active then return end
    --     local step, index = self.WorldTour:GetCurrentStep()
    --     if step and self.WorldTour:IsStepCompleted(step, index) then
    --         self.WorldTour:Next()
    --     end
    -- end)
    self:RegisterEvent("PLAYER_LOGOUT", function()
        if C_AddOns.IsAddOnLoaded("TomTom") and self.db.global.currentTomTomWaypoint then
            TomTom:RemoveWaypoint(self.db.global.currentTomTomWaypoint)
            self.db.global.currentTomTomWaypoint = nil
        end
        -- Stop any active World Tour on logout so that a fresh session can be started again when relogging
        self.db.global.worldTour.active = false
    end)
    self:RegisterEvent("PLAYER_ENTERING_WORLD", function()
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        local currentGUID = UnitGUID("player")
        if self.db.global.worldTour.lastCharacterGUID ~= currentGUID then
            self.db.global.worldTour.lastCharacterGUID = currentGUID
            self.WorldTour:Reset()
        end
    end)
    
    EventRegistry:RegisterCallback("ICHEvent.UpdateListContents", function() self:UpdateListContents() end)
    EventRegistry:RegisterCallback("ICHEvent.UpdateSettingsPanel", function() self.Settings:RefreshFavoriteButtons() end)
end

function AddOn:ConfigureOnInit()
    ICHScrollBox:InitializeScrollView()
    local isInvalidScale = tonumber(self.db.global.windowScale) == nil or tonumber(self.db.global.windowScale) == 0
    if isInvalidScale then self.db.global.windowScale = 1 end
    ICHFooter.ScaleContainer.WindowScale:Init(AddOn.db.global.windowScale, 0.8, 1.2, 80)
    ICHFooter.AvailableContainer.Checkbox:SetChecked(self.db.global.showAvailableOnly)
    ICHFooter.OwnedContainer.Checkbox:SetChecked(self.db.global.showOwned)
    ICHFooter.TomTomContainer.Checkbox:SetChecked(self.db.global.useTomTomPoints)
    self:CreateTabSystem()
    self.Tabs:SetTab(self.Tabs.MountsTab)
    -- Set window scale
    self.Container:SetScale(self.db.global.windowScale)
end

---Returns whether a collectible can still be obtained this reset on at least one difficulty
---@param data Mount|Toy|Pet|DecorItem
---@return boolean
function AddOn:IsCollectibleAvailable(data)
    if self:IsEncounterCompletedOnSharedDifficulty(data) then return false end
    for _, diffID in ipairs(data.DifficultyIDs or {}) do
        if not self.IsEncounterCompleted(data, diffID) then return true end
    end
    return false
end

---Splits a search query into a flat list of tokens: terms and single-character operators
---\
---*Valid operator tokens:* `&`  `|`  `!`  `(`  `)`
---@param query string
---@return string[] tokens
local function tokenizeSearchQuery(query)
    local tokens = {}
    local i = 1
    while i <= #query do
        local char = query:sub(i, i)
        if char:match("%s") then
            AddOn:PrintDebugMessage("Whitespace matched, continue loop")
            i = i + 1
        elseif char == "(" or char == ")" or char == "&" or char == "|" or char == "!" then
            AddOn:PrintDebugMessage("Logical operator matched:", char, "-- storing and continuing loop")
            tinsert(tokens, char)
            i = i + 1
        else
            local j = i + 1
            -- Expand search across remainder of the search query to look for a single search term
            -- Inner loop stops when a logical operator or whitespace is found
            while j <= #query and not query:sub(j, j):match("[%s%(%)&|!]") do j = j + 1 end
            AddOn:PrintDebugMessage("Standalone search term matched:", query:sub(i, j - 1), "-- storing and continue outer loop from index", j)
            tinsert(tokens, query:sub(i, j - 1))
            i = j
        end
    end
    return tokens
end

---Returns `true` if a search term matches the given item by some means, `false` otherwise.\
---* Collectible name, instance name, and boss/encounter name can be matched partially
---* Collectible type, instance difficulty, and search tag must match exactly
---@param data Mount|Toy|Pet|DecorItem|TimewalkingItem|WowRemixItem
---@param term string
---@param selectedTab number
local function itemMatchesTerm(data, term, selectedTab)
    local itemName
    if selectedTab == AddOn.Tabs.MountsTab then
        itemName = C_MountJournal.GetMountInfoByID(data.ID) or data.Name
    elseif selectedTab == AddOn.Tabs.ToysTab then
        itemName = select(2, C_ToyBox.GetToyInfo(data.ItemID)) or data.Name
    elseif selectedTab == AddOn.Tabs.PetsTab then
        itemName = C_PetJournal.GetPetInfoByItemID(data.PetItemID) or data.Name
    elseif selectedTab == AddOn.Tabs.TimewalkingVendorTab then
        local twData = AddOn.TimewalkingCache[data.ItemID]
        itemName = twData and twData.itemName or data.Name
    elseif selectedTab == AddOn.Tabs.DecorTab then
        local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(data.DecorItemID)
        itemName = decor and decor.name or data.Name
    end
    local cleanName = (itemName or data.Name):lower():gsub("|.+|.*", "")
    local instanceName = (EJ_GetInstanceInfo(data.InstanceID) or data.Instance or ""):lower()
    local encounterName = (data.EncounterID and EJ_GetEncounterInfo(data.EncounterID) or ""):lower()

    -- Collectible name, instance name, and boss name
    if cleanName:find(term, 1, true) then return true end
    if instanceName:find(term, 1, true) then return true end
    if encounterName:find(term, 1, true) then return true end

    -- Instance difficulty
    if data.DifficultyIDs and ((term == L["raid"] and AddOn:IsInstanceRaid(data)) or (term == L["dungeon"] and not AddOn:IsInstanceRaid(data))) then
        return true
    end
    for _, diffID in ipairs(data.DifficultyIDs or {}) do
        if AddOn:GetDifficultyButtonText(diffID):lower() == term or AddOn:GetInstanceDifficultyText(diffID):lower() == term then
            return true
        end
    end
    if data.SharedDifficulties then
        for shared in pairs(data.SharedDifficulties) do
            if AddOn:GetDifficultyButtonText(shared):lower() == term or AddOn:GetInstanceDifficultyText(shared):lower() == term then
                return true
            end
        end
    end

    -- Search tag
    for _, tag in ipairs(data.SearchTags or {}) do
        if tag:lower() == term then return true end
    end

    -- Include matching for collectible type if defined (Timewalking & Remix items)
    return data.Type and L[data.Type] and term == L[data.Type]:lower() or false
end

-- Forward declaration so parseAtom() can reference it as an upvalue for sub-expressions where needed
local parseExpr

---Parse single search term or group of terms encapsulated by parenthesis.
---Absence of returned search token indicates end of input or logical operator
---@param tokens string[]
---@param pos number
---@return string? token
---@return number newPos
local function parseAtom(tokens, pos)
    local token = tokens[pos]
    if token == "(" then
        -- Parsing group of search terms using recursive parser function
        -- Returning newPos in the absence of a closing parenthesis prevents crashing when it's forgotten or not yet entered
        local result, newPos = parseExpr(tokens, pos + 1)
        return result, (tokens[newPos] == ")" and newPos + 1 or newPos)
    elseif token and token ~= ")" and token ~= "&" and token ~= "|" and token ~= "!" then
        -- Parsing single search term
        return token, pos + 1
    end
    -- End of input or logical operator with existing position
    -- Returning the same position indicates no token was consumed (used by parseAndExpr to break recursion)
    return nil, pos
end

---Recursively parses search expressions that use the NOT logical operator (`!`)
---@param tokens string[]
---@param pos number
---@return string|nil|SearchNotOperatorNode result
---@return number newPos
local function parseNotExpr(tokens, pos)
    if tokens[pos] == "!" then
        local operand, newPos = parseNotExpr(tokens, pos + 1)
        AddOn:PrintDebugMessage("NOT operator: Output from recursive parseNotExpr:", operand)
        return { op = "not", operand = operand }, newPos
    end
    return parseAtom(tokens, pos)
end

---Recursively parses search expressions that use the AND logical operator (`&`) or implicit AND operator between terms via adjacency
---@param tokens string[]
---@param pos number
---@return SearchLogicalOperatorNode result
---@return number newPos
local function parseAndExpr(tokens, pos)
    -- Handle any leading NOT operators or plain search terms seen before an AND operator
    local left, newPos = parseNotExpr(tokens, pos)
    pos = newPos
    while tokens[pos] do
        local tok = tokens[pos]
        if tok == "&" then
            -- Explicit AND: advance past "&" and parse the right side
            local right, rPos = parseNotExpr(tokens, pos + 1)
            AddOn:PrintDebugMessage("AND operator: building node with left:", left, "and right:", right)
            left, pos = { op = "and", left = left, right = right }, rPos
        elseif tok ~= "|" and tok ~= ")" then
            -- Implicit AND: token starts new operand with no explicit operator
            local right, rPos = parseNotExpr(tokens, pos)
            if rPos == pos then break end
            AddOn:PrintDebugMessage("AND operator (implicit): building node with left:", left, "and right:", right)
            left, pos = { op = "and", left = left, right = right }, rPos
        else
            -- "|" or ")" belongs to an enclosing expression, stop here
            break
        end
    end
    return left, pos
end

---Recursively parses search expressions that use the OR logical operator (`|`).
---**This is the top-level parse function**
---@param tokens string[]
---@param pos number
---@return SearchLogicalOperatorNode result
---@return number newPos
parseExpr = function(tokens, pos)
    local left, newPos = parseAndExpr(tokens, pos)
    pos = newPos
    while tokens[pos] == "|" do
        -- OR operator: advance past | and parse the right-hand operand
        local right, rPos = parseAndExpr(tokens, pos + 1)
        AddOn:PrintDebugMessage("OR operator: building node with left:", left, "and right:", right)
        left, pos = { op = "or", left = left, right = right }, rPos
    end
    return left, pos
end

---Recursively evaluates a parsed expression node against a given item. Called once per item per search.
---@param data Mount|Toy|Pet|TimewalkingItem|WowRemixItem|DecorItem
---@param expr string|nil|SearchNotOperatorNode|SearchLogicalOperatorNode
---@param selectedTab number
---@return boolean
local function evalExpr(data, expr, selectedTab)
    if expr == nil then return false end
    if type(expr) == "string" then return itemMatchesTerm(data, expr, selectedTab) end
    if expr.op == "and" then return evalExpr(data, expr.left, selectedTab) and evalExpr(data, expr.right, selectedTab) end
    if expr.op == "or"  then return evalExpr(data, expr.left, selectedTab) or evalExpr(data, expr.right, selectedTab) end
    if expr.op == "not" then return not evalExpr(data, expr.operand, selectedTab) end
    return false
end

---Filters a list of data based on search parameters; supports &(AND), |(OR), !(NOT), and parentheses for grouping; adjacency is implicit AND
---@param listData (Mount|Toy|Pet|TimewalkingItem|WowRemixItem|DecorItem)[]
---@return (Mount|Toy|Pet|TimewalkingItem|WowRemixItem|DecorItem)[]
function AddOn:FilterListContentsByQuery(listData)
    local filtered = {}
    local selectedTab = self.db.global.selectedTab
    local expr = parseExpr(tokenizeSearchQuery(self.Container.SearchBox:GetText():lower()), 1)

    for _, data in ipairs(listData) do
        if evalExpr(data, expr, selectedTab) then tinsert(filtered, data) end
    end
    return filtered
end

---Update the contents of the list shown in the UI
function AddOn:UpdateListContents()
    ---@type (Mount|Toy|Pet|TimewalkingItem|WowRemixItem|DecorItem)[]
    local newData = {}
    local selectedTab = self.db.global.selectedTab
    if selectedTab == self.Tabs.MountsTab then
        for _, mount in ipairs(self.Mounts) do
            -- Checking hideOnChar for mounts like Grand Black War Mammoth, which has a faction specific version
            local _, _, _, _, _, _, _, _, _, hideOnChar, isOwned = C_MountJournal.GetMountInfoByID(mount.ID)
            local mountExists = hideOnChar ~= nil and isOwned ~= nil
            local isAvailable = not self.db.global.showAvailableOnly or self:IsCollectibleAvailable(mount)
            if mountExists and not hideOnChar and (not isOwned or (isOwned and self.db.global.showOwned)) and isAvailable then
                tinsert(newData, mount)
            elseif mountExists and not hideOnChar and not isOwned then
                self:PrintDebugMessage("Failed to curate table data for mount:", mount.Name)
            end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by mount/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.ToysTab then
        for _, toy in ipairs(self.Toys) do
            local toyExists = C_Item.GetItemInfoInstant(toy.ItemID) ~= nil
            local isOwned = PlayerHasToy(toy.ItemID)
            local isAvailable = not self.db.global.showAvailableOnly or self:IsCollectibleAvailable(toy)
            if toyExists and (not isOwned or (isOwned and self.db.global.showOwned)) and isAvailable then
                tinsert(newData, toy)
            elseif toyExists and not isOwned then
                self:PrintDebugMessage("Failed to curate table data for toy:", toy.Name)
            end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by toy/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.PetsTab then
        for _, pet in ipairs(self.Pets) do
            local petExists = C_Item.GetItemInfoInstant(pet.PetItemID) ~= nil
            local petData = self.PetCache[pet.PetItemID]
            local isOwned = petData and self.GetIsPetOwned(petData.speciesID) or false
            local isAvailable = not self.db.global.showAvailableOnly or self:IsCollectibleAvailable(pet)
            if petExists and (not isOwned or (isOwned and self.db.global.showOwned)) and isAvailable then
                tinsert(newData, pet)
            elseif petExists and not isOwned then
                self:PrintDebugMessage("Failed to curate table data for pet:", pet.Name)
            end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by pet/instance name, instance type, difficulty, or expansion"])
    elseif selectedTab == self.Tabs.TimewalkingVendorTab then
        self.activeTimewalkingExpansion = self:GetActiveTimewalkingExpansion()
        for _, item in ipairs(self.TimewalkingItems) do
            local itemData = self.TimewalkingCache[item.ItemID]

            if itemData then
                local isOwned = self.IsVendorItemOwned(itemData, item.Type)
                -- When showing only available items, only show items from the current timewalking event vendors + any that can be purchased from all vendors
                local isAvailable = not self.db.global.showAvailableOnly
                    or item.Expansion == self.activeTimewalkingExpansion
                    or (item.Expansion == "-" and self.activeTimewalkingExpansion ~= nil)
                local shouldInsert = false
                if item.Type == "Mount" then
                    local hideOnChar = select(10, C_MountJournal.GetMountInfoByID(itemData.mountID))
                    shouldInsert = not hideOnChar and (not isOwned or (isOwned and self.db.global.showOwned))
                else
                    shouldInsert = not isOwned or (isOwned and self.db.global.showOwned)
                end

                if shouldInsert and isAvailable then
                    tinsert(newData, item)
                elseif not isOwned then
                    self:PrintDebugMessage("Failed to curate table data for Timewalking item:", item.Name)
                end
            else
                self:PrintDebugMessage("Item data not found in Timewalking cache for:", item.Name)
            end
        end
    elseif selectedTab == self.Tabs.DecorTab then
        for _, item in ipairs(self.DecorItems) do
            local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(item.DecorItemID)
            local decorExists = C_Item.GetItemInfoInstant(item.DecorItemID) ~= nil
            local isOwned = decor and decor.quantity and decor.numPlaced and (decor.quantity + decor.numPlaced > 0) or false ---@diagnostic disable-line: undefined-field
            local isAvailable = not self.db.global.showAvailableOnly or self:IsCollectibleAvailable(item)
            if decorExists and (not isOwned or (isOwned and self.db.global.showOwned)) and isAvailable then
                tinsert(newData, item)
            elseif decorExists and not isOwned then
                self:PrintDebugMessage("Failed to curate table data for decor:", item.Name)
            end
        end
        self.Container.SearchBox.Instructions:SetText(L["Search by decor/instance name, instance type, difficulty, or expansion"])
    end

    -- Filter list results based on search criteria when present
    if self.Container.SearchBox and self.Container.SearchBox:GetText() ~= "" then
        newData = self:FilterListContentsByQuery(newData)
    end

    newData = self:ApplySortAndFavorites(newData)
    self:RefreshSortIndicators()
    self.ICHDataProvider = CreateDataProvider(newData)
    self.ScrollView:SetDataProvider(self.ICHDataProvider)
end

function AddOn:ToggleWindow()
    if self.Container and self.Container:IsShown() then self.Container:Hide()
    elseif self.Container then self.Container:Show()
    end
end

-- AddOn Compartment Functions
function ICH_AddonCompartmentOnClick(_, btn)
    if btn == "RightButton" then AddOn.Settings:ToggleWindow()
    else AddOn:ToggleWindow() end
end

function ICH_AddonCompartmentOnEnter(_, btn)
    MenuUtil.ShowTooltip(btn, function(tooltip)
        tooltip:SetText(AddOn.Title)
        tooltip:AddLine(L["Track available collectibles from instances and easily set required instance difficulty"], 1, 1, 1, true)
        tooltip:AddLine(" ")
        tooltip:AddLine(L["Click to open the AddOn window"], 1, 1, 1, true)
        tooltip:AddLine(L["Right-click to open the settings window"], 1, 1, 1, true)
        tooltip:AddLine(L["Type /ich help in the chat window for available slash commands"], 0.67, 0.67, 0.67)
    end)
end

function ICH_AddonCompartmentOnLeave(_, btn)
    MenuUtil.HideTooltip(btn)
end
