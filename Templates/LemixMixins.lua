---@diagnostic disable: param-type-mismatch
local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHLemixListHeaders : Frame Column headers for the list of Legion: Remix collectibles
---@field BorderBottom Texture A separator between the list headers and the list items in the AddOn interface
---@field NameHeader FontString
---@field TypeHeader FontString
---@field PhaseHeader FontString
---@field ExclusiveHeader FontString
---@field CostHeader FontString

---@class ICHLemixListItem : Frame List item that displays relevant information for a given Legion: Remix collectible
---@field isMount boolean Whether or not the list item is for a mount
---@field relevantID number The ID number for the collectible. For mounts, this value is `mountID` and for everything else it is `itemID`
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field TypeContainer TextContainer
---@field PhaseContainer PhaseContainer
---@field ExclusiveContainer ExclusiveContainer
---@field CostContainer LemixCostContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see TextContainer
---@see LemixCostContainer
---@see OtherInfoContainer

---@class ICHLemixListHeaders
ICHLemixListHeadersMixin = {}

function ICHLemixListHeadersMixin:OnLoad()
    self.NameHeader:SetText(L["Name"])
    self.TypeHeader:SetText(L["Type"])
    self.PhaseHeader:SetText("Available In")
    self.ExclusiveHeader:SetText("Event Exclusive")
    self.CostHeader:SetText(L["Cost"])
end

---@class ICHLemixListItem
ICHLemixListItemMixin = {}

function ICHLemixListItemMixin:OnLoad()
    local nContainer = self.NameContainer
    local pContainer = self.PhaseContainer
    local cContainer = self.CostContainer
    local note = self.OtherInfoContainer.ICHNote
    local waypointButton = self.OtherInfoContainer.ICHWaypointButton


    nContainer.ViewButton:HookScript("OnEnter", function()
        if self.relevantID then
            GameTooltip:SetOwner(nContainer.ViewButton, "ANCHOR_TOP")
            if self.isMount then
                local spellID = select(2, C_MountJournal.GetMountInfoByID(self.relevantID))
                GameTooltip:SetHyperlink(C_MountJournal.GetMountLink(spellID))
            else
                GameTooltip:SetHyperlink("item:"..self.relevantID)
            end
            GameTooltip:Show()
        end
    end)
    nContainer.ViewButton:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    pContainer.Text:HookScript("OnEnter", function()
        if pContainer.fullName then
            GameTooltip:SetOwner(pContainer.Text, "ANCHOR_TOP")
            local cleanName = pContainer.fullName:gsub(":%s", ":")
            local phase, phaseName = string.split(":", cleanName)
            GameTooltip:SetText(phase)
            GameTooltip:AddLine(phaseName, 1, 1, 1, true)
            GameTooltip:Show()
        end
    end)
    pContainer.Text:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    cContainer.CurrencyButton:HookScript("OnEnter", function()
        if cContainer.currencyID ~= -1 then
            GameTooltip:SetOwner(cContainer.CurrencyButton, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("currency:"..cContainer.currencyID)
            if C_CurrencyInfo.IsAccountTransferableCurrency(cContainer.currencyID) and C_CurrencyInfo.CanTransferCurrency(cContainer.currencyID) then
                GameTooltip:AddLine("\n")
                GameTooltip:AddLine("["..L["Click to open currency transfer menu"].."]", 0.098, 1.000, 0.098)
            elseif C_CurrencyInfo.IsAccountTransferableCurrency(cContainer.currencyID) then
                GameTooltip:AddLine("\n")
                GameTooltip:AddLine("["..L["Cannot transfer to this character"].."]", 1.000, 0.125, 0.125)
            end
            GameTooltip:Show()
        end
    end)
    cContainer.CurrencyButton:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    cContainer.Text:HookScript("OnEnter", function()
        if cContainer.resourceItemID ~= -1 then
            GameTooltip:SetOwner(cContainer.Text, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink("item:"..cContainer.resourceItemID)
            GameTooltip:Show()
        end
    end)
    cContainer.Text:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    note:HookScript("OnEnter", function()
        GameTooltip:SetOwner(note, "ANCHOR_NONE")
        GameTooltip:SetPoint("LEFT", note, "RIGHT", 5, 0)
        GameTooltip:AddLine(note.notes, 1, 1, 1, true)
        GameTooltip:Show()
    end)
    note:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)

    waypointButton:HookScript("OnEnter", function()
    GameTooltip:SetOwner(waypointButton, "ANCHOR_TOP")
    if waypointButton.instanceID then
        local instanceName = EJ_GetInstanceInfo(waypointButton.instanceID)
        GameTooltip:SetText(instanceName)
    elseif waypointButton.vendorName then
        GameTooltip:SetText(waypointButton.vendorName)
    end
    if waypointButton:GetNormalTexture():GetTextureFileID() > 0 then
        GameTooltip:AddLine(L["Set map pin"], 1, 1, 1)
    else
        GameTooltip:AddLine(L["Set TomTom waypoint"], 1, 1, 1)
    end
    GameTooltip:Show()
end)
waypointButton:HookScript("OnLeave", function()
    GameTooltip:Hide()
end)
end

------- ANNOTATIONS -------
---------------------------
---@class LemixCostContainer : CostContainer
---@field resourceItemID integer

---@class PhaseContainer : Frame
---@field fullName string
---@field Text FontString

---@class ExclusiveContainer: Frame
---@field Checkmark Texture
