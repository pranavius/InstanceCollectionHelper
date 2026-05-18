local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---Initializes how mount data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data Mount
---@see ICHListItem
---@see Mount
function AddOn.MountDataProviderInit(frame, data)
    AddOn.InstanceListItemInit(frame, data, {
        isMount = true,
        getInfo = function(d)
            local mountName, spellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(d.ID)
            local spellInfo = C_Spell.GetSpellInfo(spellID)
            local icon = spellInfo and spellInfo.originalIconID
            return mountName or d.Name, icon, isOwned, d.ID
        end,
        onNameClick = function(_, d)
            if not d.ID then return end
            local spellID = select(2, C_MountJournal.GetMountInfoByID(d.ID))
            SetCollectionsJournalShown(true, 1)
            MountJournal_SetSelected(d.ID, spellID)
        end
    })
end
