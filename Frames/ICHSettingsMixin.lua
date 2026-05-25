local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHSettings
ICHSettingsMixin = {}

function ICHSettingsMixin:OnLoad()
    tinsert(UISpecialFrames, self:GetName())

    self.Title:SetText(L["Instance Collection Helper"].." "..L["Settings"])

    self.MinimapCheckbox.Text:SetText(L["Show minimap icon"])
    self.MinimapCheckbox:SetScript("OnClick", function(cb)
        local hide = not cb:GetChecked()
        AddOn.db.global.minimap.hide = hide
        if hide then AddOn.Icon:Hide(name)
        else AddOn.Icon:Show(name)
        end
    end)

    self.MiniWindowCheckbox.Text:SetText(L["Show mini-window in instances"])
    self.MiniWindowCheckbox:SetScript("OnClick", function(cb)
        AddOn.db.global.showMiniWindow = cb:GetChecked()
        self.MiniWindowInMythicPlusCheckbox:SetEnabled(cb:GetChecked())
        if ICHInstanceHelper then ICHInstanceHelper:UpdateHelperWindow() end
    end)

    self.MiniWindowInMythicPlusCheckbox.Text:SetText(L["Show mini-window during Mythic+ dungeons"])
    self.MiniWindowInMythicPlusCheckbox:SetScript("OnClick", function(cb)
        AddOn.db.global.showMiniWindowInMythicPlus = cb:GetChecked()
        if ICHInstanceHelper then ICHInstanceHelper:UpdateHelperWindow() end
    end)

    self.PetOwnedCheckbox.Text:SetText(L["Mark pets owned only when you own max amount available"])
    self.PetOwnedCheckbox:SetScript("OnClick", function(cb)
        AddOn.db.global.countPetOwnedOnlyIfMaxOwned = cb:GetChecked()
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)

    self.FavoritesLabel:SetText(L["Favorites"])
    self.FavoritesLabel:SetPoint("TOPLEFT", self.PetOwnedCheckbox, "BOTTOMLEFT", 0, -15)

    local BASE_X_OFFSET = 15
    local BASE_Y_OFFSET = 10
    local ROW_HEIGHT = 20

    ---@class SettingsFavoriteRow
    ---@field name string
    ---@field categories string[]

    ---@type SettingsFavoriteRow[]
    local faveRows = {
        { name = L["Mounts"], categories = { "Mount" } },
        { name = L["Toys"], categories = { "Toy" } },
        { name = L["Pets"], categories = { "Pet" } },
        { name = L["Decor"], categories = { "Decor" } },
        { name = L["Timewalking Vendor"], categories = { "TimewalkingMount", "TimewalkingPet", "TimewalkingToy" } },
    }

    ---@type { button: Button, categories: string[] }[]
    self.tabClearButtons = {}
    local currentAnchor = self.FavoritesLabel

    for idx, row in ipairs(faveRows) do
        local xOffset = idx == 1 and BASE_X_OFFSET or 0
        local yOffset = idx == 1 and 8 or BASE_Y_OFFSET

        local clearBtn = CreateFrame("Button", nil, self, "InsecureActionButtonTemplate")
        clearBtn:SetSize(ROW_HEIGHT, ROW_HEIGHT)
        clearBtn:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT", xOffset, -yOffset)
        clearBtn:SetScript("OnEnter", function()
            GameTooltip:SetOwner(clearBtn, "ANCHOR_LEFT")
            GameTooltip:SetText(L["Clear"])
            GameTooltip:Show()
        end)
        clearBtn:SetScript("OnLeave", function() GameTooltip:Hide() end)
        clearBtn:SetNormalAtlas("lootroll-toast-icon-pass-up")
        clearBtn:SetHighlightAtlas("lootroll-toast-icon-pass-highlight")
        clearBtn:SetScript("OnClick", function()
            local favs = AddOn.db.global.favorites
            for _, key in ipairs(row.categories) do
                wipe(favs[key])
            end
            EventRegistry:TriggerEvent("ICHEvent.UpdateSettingsPanel")
            EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
        end)
        table.insert(self.tabClearButtons, { button = clearBtn, categories = row.categories })

        local tabLabel = self:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        tabLabel:SetPoint("LEFT", clearBtn, "RIGHT", 5, 0)
        tabLabel:SetText(row.name)

        currentAnchor = clearBtn
    end

    local clearAllPadding = 20
    self.ClearAllFavoritesButton = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
    self.ClearAllFavoritesButton:SetText(L["Clear All Favorites"])
    self.ClearAllFavoritesButton:SetHeight(self.ClearAllFavoritesButton.Text:GetHeight() + 20)
    self.ClearAllFavoritesButton:SetWidth(self.ClearAllFavoritesButton.Text:GetUnboundedStringWidth() + 20)
    self.ClearAllFavoritesButton:SetPoint("TOPLEFT", currentAnchor, "BOTTOMLEFT",
        (self:GetWidth() - self.ClearAllFavoritesButton:GetWidth()) / 2 - BASE_X_OFFSET, -BASE_Y_OFFSET)
    self.ClearAllFavoritesButton:SetScript("OnClick", function()
        local favs = AddOn.db.global.favorites
        for category in pairs(favs) do
            wipe(favs[category])
        end
        EventRegistry:TriggerEvent("ICHEvent.UpdateSettingsPanel")
        EventRegistry:TriggerEvent("ICHEvent.UpdateListContents")
    end)

    AddOn.Settings = self
end

function ICHSettingsMixin:OnShow()
    self.MinimapCheckbox:SetChecked(not AddOn.db.global.minimap.hide)
    self.MiniWindowCheckbox:SetChecked(AddOn.db.global.showMiniWindow)
    self.MiniWindowInMythicPlusCheckbox:SetEnabled(AddOn.db.global.showMiniWindow)
    self.MiniWindowInMythicPlusCheckbox:SetChecked(AddOn.db.global.showMiniWindowInMythicPlus)
    self.PetOwnedCheckbox:SetChecked(AddOn.db.global.countPetOwnedOnlyIfMaxOwned)
    self:RefreshFavoriteButtons()
end

function ICHSettingsMixin:OnDragStart()
    self:StartMoving()
end

function ICHSettingsMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHSettingsMixin:ToggleWindow()
    if self:IsShown() then self:Hide() else self:Show() end
end

function ICHSettingsMixin:RefreshFavoriteButtons()
    if not self:IsShown() then return end

    local function hasFavorites(keys)
        for _, key in ipairs(keys) do
            if next(AddOn.db.global.favorites[key]) then return true end
        end
        return false
    end

    local anyFavorites = false
    for _, entry in ipairs(self.tabClearButtons) do
        if hasFavorites(entry.categories) then
            entry.button:GetNormalTexture():SetDesaturated(false)
            entry.button:GetHighlightTexture():SetDesaturated(false)
            entry.button:Enable()
            anyFavorites = true
        else
            entry.button:GetNormalTexture():SetDesaturated(true)
            entry.button:GetHighlightTexture():SetDesaturated(true)
            entry.button:Disable()
        end
    end

    if anyFavorites then
        self.ClearAllFavoritesButton:Enable()
    else
        self.ClearAllFavoritesButton:Disable()
    end
end
