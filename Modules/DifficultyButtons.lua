local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---Unsets all difficulty button points and hides them before showing the correct ones based on provided data
---@param container DifficultyContainer
---@see DifficultyContainer
function AddOn.HideAllDifficultyButtons(container)
    for _, button in ipairs({ container:GetChildren() }) do
        button:Hide()
    end
end

---Determines if a difficulty should share any lockouts with other difficulties
---@param difficultyID number ID associated with an instance difficulty (currently only used by raids)
---@return boolean "`true` if the instance difficulty shares a lockout with other difficulties, `false` otherwise"
local function IsDifficultyIDShareable(difficultyID)
    return difficultyID == AddOn.RaidDifficulty.Legacy10
        or difficultyID == AddOn.RaidDifficulty.Legacy10H
        or difficultyID == AddOn.RaidDifficulty.Legacy25
        or difficultyID == AddOn.RaidDifficulty.Legacy25H
        or false
end

---Determines which difficulty button(s) to display based on the provided data
---@param container DifficultyContainer
---@param data Mount|Toy|Pet|HousingItem
---@param isOwned boolean? Whether or not the collectible is owned by the player. Omitting this argument is equivalent to providing `false`
---@see DifficultyContainer
---@see Mount
---@see Toy
---@see Pet
---@see HousingItem
function AddOn:ShowDifficultyButtons(container, data, isOwned)
    if not data.DifficultyIDs then return end
    
    for i, diffID in ipairs(data.DifficultyIDs) do
        ---@type DifficultyButton
        local button
        if self:IsInstanceRaid(data) then
            if diffID == self.RaidDifficulty.LFR then button = container.RaidDiffLFRButton
            elseif diffID == self.RaidDifficulty.LegacyLFR then button = container.RaidDiffLegacyLFRButton
            elseif diffID == self.RaidDifficulty.Legacy40 then button = container.RaidDiff40Button
            elseif diffID == self.RaidDifficulty.Legacy10 then button = container.RaidDiff10Button
            elseif diffID == self.RaidDifficulty.Legacy10H then button = container.RaidDiff10HeroicButton
            elseif diffID == self.RaidDifficulty.Legacy25 then button = container.RaidDiff25Button
            elseif diffID == self.RaidDifficulty.Legacy25H then button = container.RaidDiff25HeroicButton
            elseif diffID == self.RaidDifficulty.Normal then button = container.RaidDiffNormalButton
            elseif diffID == self.RaidDifficulty.Heroic then button = container.RaidDiffHeroicButton
            elseif diffID == self.RaidDifficulty.Mythic then button = container.RaidDiffMythicButton
            end
            if data.SharedDifficulties and IsDifficultyIDShareable(button.difficultyID) then
                button.sharedDifficulties = data.SharedDifficulties
            end
        else
            if diffID == self.DungeonDifficulty.Normal then button = container.DungDiffNormalButton
            elseif diffID == self.DungeonDifficulty.Heroic then button = container.DungDiffHeroicButton
            elseif diffID == self.DungeonDifficulty.Mythic then button = container.DungDiffMythicButton
            end
        end

        if button then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", container, "TOPLEFT", i == 1 and 0 or ((50 * (i - 1)) + 2), -2.5)
            button:SetPoint("BOTTOMLEFT", container, "BOTTOMLEFT", i == 1 and 0 or ((50 * (i - 1)) + 2), 2.5)
            button:SetText(self:GetDifficultyButtonText(button.difficultyID))
            button:GetFontString():SetTextColor(1, 1, 1, 1)
            button:GetFontString():SetDrawLayer("OVERLAY")
            button:Enable()
            button.ButtonTint:Show()
            if isOwned or self.IsEncounterCompleted(data, diffID) or (data.SharedDifficulties and self:IsEncounterCompletedOnSharedDifficulty(data)) then
                -- If an encounter has already been completed in the current reset period, disable the button and don't show a tinted overlay
                -- For legacy raids that share a single lockout for all difficulties, check if the encounter has been completed on any shared difficulties as well
                button:Disable()
                if button.ButtonTint:IsShown() then button.ButtonTint:Hide() end
            else
                -- Tint dungeon buttons blue and raids green
                if self:IsInstanceRaid(data) then button.ButtonTint:SetVertexColor(0.082, 0.702, 0, 0.75)
                else button.ButtonTint:SetVertexColor(0, 0.569, 0.949, 0.75) end
                -- Mask ButtonTint with the same texture as the button background
                -- TODO: Figure out how to translate the TintMask into XML
                if not button.TintMask then
                    button.TintMask = button:CreateMaskTexture()
                    button.TintMask:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
                    button.ButtonTint:AddMaskTexture(button.TintMask)
                end
                button.TintMask:ClearAllPoints()
                button.TintMask:SetPoint("TOPLEFT", button.ButtonTint, "TOPLEFT", 3, -3)
                button.TintMask:SetPoint("BOTTOMRIGHT", button.ButtonTint, "TOPLEFT", 73, -24)
            end
            button:Show()
        end
    end
end