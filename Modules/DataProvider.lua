local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@class NameContainerFrame
---@field Text FontString Name of an item
---@field ViewButton Button Button to view the item in the appropriate collection journal in-game

---@class ICHListItem: Frame
---@field Bg Frame The background texture for the list item
---@field NameContainer NameContainerFrame
---@field Instance FontString Instance where an item can be obtained

---Initializes how data in the scrollable list should be displayed.
---@param frame ICHListItem See `Templates.xml` for "ICHListItemTemplate"
---@param data InstanceMount The data to process and display in a list item.
function AddOn.DataProviderInit(frame, data)
    local index = AddOn.ICHDataProvider:FindIndex(data)
    if index % 2 == 0 then frame.Bg:Show() elseif frame.Bg:IsShown() then frame.Bg:Hide() end
    frame.NameContainer.Text:SetText(data.Name)
    frame.Instance:SetText(data.Instance)

    frame.NameContainer.ViewButton:SetScript("OnClick", function()
        local IsAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded
        if not IsAddOnLoaded("Blizzard_Collections") then
            LoadAddOn("Blizzard_Collections")
        end
        -- Currently only supports Mounts, but additional conditions could be added for showing things like Battle Pets and Achievements
        if data.MountID then
            SetCollectionsJournalShown(true, 1)
            local spellID = select(2, C_MountJournal.GetMountInfoByID(data.MountID))
            MountJournal_SetSelected(data.MountID, spellID)
        end
    end)
end