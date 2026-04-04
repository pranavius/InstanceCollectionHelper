local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class ICHInstanceHelper
ICHInstanceHelperMixin = {}

function ICHInstanceHelperMixin:OnLoad()
    print("Instance Helper Loaded")
    self:RegisterEvent("PLAYER_ENTERING_WORLD")
end

function ICHInstanceHelperMixin:OnEvent()
    local isInInstance, instanceType = IsInInstance()
    if isInInstance and (instanceType == "party" or instanceType == "raid") then
        print("IsInInstance:", IsInInstance())
        local instanceName, _, _, _, _, _, _, instanceMapID = GetInstanceInfo()
        local helperItems = self.GetInstanceCollectibles(instanceMapID)
        self.InstanceName:SetText(instanceName.." ("..AddOn:GetInstanceDifficultyText(GetDungeonDifficultyID())..")")
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
    elseif self:IsShown() then
        self:Hide()
    end
end

function ICHInstanceHelperMixin:OnDragStart()
    self:StartMoving()
end

function ICHInstanceHelperMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function ICHInstanceHelperMixin:OnHide()
    self.InstanceName:SetText("")
    for _, child in ipairs({ self.ItemContainer:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
end

function ICHInstanceHelperMixin.GetInstanceCollectibles(instanceMapID)
    ---@type ICHHelperItem[]
    local helperItems = {}
    for _, mount in ipairs(AddOn.Mounts) do
        if mount.MapID == instanceMapID then
            local _, spellID, iconID = C_MountJournal.GetMountInfoByID(mount.ID)
            table.insert(helperItems, { IsMount = true, IconID = iconID or 134400, Hyperlink = C_MountJournal.GetMountLink(spellID) })
        end
    end
    for _, toy in ipairs(AddOn.Toys) do
        if toy.MapID == instanceMapID then
            table.insert(helperItems, { IsMount = false, IconID = AddOn.ToyCache[toy.ItemID].iconID, Hyperlink = "item:"..toy.ItemID })
        end
    end
    for _, pet in ipairs(AddOn.Pets) do
        if pet.MapID == instanceMapID then
            table.insert(helperItems, { IsMount = false, IconID = AddOn.PetCache[pet.PetItemID].iconID, Hyperlink = "item:"..pet.PetItemID })
        end
    end
    for _, decor in ipairs(AddOn.DecorItems) do
        if decor.MapID == instanceMapID then
            local iconID = select(5, C_Item.GetItemInfoInstant(decor.DecorItemID))
            table.insert(helperItems, { IsMount = false, IconID = iconID or 134400, Hyperlink = "item:"..decor.DecorItemID })
        end
    end
    DevTools_Dump(helperItems)
    return helperItems
end