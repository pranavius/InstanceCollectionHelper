local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---Initializes how mount data in the scrollable list should be displayed
---@param frame ICHListItem
---@param data Mount
function AddOn.MountDataProviderInit(frame, data)
    AddOn.InstanceListItemInit(frame, data, {
        isMount = true,
        getInfo = function(d)
            ---@cast d Mount
            local mountName, spellID, _, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(d.ID)
            local spellInfo = C_Spell.GetSpellInfo(spellID)
            local icon = spellInfo and spellInfo.originalIconID
            return mountName or d.Name, icon, isOwned, d.ID
        end,
        onNameClick = function(_, d)
            ---@cast d Mount
            if not d.ID then return end
            DressUpMount(d.ID)
        end
    })
end
