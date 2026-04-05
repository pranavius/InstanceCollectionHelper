local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHInstanceHelper
ICHInstanceHelperMixin = {}

function ICHInstanceHelperMixin:OnLoad()
    self:RegisterEvent("UPDATE_INSTANCE_INFO")
end

local function isInstanceInfoValid(instanceName, difficultyID, difficultyName, instanceMapID)
    return instanceName ~= nil
        and instanceName ~= ""
        and difficultyID ~= nil
        and difficultyID ~= 0
        and difficultyName ~= nil
        and difficultyName ~= ""
        and instanceMapID ~= nil
        and instanceMapID ~= 0
end

-- All added info is wiped after coming back from Narcissus AFK screen (need to fix)
function ICHInstanceHelperMixin:UpdateHelperWindow()
    local isInInstance, instanceType = IsInInstance()
    -- Require both caches to be loaded before showing the window to avoid showing incomplete data
    local areNecessaryCachesLoaded = AddOn.ToyCacheReady and AddOn.PetCacheReady
    if AddOn.db.global.showInstanceHelperWindow and not self:IsShown() and areNecessaryCachesLoaded and isInInstance and (instanceType == "party" or instanceType == "raid") then
        AddOn:PrintDebugMessage("Showing Instance Helper window")
        local instanceName, difficultyID, difficultyName, instanceMapID
        -- Iterate until we receive valid instance info
        -- Values sometimes need multiple triggers of UPDATE_INSTANCE_INFO to populate
        while not isInstanceInfoValid(instanceName, difficultyID, difficultyName, instanceMapID) do
            instanceName, _, difficultyID, difficultyName, _, _, _, instanceMapID = GetInstanceInfo()
        end
        local helperItems = self.GetInstanceCollectibles(instanceMapID, difficultyID)
        self.InstanceName:SetText(instanceName.." ("..AddOn:GetInstanceDifficultyText(difficultyID)..")")

        for _, item in ipairs(helperItems) do
            local col = CreateFrame("Button", nil, self.ItemContainer, "InsecureActionButtonTemplate")
            col:SetSize(40, 40)
            col:SetNormalTexture(item.IconID)
            col:SetHighlightTexture(item.IconID)
            col:SetScript("OnEnter", function()
                GameTooltip:SetOwner(col, "ANCHOR_BOTTOMLEFT")
                GameTooltip:SetHyperlink(item.Hyperlink)
                GameTooltip:Show()
            end)
            col:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
            col.layoutIndex = self.ItemContainer:GetNumChildren()
        end

        self:Layout()
        self:Show()
    elseif not AddOn.db.global.showInstanceHelperWindow or (self:IsShown() and not isInInstance) then
        AddOn:PrintDebugMessage("Hiding Instance Helper window")
        self:Hide()
    end
end

function ICHInstanceHelperMixin:ClearHelperWindow()
    self.InstanceName:SetText("")
    for _, child in ipairs({ self.ItemContainer:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
end

-- Expected events: UPDATE_INSTANCE_INFO
function ICHInstanceHelperMixin:OnEvent()
    self:UpdateHelperWindow()
end

function ICHInstanceHelperMixin:OnDragStart()
    self:StartMoving()
end

function ICHInstanceHelperMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHInstanceHelperMixin:OnHide()
    self:ClearHelperWindow()
end

function ICHInstanceHelperMixin.GetInstanceCollectibles(instanceMapID, difficultyID)
    ---@type ICHHelperItem[]
    local helperItems = {}
    for _, mount in ipairs(AddOn.Mounts) do
        if mount.MapID == instanceMapID then
            local _, spellID, iconID, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(mount.ID)
            local isCollectable = not (isOwned or AddOn.IsEncounterCompleted(mount, difficultyID) or (mount.SharedDifficulties and AddOn:IsEncounterCompletedOnSharedDifficulty(mount)))
            if isCollectable then
                table.insert(helperItems, { IsMount = true, IconID = iconID or 134400, Hyperlink = C_MountJournal.GetMountLink(spellID) })
            end
        end
    end
    for _, toy in ipairs(AddOn.Toys) do
        if toy.MapID == instanceMapID then
            local isOwned = PlayerHasToy(toy.ItemID)
            local isCollectable = not (isOwned or AddOn.IsEncounterCompleted(toy, difficultyID) or (toy.SharedDifficulties and AddOn:IsEncounterCompletedOnSharedDifficulty(toy)))
            if isCollectable then
                table.insert(helperItems, { IsMount = false, IconID = AddOn.ToyCache[toy.ItemID].iconID, Hyperlink = "item:"..toy.ItemID })
            end
        end
    end
    for _, pet in ipairs(AddOn.Pets) do
        if pet.MapID == instanceMapID then
            local isOwned = AddOn.GetPetOwnedAndLimitCount(AddOn.PetCache[pet.PetItemID].speciesID) > 0
            local isCollectable = not (isOwned or AddOn.IsEncounterCompleted(pet, difficultyID) or (pet.SharedDifficulties and AddOn:IsEncounterCompletedOnSharedDifficulty(pet)))
            if isCollectable then
                table.insert(helperItems, { IsMount = false, IconID = AddOn.PetCache[pet.PetItemID].iconID, Hyperlink = "item:"..pet.PetItemID })
            end
        end
    end
    for _, decorItem in ipairs(AddOn.DecorItems) do
        if decorItem.MapID == instanceMapID then
            local decor = C_HousingCatalog.GetCatalogEntryInfoByItem(decorItem.DecorItemID, true)
            local isOwned = decor.quantity and decor.numPlaced and (decor.quantity + decor.numPlaced > 0) or false
            local isCollectable = not (isOwned or AddOn.IsEncounterCompleted(decorItem, difficultyID) or (decorItem.SharedDifficulties and AddOn:IsEncounterCompletedOnSharedDifficulty(decorItem)))
            if isCollectable then
                local iconID = select(5, C_Item.GetItemInfoInstant(decorItem.DecorItemID))
                table.insert(helperItems, { IsMount = false, IconID = iconID or 134400, Hyperlink = "item:"..decorItem.DecorItemID })
            end
        end
    end
    AddOn:PrintDebugMessage("Found "..#helperItems.." collectibles for current instance")
    return helperItems
end