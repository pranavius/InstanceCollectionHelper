local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local LemixPhases = AddOn.LemixPhases

---@class WowRemixResource
---@field ItemID integer
---@field Amount integer

---@class WowRemixItem
---@field Name string
---@field ItemID integer
---@field Type "Mount"|"Pet"|"Toy"|"Cosmetic"
---@field Instance? string
---@field InstanceID? integer
---@field EncounterID? integer
---@field VendorName string
---@field Cost integer
---@field Phase? LemixPhase
---@field AdditionalResource? WowRemixResource
---@field AreaPoiID? integer
---@field Notes? string
---@field SearchTags string[]
---@field IsLemixExclusive boolean

---@type WowRemixItem[]
AddOn.LemixItems = {
    {
        Name = "Abyss Worm",
        ItemID = 143643,
        Type = "Mount",
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        EncounterID = 1861,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Acid Belcher",
        ItemID = 152904,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Albino Mana Ray",
        ItemID = 250747,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Antoran Charhound",
        ItemID = 152816,
        Type = "Mount",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 1987,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Aquamarine Basilisk",
        ItemID = 250426,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Arcadian War Turtle",
        ItemID = 141713,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Arcberry Manasaber",
        ItemID = 250728,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Archmage's Felscorned Disc",
        ItemID = 253026,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61089)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Mage")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Ashplague Fel Bat",
        ItemID = 239667,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Avenging Felcrusher",
        ItemID = 153044,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Biletooth Gnasher",
        ItemID = 125903,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Bloodhunter Fel Bat",
        ItemID = 239665,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Bloodtooth Mana Ray",
        ItemID = 250746,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Blessed Felcrusher",
        ItemID = 153043,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Bonesteed of Bloodshed",
        ItemID = 250760,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Bonesteed of Triumph",
        ItemID = 250761,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Bonesteed of Oblivion",
        ItemID = 250758,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Bonesteed of Plague",
        ItemID = 250759,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Brimstone Courser",
        ItemID = 251795,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Chestnut Courser",
        ItemID = 251796,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Cloudwing Hippogryph",
        ItemID = 147806,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Crimson Slavermaw",
        ItemID = 152905,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Darkspore Mana Ray",
        ItemID = 152843,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Farseer's Felscorned Tempest",
        ItemID = 253031,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42686)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Shaman")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Fathom Dweller",
        ItemID = 138201,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Felblaze Infernal",
        ItemID = 142236,
        Type = "Mount",
        Instance = "The Nighthold",
        InstanceID = 786,
        EncounterID = 1737,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Felglow Mana Ray",
        ItemID = 152841,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Felscorned Grandmaster's Companion",
        ItemID = 253027,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61085)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Monk")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Highlord's Charger",
        ItemID = 253028,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42504)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Paladin")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Netherlord's Dreadsteed",
        ItemID = 253032,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61090)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Warlock")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Vilebrood Vanquisher",
        ItemID = 252954,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42685)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Death Knight")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned War Wyrm",
        ItemID = 253033,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42684)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Warrior")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Wolfhawk",
        ItemID = 253025,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42687)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Hunter")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felslate Basilisk",
        ItemID = 250425,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Fel-Scarred Mana Ray",
        ItemID = 250745,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Garnet Ruinstrider",
        ItemID = 250803,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Ghastly Ur'zul",
        ItemID = 250192,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Gloomdark Nightmare",
        ItemID = 250757,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Glorious Felcrusher",
        ItemID = 153042,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Golden Sunrunner",
        ItemID = 250752,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Hammer of Vigilance",
        ItemID = 242368,
        Type = "Cosmetic",
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        EncounterID = 1897,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResource = { ItemID = 253305, Amount = 20 },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253305)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Felwarped Slab]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1897)) or "Maiden of Vigilance")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Helfire Infernal",
        ItemID = 137575,
        Type = "Mount",
        Instance = "The Nighthold",
        InstanceID = 786,
        EncounterID = 1737,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "High Priest's Felscorned Seeker",
        ItemID = 253029,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61088)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Priest")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Highland Elderhorn",
        ItemID = 250429,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Highmountain Elderhorn",
        ItemID = 147807,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Illidari Blightstalker",
        ItemID = 250427,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Illidari Dreadstalker",
        ItemID = 250428,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Lambent Mana Ray",
        ItemID = 152844,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Leystone Basilisk",
        ItemID = 250424,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Leywoven Flying Carpet",
        ItemID = 143764,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Longhorned Argussian Talbuk",
        ItemID = 250805,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Longhorned Beryl Talbuk",
        ItemID = 250806,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Longhorned Bleakhoof Talbuk",
        ItemID = 250804,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Longhorned Sable Talbuk",
        ItemID = 250802,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Long-Forgotten Hippogryph",
        ItemID = 138258,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Luminous Mana Ray",
        ItemID = 250748,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Maddened Chaosrunner",
        ItemID = 152814,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Midnight",
        ItemID = 142236,
        Type = "Mount",
        Instance = "Return to Karazhan",
        InstanceID = 860,
        EncounterID = 1835,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase2,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Scintillating Mana Ray",
        ItemID = 152840,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    -- This was breaking on PTR, so try it on Live once
    {
        Name = "Scornwing Flight Form",
        ItemID = 253024,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61086)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Druid")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Scythe of the Unmaker",
        ItemID = 253273,
        Type = "Cosmetic",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 2031,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResource = { ItemID = 253304, Amount = 20 },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253304)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Cosmic Soulsliver]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(2031)) or "Argus the Unmaker")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Shackled Ur'zul",
        ItemID = 152789,
        Type = "Mount",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 2031,
        VendorName = "Hemet Nesingwary XVII",
        Cost = 100000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Shadowblade's Felscorned Omen",
        ItemID = 253030,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61084)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Rogue")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Slag Basilisk",
        ItemID = 250423,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Slayer's Felscorned Shrieker",
        ItemID = 253013,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61087)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Demon Hunter")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Snowy Highmountain Eagle",
        ItemID = 250721,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Spirit of Eche'ro",
        ItemID = 131734,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Taeshalach",
        ItemID = 255006,
        Type = "Cosmetic",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 1984,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResource = { ItemID = 253306, Amount = 20 },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253306)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Everflame of Hatred]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1984)) or "Aggramar")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "The First Satyr's Spaulders",
        ItemID = 242368,
        Type = "Cosmetic",
        Instance = "The Emerald Nightmare",
        InstanceID = 768,
        EncounterID = 1726,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResource = { ItemID = 242370, Amount = 20 },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(242370)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Horns of the First Satyr]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1726)) or "Xavius")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Treetop Highmountain Eagle",
        ItemID = 250723,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Turquoise Courser",
        ItemID = 250756,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Twilight Courser",
        ItemID = 250751,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Valajar Stormwing",
        ItemID = 147805,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Vibrant Mana Ray",
        ItemID = 152842,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Vile Fiend",
        ItemID = 152790,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 40000,
        Phase = LemixPhases.Phase4,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Wild Dreamrunner",
        ItemID = 147804,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 20000,
        Phase = LemixPhases.Phase3,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Wretched Fel Bat",
        ItemID = 239687,
        Type = "Mount",
        VendorName = "Hemet Nesingwary XVII",
        Cost = 10000,
        Phase = LemixPhases.Phase1,
        AreaPoiID = nil,
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
}