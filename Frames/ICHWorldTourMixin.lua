local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHWorldTour
ICHWorldTourMixin = {}

function ICHWorldTourMixin:OnLoad()
    -- Allows closing via ESC key
    tinsert(UISpecialFrames, self:GetName())

    self.Title:SetText("ICH "..L["World Tour"].." (BETA)")

    self.HelpText:SetPoint("LEFT", self, 10, 0)
    self.HelpText:SetPoint("RIGHT", self, -10, 0)
    self.HelpText:SetPoint("TOP", self.TypeFilterRow, "BOTTOM", 0, -15)

    -- self.PrevButton:SetText(L["Prev"])
    self.PrevButton:HookScript("OnClick", function() AddOn.WorldTour:Prev() end)

    -- self.NextButton:SetText(L["Next"])
    self.NextButton:HookScript("OnClick", function() AddOn.WorldTour:Next() end)

    self.StartStopButton:HookScript("OnClick", function()
        if AddOn.db.global.worldTour.active then AddOn.WorldTour:Stop()
        else AddOn.WorldTour:Start() end
    end)

    -- self.ResetButton:SetText(L["Reset"])
    self.ResetButton:HookScript("OnClick", function() AddOn.WorldTour:Reset() end)

    local function onTypeCheckboxClick(type, checkbox)
        AddOn.db.global.worldTour.scope.types[type] = checkbox:GetChecked() and true or false
        AddOn.WorldTour:Reset()
    end

    local function initTypeCheckbox(checkbox, label, type)
        checkbox.Text:SetText(label)
        checkbox.Text:SetFontObject("GameTooltipText")
        checkbox.rightPadding = checkbox.Text:GetStringWidth() + 20
        checkbox:HookScript("OnClick", function(cb) onTypeCheckboxClick(type, cb) end)
    end

    initTypeCheckbox(self.TypeFilterRow.MountCheckbox, L["Mount"], "Mount")
    initTypeCheckbox(self.TypeFilterRow.PetCheckbox, L["Pet"], "Pet")
    initTypeCheckbox(self.TypeFilterRow.ToyCheckbox, L["Toy"], "Toy")
    initTypeCheckbox(self.TypeFilterRow.DecorCheckbox, L["Decor"], "Decor")

    ---@param tooltip GameTooltip
    local function appendHelperData(tooltip)
        if tooltip.__worldTourData and tooltip == GameTooltip then
            AddOn:PrintDebugMessage("Adding ICH data to World Tour tooltip")
            ---@cast tooltip.__worldTourData ICHHelperItem
            
            if tooltip.__worldTourData.EncounterID or tooltip.__worldTourData.Notes then tooltip:AddLine(" ") end
            if tooltip.__worldTourData.EncounterID then
                local encounterName = EJ_GetEncounterInfo(tooltip.__worldTourData.EncounterID)
                if encounterName then
                    tooltip:AddLine(BOSS..": "..WHITE_FONT_COLOR:WrapTextInColorCode(encounterName))
                end
            end
            if tooltip.__worldTourData.Difficulties then
                tooltip:AddLine("Difficulties: "..WHITE_FONT_COLOR:WrapTextInColorCode(tooltip.__worldTourData.Difficulties))
            end
            if tooltip.__worldTourData.Notes then
                tooltip:AddLine(tooltip.__worldTourData.Notes, 1, 1, 1, true)
            end
            tooltip:Show()
        end
    end

    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Spell, appendHelperData)
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, appendHelperData)
end

function ICHWorldTourMixin:OnShow()
    self:RefreshContents()
end

function ICHWorldTourMixin:OnDragStart()
    self:StartMoving()
end

function ICHWorldTourMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHWorldTourMixin:ClearItemContainer()
    for _, child in ipairs({ self.ItemContainer:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
end

function ICHWorldTourMixin:Toggle()
    if self:IsShown() then
        self:Hide()
        return
    end

    if not AddOn.db.global.worldTour.currentStep then
        AddOn.db.global.worldTour.currentStep = 1
    end
    self:Show()
end

---@param container HorizontalLayoutFrame
---@param items ICHHelperItem[]
---@param iconSize number
local function renderCollectibles(container, items, iconSize)
    for _, item in ipairs(items) do
        local col = CreateFrame("Button", nil, container)
        col:SetSize(iconSize, iconSize)
        col:SetNormalTexture(item.IconID)
        col:SetHighlightTexture(item.IconID)

        col:SetScript("OnEnter", function()
            GameTooltip.__worldTourData = item
            GameTooltip:SetOwner(col, "ANCHOR_BOTTOMLEFT")
            GameTooltip:SetHyperlink(item.Hyperlink)
        end)
        col:SetScript("OnLeave", function()
            GameTooltip.__worldTourData = nil
            GameTooltip:Hide()
        end)
        col.layoutIndex = container:GetNumChildren()
    end

    container:SetSize(math.max(iconSize * 8, #items * iconSize), iconSize)
    container:Layout()
end

function ICHWorldTourMixin:RefreshContents()
    self.ResetButton:SetShown(not AddOn.db.global.worldTour.active)

    local scopeTypes = AddOn.db.global.worldTour.scope.types
    local checkboxesEnabled = not AddOn.db.global.worldTour.active
    self.TypeFilterRow.MountCheckbox:SetChecked(scopeTypes.Mount)
    self.TypeFilterRow.MountCheckbox:SetEnabled(checkboxesEnabled)
    self.TypeFilterRow.PetCheckbox:SetChecked(scopeTypes.Pet)
    self.TypeFilterRow.PetCheckbox:SetEnabled(checkboxesEnabled)
    self.TypeFilterRow.ToyCheckbox:SetChecked(scopeTypes.Toy)
    self.TypeFilterRow.ToyCheckbox:SetEnabled(checkboxesEnabled)
    self.TypeFilterRow.DecorCheckbox:SetChecked(scopeTypes.Decor)
    self.TypeFilterRow.DecorCheckbox:SetEnabled(checkboxesEnabled)

    self:ClearItemContainer()

    local step = AddOn.WorldTour:GetCurrentStep()
    if not step then
        self.InstanceNameText:SetText(L["No world tour stop selected"])
        self.HelpText:SetText("")
        self.ProgressText:SetText("")
        self.StartStopButton:SetText(L["Start"])
        self.PrevButton:SetEnabled(false)
        self.NextButton:SetEnabled(false)
        return
    end

    if not step.InstanceID then
        self.InstanceNameText:SetText("")
    elseif scopeTypes.Mount or scopeTypes.Pet or scopeTypes.Toy or scopeTypes.Decor then
        self.InstanceNameText:SetText(EJ_GetInstanceInfo(step.InstanceID) or "")
    else
        self.InstanceNameText:SetText(L["Select at least one collectible type to continue the tour"])
    end
    self.HelpText:SetText(step.HelpText or "")
    local displayIndex, displayTotal = AddOn.WorldTour:GetProgress()
    self.ProgressText:SetText(displayIndex.." / "..displayTotal)
    self.StartStopButton:SetText(AddOn.db.global.worldTour.active and L["Stop"] or L["Start"])
    self.PrevButton:SetEnabled(true)
    self.NextButton:SetEnabled(true)

    local collectibles = {}
    if step.InstanceID then
        for _, entry in ipairs(AddOn.WorldTour:GetInScopeCollectiblesForInstance(step.InstanceID)) do
            if not entry.Owned and entry.CanBeLooted then
                tinsert(collectibles, entry)
            end
        end
    end
    renderCollectibles(self.ItemContainer, collectibles, 35)
end
