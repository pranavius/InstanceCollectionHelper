local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@type DecorItem[]
AddOn.DecorItems = {
    {
        Name = "Dark Iron Chandelier",
        DecorItemID = 246429,
        Instance = "Blackrock Depths",
        InstanceID = 228,
        MapID = 230,
        AreaPoiID = 6499,
        EncounterID = 387,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"],
        Waypoint = { mapID = 35, x = 0.538, y = 0.813 }, -- Molten Core Waypoint
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Draenic Ottoman",
        DecorItemID = 251331,
        Instance = "Auchindoun",
        InstanceID = 547,
        MapID = 1182,
        AreaPoiID = 6673,
        EncounterID = 1225,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 535, x = 0.463, y = 0.739 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Gilnean Circular Rug",
        DecorItemID = 244655,
        Instance = "Shadowfang Keep",
        InstanceID = 64,
        MapID = 33,
        AreaPoiID = 6725,
        EncounterID = 100,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Waypoint = { mapID = 21, x = 0.459, y = 0.679 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Gnomish Tesla Tower",
        DecorItemID = 255672,
        Instance = "Operation: Mechagon",
        InstanceID = 1178,
        MapID = 2097,
        AreaPoiID = 6129,
        EncounterID = 2331,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1462, x = 0.729, y = 0.365 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Horde Battle Emblem",
        DecorItemID = 245435,
        Instance = "Upper Blackrock Spire",
        InstanceID = 559,
        MapID = 1358,
        AreaPoiID = 6660,
        EncounterID = 1234,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 33, x = 0.790, y = 0.338 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Horde Warlord's Throne",
        DecorItemID = 253242,
        Instance = "Siege of Orgrimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 869,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Magistrix's Garden Fountain",
        DecorItemID = 256682,
        Instance = "The Nighthold",
        InstanceID = 786,
        MapID = 1530,
        AreaPoiID = 5101,
        EncounterID = 1751,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 680, x = 0.437, y = 0.573 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Meadery Ochre Window",
        DecorItemID = 245560,
        Instance = "Cinderbrew Meadery",
        InstanceID = 1272,
        MapID = 2661,
        AreaPoiID = 7857,
        EncounterID = 2589,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in a Follower dungeon"],
        Waypoint = { mapID = 2248, x = 0.766, y = 0.438 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Moon-Blessed Storage Crate",
        DecorItemID = 238857,
        Instance = "Darkheart Thicket",
        InstanceID = 762,
        MapID = 1466,
        AreaPoiID = 5094,
        EncounterID = 1657,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 641, x = 0.591, y = 0.314 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Orgimmar Sconce",
        DecorItemID = 245434,
        Instance = "Iron Docks",
        InstanceID = 558,
        MapID = 1195,
        AreaPoiID = 6671,
        EncounterID = 1238,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 543, x = 0.454, y = 0.135 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Ornate Suramar Table",
        DecorItemID = 247913,
        Instance = "Court of Stars",
        InstanceID = 800,
        MapID = 1571,
        AreaPoiID = 5100,
        EncounterID = 1720,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 680, x = 0.508, y = 0.655 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Overgrown Arathi Trellis",
        DecorItemID = 245938,
        Instance = "Priory of the Sacred Flame",
        InstanceID = 1267,
        MapID = 2649,
        AreaPoiID = 7858,
        EncounterID = 2573,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in a Follower dungeon"],
        Waypoint = { mapID = 2215, x = 0.413, y = 0.493 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Qalashi Goulash",
        DecorItemID = 256354,
        Instance = "Neltharus",
        InstanceID = 1199,
        MapID = 2519,
        AreaPoiID = 7211,
        EncounterID = 2501,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2022, x = 0.257, y = 0.563 },
        SearchTags = AddOn.ExpansionTags.Dragonflight
    },
    {
        Name = "Stolen Ironforge Seat",
        DecorItemID = 246421,
        Instance = "Freehold",
        InstanceID = 1001,
        MapID = 1754,
        AreaPoiID = 5834,
        EncounterID = 2095,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 895, x = 0.846, y = 0.788 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Stormwind Footlocker",
        DecorItemID = 248332,
        Instance = "The Deadmines",
        InstanceID = 63,
        MapID = 36,
        AreaPoiID = 6500,
        EncounterID = 93,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = L["Dropped by Vanessa VanCleef on Heroic difficulty"],
        Waypoint = { mapID = 52, x = 0.426, y = 0.716 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Thunder Totem Brazier",
        DecorItemID = 245451,
        Instance = "Neltharion's Lair",
        InstanceID = 767,
        MapID = 1458,
        AreaPoiID = 5103,
        EncounterID = 1687,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 650, x = 0.496, y = 0.685 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Tidesage's Fireplace",
        DecorItemID = 245681,
        Instance = "Shrine of the Storm",
        InstanceID = 1036,
        MapID = 1864,
        AreaPoiID = 5835,
        EncounterID = 2156,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 942, x = 0.786, y = 0.266 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Tome of Pandaren Wisdom",
        DecorItemID = 246846,
        Instance = "Temple of the Jade Serpent",
        InstanceID = 313,
        MapID = 960,
        AreaPoiID = 6676,
        EncounterID = 335,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 371, x = 0.562, y = 0.579 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Valdrakken Bookcase",
        DecorItemID = 260359,
        Instance = "Algeth'ar Academy",
        InstanceID = 1201,
        MapID = 2526,
        AreaPoiID = 7213,
        EncounterID = 2514,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2025, x = 0.583, y = 0.424 },
        SearchTags = AddOn.ExpansionTags.Dragonflight
    },
    {
        Name = "Valdrakken Hanging Lamp",
        DecorItemID = 256428,
        Instance = "Ruby Life Pools",
        InstanceID = 1202,
        MapID = 2521,
        AreaPoiID = 7212,
        EncounterID = 2503,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2022, x = 0.601, y = 0.757 },
        SearchTags = AddOn.ExpansionTags.Dragonflight
    }
}