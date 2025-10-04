local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHListItem: Frame List item that displays relevant information for a given collectible
---@field isMount boolean Whether or not the list item is for a mount
---@field relevantID number The ID number for the collectible. For mounts, this value is `mountID` and for toys it is `itemID`
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field InstanceContainer? InstanceContainer Exclusive to `ICHListItemTemplate`
---@field DifficultyContainer? DifficultyContainer Exclusive to `ICHListItemTemplate`
---@field TypeContainer? TextContainer Exclusive to `ICHVendorListItemTemplate`
---@field ExpansionContainer? TextContainer Exclusive to `ICHVendorListItemTemplate`
---@field CostContainer? CostContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see InstanceContainer 
---@see DifficultyContainer
---@see TextContainer
---@see CostContainer
---@see OtherInfoContainer

---@class ICHListItem
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

------- ANNOTATIONS -------
---------------------------
---@class NameContainer: Frame Displays elements relevant to a collectible's name<br>
---For frame definition and more layout information, see `Templates/ListItemTemplate.xml`
---@field ViewButton Button Button to view the collectible in the appropriate collection journal in-game
---@field Text FontString Name of a collectible (can be truncated if length exceeds allocated space)

---@class InstanceContainer: Frame Displays elements relevant to the instance where a collectible can be obtained<br>
---For frame definition and more layout information, see `Templates/ListItemTemplate.xml`
---@field encounterID? number ID number for the encounter that provides the collectible
---@field Text FontString Name of an instance
---@field ViewButton Button Button to view the instance in the encounter journal in-game

---@class TextContainer: Frame Generic frame that displays text relevant to a collectible<br>
---For instances of use, see `TypeContainer` and `ExpansionContainer` (part of `ICHVendorListItemTemplate`) in `Templates/ListItemTemplate.xml`
---@field Text FontString The text to be displayed

---@class CostContainer: Frame Displays elements relevant to a collectible's cost<br>
---For frame definition and more layout information, see `ICHVendorListItemTemplate` in `Templates/ListItemTemplate.xml`
---@field currencyID integer ID number of the currency required to purchase the collectible
---@field Text FontString Text to display alongside the currency icon (typically the cost of the collectible)
---@field CurrencyButton Button If currency is Warband Transferable, this button should open the transfer menu

---@class DifficultyContainer: Frame Displays elements relevant to the instance difficulty for a collectible<br>
---For frame definition and more layout information, see `ICHListItemTemplate` in `Templates/ListItemTemplate.xml`
---@field RaidDiffLFRButton DifficultyButton Button for tracking LFR lockout (no action taken when clicked)
---@field RaidDiffLegacyLFRButton DifficultyButton Button for tracking legacy LFR lockout (no action taken when clicked)
---@field RaidDiff40Button DifficultyButton Button for setting Legacy Raid difficulty to 40 player
---@field RaidDiff10Button DifficultyButton Button for setting Legacy Raid difficulty to 10 player
---@field RaidDiff10HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 10 player (Heroic)
---@field RaidDiff25Button DifficultyButton Button for setting Legacy Raid difficulty to 25 player
---@field RaidDiff25HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 25 player (Heroic)
---@field RaidDiffNormalButton DifficultyButton Button for setting Raid difficulty to Normal
---@field RaidDiffHeroicButton DifficultyButton Button for setting Raid difficulty to Heroic
---@field RaidDiffMythicButton DifficultyButton Button for setting Raid difficulty to Mythic
---@field DungDiffNormalButton DifficultyButton Button for setting Dungeon difficulty to Normal
---@field DungDiffHeroicButton DifficultyButton Button for setting Dungeon difficulty to Heroic
---@field DungDiffMythicButton DifficultyButton Button for setting Dungeon difficulty to Mythic

---@class ICHNote: Frame Handles displaying notes about a mount or instance in a tooltip when hovered
---@field notes string The note(s) to display when hovering over the texture in `ICHNote`

---@class ICHWaypointButton: Button Creates a map pin or TomTom waypoint to the corresponding instance entrance based on user's preferences
---@field instanceID? number ID number for the instance where the collectible can be obtained
---@field vendorName? string Name of the vendor from whom the collectible can be purcahsed (for vendor items only)

---@class OtherInfoContainer: Frame Displays other elements associated with a collectible
---@field ICHPetCount FontString Displays the total number of a pet owned against the maximum number that can be owned (for pets only)
---@field ICHNote ICHNote
---@field ICHWaypointButton ICHWaypointButton