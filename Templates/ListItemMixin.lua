local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

ICHListItemMixin = {}

function ICHListItemMixin:OnLoad()
    local nContainer = self.NameContainer
    local iContainer = self.InstanceContainer
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

    -- Frame does not exist for ICHVendorListItemTemplate
    if iContainer then
        iContainer.ViewButton:HookScript("OnEnter", function()
            GameTooltip:SetOwner(iContainer.ViewButton, "ANCHOR_TOP")
            GameTooltip:SetText(iContainer.Text:GetText())
            if iContainer.encounterID ~= -1 then
                local encounterName = EJ_GetEncounterInfo(iContainer.encounterID)
                GameTooltip:AddLine(encounterName)
                GameTooltip:AddLine("\n")
            end
            GameTooltip:AddLine(L["View in encounter journal"], 1, 1, 1, true)
            GameTooltip:Show()
        end)
        iContainer.ViewButton:HookScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

    -- Frame only exists for ICHVendorListItemTemplate
    if cContainer then
        cContainer.CurrencyButton:HookScript("OnEnter", function()
            if cContainer.currencyID ~= -1 then
                GameTooltip:SetOwner(cContainer.CurrencyButton, "ANCHOR_RIGHT")
                GameTooltip:SetHyperlink("currency:"..cContainer.currencyID)
                GameTooltip:AddLine("\n")
                if C_CurrencyInfo.CanTransferCurrency(cContainer.currencyID) then
                    GameTooltip:AddLine("["..L["Click to open currency transfer menu"].."]", 0.098, 1.000, 0.098)
                else
                    GameTooltip:AddLine("["..L["Cannot transfer to this character"].."]", 1.000, 0.125, 0.125)
                end
                GameTooltip:Show()
            end
        end)
        cContainer.CurrencyButton:HookScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end

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