local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@enum DungeonDifficulty
 local DungeonDifficulty = {
    Normal = 1,
    Heroic = 2,
    Mythic = 23
}

---@enum RaidDifficulty
local RaidDifficulty = {
    Legacy10 = 3,
    Legacy25 = 4,
    Legacy10H = 5,
    Legacy25H = 6,
    LFR = 17,
    Normal = 14,
    Heroic = 15,
    Mythic = 16
}

---@type table<string, string[]>
AddOn.ExpansionTags = {
    Classic = { "classic", "vanilla" },
    TheBurningCrusade = { "the burning crusade", "burning crusade", "tbc" },
    WrathOfTheLichKing = { "wrath of the lich king", "wotlk" },
    Cataclysm = { "cataclysm", "cata" },
    MistsOfPandaria = { "mists of pandaria", "mop" },
    WarlordsOfDraenor = { "warlords of draenor", "wod" },
    Legion = { "legion" },
    BattleForAzeroth = { "battle for azeroth", "bfa" },
    Shadowlands = { "shadowlands", "sl" },
    Dragonflight = { "dragonflight", "df" },
    TheWarWithin = { "the war within", "war within", "tww" },
    Midnight = { "midnight" },
}

AddOn.DungeonDifficulty = DungeonDifficulty
AddOn.RaidDifficulty = RaidDifficulty

---@class Waypoint Information for placing a Blizzard map pin at a location
---@field mapID number Identifier for the map on which to place the pin
---@field x number X coordinate of the location on the map
---@field y number Y coordinate of the location on the map

---@class Mount Mount data to process and display as a list item in the AddOn
---@field Name string Name of the mount (for information only, displayed name is in user's locale)
---@field MountID number ID number for the mount
---@field Instance string Instance from which the mount can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance.
---@field EncounterID? number ID number for the encounter from which the mount is obtainable
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the mount can be obtained in
---@field SharedDifficulties? table<RaidDifficulty, RaidDifficulty> Provides associations for difficulties that share a lockout with the listed `DifficultyID`
---@field Notes? string Additional notes about the mount or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a mount. This can include expansion abbreviations, expansion names, zones, continents, etc<br/>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@type Mount[] List of mounts available from instances
AddOn.InstanceMounts = {
    {
        Name = "Abyss Worm",
        MountID = 899,
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        MapID = 1676,
        AreaPoiID = 5250,
        EncounterID = 1861,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 646, x = 0.64, y = 0.214 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Amani Battle Bear",
        MountID = 419,
        Instance = "Zul'Aman",
        InstanceID = 77,
        MapID = 568,
        AreaPoiID = 6683,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 95, x = 0.82, y = 0.643 },
        Notes = L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"],
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Antoran Charhound",
        MountID = 971,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        MapID = 1712,
        AreaPoiID = 5440,
        EncounterID = 1987,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 885, x = 0.548, y = 0.625 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Anu'relos, Flame's Guidance",
        MountID = 1818,
        Instance = "Amirdrassil, the Dream's Hope",
        InstanceID = 1207,
        MapID = 2549,
        AreaPoiID = 7631,
        EncounterID = 2519,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 2200, x = 0.273, y = 0.31 },
        SearchTags = AddOn.ExpansionTags.Dragonflight
    },
    {
        Name = "Armored Razzashi Raptor",
        MountID = 410,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        MapID = 859,
        AreaPoiID = 6682,
        EncounterID = 176,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 224, x = 0.64, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Ascendant Skyrazor",
        MountID = 2223,
        Instance = "Nerub-ar Palace",
        InstanceID = 1273,
        MapID = 2657,
        AreaPoiID = 7546,
        EncounterID = 2602,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 2255, x = 0.436, y = 0.903 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Ashes of Al'ar",
        MountID = 183,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        AreaPoiID = 6534,
        EncounterID = 1576,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Notes = L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"],
        Waypoint = { mapID = 109, x = 0.736, y = 0.637 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Astral Cloud Serpent",
        MountID = 478,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        AreaPoiID = 6511,
        EncounterID = 726,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 379, x = 0.596, y = 0.392 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Azure Drake",
        MountID = 246,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        MapID = 616,
        AreaPoiID = 6525,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 114, x = 0.275, y = 0.267 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Black Drake",
        MountID = 253,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        MapID = 615,
        AreaPoiID = 6520,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 115, x = 0.6, y = 0.57 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Blazing Drake",
        MountID = 442,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Notes = L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"],
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Blue Drake",
        MountID = 247,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        MapID = 616,
        AreaPoiID = 6525,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 114, x = 0.275, y = 0.267 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Blue Proto-Drake",
        MountID = 264,
        Instance = "Utgarde Pinnacle",
        InstanceID = 286,
        MapID = 575,
        AreaPoiID = 6690,
        EncounterID = 643,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 117, x = 0.572, y = 0.465 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Blue Qiraji Battle Tank",
        MountID = 117,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = {},
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"].."\n\n"..L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Bronze Drake",
        MountID = 248,
        Instance = "The Culling of Stratholme",
        InstanceID = 279,
        MapID = 595,
        AreaPoiID = 6663,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        Notes = L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"],
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Cartel Master's Gearglider",
        MountID = 1481,
        Instance = "Tazavesh, the Veiled Market",
        InstanceID = 1194,
        MapID = 2441,
        AreaPoiID = 2395,
        EncounterID = 2455,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"],
        Waypoint = { mapID = 1671, x = 0.602, y = 0.676 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Clutch of Ji-Kun",
        MountID = 543,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 828,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Drake of the North Wind",
        MountID = 395,
        Instance = "The Vortex Pinnacle",
        InstanceID = 68,
        MapID = 657,
        AreaPoiID = 6685,
        EncounterID = 115,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 1527, x = 0.767, y = 0.844 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Drake of the South Wind",
        MountID = 396,
        Instance = "Throne of the Four Winds",
        InstanceID = 74,
        MapID = 754,
        AreaPoiID = 6515,
        EncounterID = 155,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 1527, x = 0.37, y = 0.814 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Experiment 12-B",
        MountID = 445,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 331,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Notes = L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"],
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Felblaze Infernal",
        MountID = 791,
        Instance = "The Nighthold",
        InstanceID = 786,
        MapID = 1530,
        AreaPoiID = 5101,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 680, x = 0.437, y = 0.573 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Felsteel Annihilator",
        MountID = 751,
        Instance = "Hellfire Citadel",
        InstanceID = 669,
        MapID = 1448,
        AreaPoiID = 6504,
        EncounterID = 1438,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 534, x = 0.47, y = 0.526 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Fiery Warhorse",
        MountID = 168,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1553,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        Notes = L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"],
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Flametalon of Alysrazor",
        MountID = 425,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 194,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Glacial Tidestorm",
        MountID = 1219,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        -- AreaPoiID = 6012 -- Horde
        -- AreaPoiID = 6013 -- Alliance
        EncounterID = 2343,
        DifficultyIDs = { RaidDifficulty.Mythic },
        -- Waypoint = { mapID = 862, x = 0.543, y = 0.299 } -- Zuldazar
        -- Waypoint = { mapID = 1161, x = 0.704, y = 0.356 } -- Boralus,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "G.M.O.D",
        MountID = 1217,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        -- AreaPoiID = 6012 -- Horde
        -- AreaPoiID = 6013 -- Alliance
        EncounterID = 2334,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"],
        -- Waypoint = { mapID = 862, x = 0.543, y = 0.299 } -- Zuldazar
        -- Waypoint = { mapID = 1161, x = 0.704, y = 0.356 } -- Boralus,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Grand Black War Mammoth",
        MountID = 286,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        MapID = 624,
        AreaPoiID = 6526,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = L["Drops for Alliance characters, but obtaining this also gives you the Horde version"],
        Waypoint = { mapID = 123, x = 0.5, y = 0.117 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Grand Black War Mammoth",
        MountID = 287,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        MapID = 624,
        AreaPoiID = 6526,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = L["Drops for Horde characters, but obtaining this also gives you the Alliance version"],
        Waypoint = { mapID = 123, x = 0.5, y = 0.117 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Green Qiraji Battle Tank",
        MountID = 120,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = {},
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"].."\n\n"..L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Hellfire Infernal",
        MountID = 633,
        Instance = "The Nighthold",
        InstanceID = 786,
        MapID = 1530,
        AreaPoiID = 5101,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 680, x = 0.437, y = 0.573 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Invincible",
        MountID = 363,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy25H },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ironhoof Destroyer",
        MountID = 613,
        Instance = "Blackrock Foundry",
        InstanceID = 457,
        MapID = 1205,
        AreaPoiID = 6505,
        EncounterID = 959,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 543, x = 0.516, y = 0.272 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Kor'kron Juggernaut",
        MountID = 559,
        Instance = "Seige of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 869,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Life-Binder's Handmaiden",
        MountID = 444,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = { [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H },
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Marrowfang",
        MountID = 1406,
        Instance = "The Necrotic Wake",
        InstanceID = 1182,
        MapID = 2286,
        AreaPoiID = 6582,
        EncounterID = 2396,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1533, x = 0.401, y = 0.552 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Mechagon Peacekeeper",
        MountID = 1252,
        Instance = "Operation: Mechagon",
        InstanceID = 1178,
        MapID = 2097,
        AreaPoiID = 6129,
        EncounterID = 2355,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1462, x = 0.729, y = 0.365 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Midnight",
        MountID = 875,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        MapID = 1651,
        EncounterID = 1835,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Mimiron's Head",
        MountID = 304,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1649,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Upon entering the instance, raid difficulty will automatically be set to Normal"].."\n\n"..L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ny'alotha Allseer",
        MountID = 1293,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2375,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Onyxian Drake",
        MountID = 349,
        Instance = "Onyxia's Lair",
        InstanceID = 760,
        MapID = 249,
        AreaPoiID = 6527,
        EncounterID = 1651,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 70, x = 0.522, y = 0.759 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Prototype A.S.M.R",
        MountID = 2507,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
        MapID = 2769,
        AreaPoiID = 8240,
        EncounterID = 2646,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 2346, x = 0.416, y = 0.488 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Pureblood Fire Hawk",
        MountID = 415,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 198,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Raven Lord",
        MountID = 185,
        Instance = "Sethekk Halls",
        InstanceID = 252,
        MapID = 556,
        AreaPoiID = 6717,
        EncounterID = 542,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 108, x = 0.446, y = 0.656 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Red Qiraji Battle Tank",
        MountID = 118,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = {},
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"].."\n\n"..L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Rivendare's Deathcharger",
        MountID = 69, -- Nice
        Instance = "Stratholme - Service Entrance",
        InstanceID = 1292,
        MapID = 329,
        EncounterID = 456,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 23, x = 0.436, y = 0.191 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Sanctum Gloomcharger",
        MountID = 1500,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2439,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Shackled Ur'zul",
        MountID = 954,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        MapID = 1712,
        AreaPoiID = 5440,
        EncounterID = 2031,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 885, x = 0.548, y = 0.625 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Sharkbait",
        MountID = 995,
        Instance = "Freehold",
        InstanceID = 1001,
        MapID = 1754,
        AreaPoiID = 5834,
        EncounterID = 2095,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 895, x = 0.846, y = 0.788 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Smoldering Ember Wyrm",
        MountID = 883,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        MapID = 1651,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        Notes = L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"],
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Spawn of Horridon",
        MountID = 531,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 819,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Stonevalut Mechsuit",
        MountID = 2119,
        Instance = "The Stonevault",
        InstanceID = 1269,
        MapID = 2652,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        -- Waypoint = { mapID = , x = 0, y = 0 },
        Notes = L["Requires completing a short questline after looting the Malfunctioning Mechsuit item from Void Speaker Eirich"],
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Sureki Skyrazor",
        MountID = 2219,
        Instance = "Nerub-ar Palace",
        InstanceID = 1273,
        MapID = 2657,
        AreaPoiID = 7546,
        EncounterID = 2602,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 2255, x = 0.436, y = 0.903 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Swift White Hawkstrider",
        MountID = 213,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        MapID = 585,
        AreaPoiID = 6718,
        EncounterID = 533,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 122, x = 0.61, y = 0.307 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Swift Zulian Panther",
        MountID = 411,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        MapID = 859,
        AreaPoiID = 6682,
        EncounterID = 181,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Waypoint = { mapID = 224, x = 0.64, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "The Big G",
        MountID = 2487,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
        MapID = 2769,
        AreaPoiID = 8240,
        EncounterID = 2646,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 2346, x = 0.416, y = 0.488 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Tomb Stalker",
        MountID = 1040,
        Instance = "Kings' Rest",
        InstanceID = 1041,
        MapID = 1762,
        AreaPoiID = 5839,
        EncounterID = 2172,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 862, x = 0.376, y = 0.395 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Twilight Drake",
        MountID = 250,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        MapID = 615,
        AreaPoiID = 6520,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 115, x = 0.6, y = 0.57 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Unbound Star-Eater",
        MountID = 2569,
        Instance = "Manaforge Omega",
        InstanceID = 1302,
        MapID = 2810,
        AreaPoiID = 8363,
        EncounterID = 2691,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 2371, x = 0.417, y = 0.215 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Underrot Crawg",
        MountID = 1053,
        Instance = "The Underrot",
        InstanceID = 1022,
        MapID = 1841,
        AreaPoiID = 5841,
        EncounterID = 2158,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 863, x = 0.513, y = 0.646 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Vengeance",
        MountID = 1471,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2441,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Vitreous Stone Drake",
        MountID = 397,
        Instance = "The Stonecore",
        InstanceID = 67,
        MapID = 725,
        AreaPoiID = 6687,
        EncounterID = 111,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Waypoint = { mapID = 207, x = 0.474, y = 0.521 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Wick",
        MountID = 2204,
        Instance = "Darkflame Cleft",
        InstanceID = 1210,
        MapID = 2651,
        AreaPoiID = 7821,
        EncounterID = 2561,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2214, x = 0.555, y = 0.216 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Yellow Qiraji Battle Tank",
        MountID = 119,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = {},
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"].."\n\n"..L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Zereth Overseer",
        MountID = 1587,
        Instance = "Sepulcher of the First Ones",
        InstanceID = 1195,
        MapID = 2481,
        AreaPoiID = 7021,
        EncounterID = 2464,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 1970, x = 0.805, y = 0.534 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    }
}

---@class Toy Toy data to process and display as a list item in the AddOn
---@field Name string Name of the toy (for information only?)
---@field ToyItemID number Item ID number for the toy
---@field Instance string Instance from which the toy can be obtained (for information only?)
---@field InstanceID number ID number for the instance
---@field IsRaid boolean Whether or not the instance is a raid
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance
---@field EncounterID? number ID number for the encounter from which the toy is available
---@field DifficultyIDs? (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the toy can be obtained in (is this even needed for toys?)
---@field Notes? string Additional notes about the toy or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a toy. This can include expansion abbreviations, expansion names, zones, continents, etc<br/>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@type Toy[] List of toys available from instances
AddOn.InstanceToys = {
    {
        Name = "Brazier of Madness",
        ToyItemID = 203757,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        IsRaid = false,
        MapID = 859,
        AreaPoiID = 6682,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Requires completion of the achievement Relics of a Fallen Empire"],
        Waypoint = { mapID = 224, x = 0.64, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Cosmic Hearthstone",
        ToyItemID = 246565,
        Instance = "Manaforge Omega",
        InstanceID = 1302,
        IsRaid = true,
        MapID = 2810,
        AreaPoiID = 8363,
        EncounterID = 2691,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 2371, x = 0.417, y = 0.215 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Don Carlos' Famous Hat",
        ToyItemID = 134019,
        Instance = "Old Hillsbrad Foothills",
        InstanceID = 251,
        IsRaid = false,
        MapID = 560,
        AreaPoiID = 6666,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"].."\n\n"..L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Explosive Hearthstone",
        ToyItemID = 236687,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
        IsRaid = true,
        MapID = 2769,
        AreaPoiID = 8240,
        EncounterID = 2642,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Can also be looting by fishing within the instance"],
        Waypoint = { mapID = 2346, x = 0.416, y = 0.488 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Familiar Journal",
        ToyItemID = 208096,
        Instance = "Scholomance (Classic)",
        InstanceID = 246,
        IsRaid = false,
        MapID = 1007,
        AreaPoiID = 6726,
        Notes = L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Fandral's Seed Pouch",
        ToyItemID = 122304,
        Instance = "Firelands",
        InstanceID = 78,
        IsRaid = true,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 197,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Notes = L["Can only be looted and used by a Druid"].."\n\n"..L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Gastropod Shell",
        ToyItemID = 98136,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        IsRaid = true,
        MapID = 1098,
        AreaPoiID = 6508,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Notes = L["Drops from Gastropod mobs found between Megaera and Ji-Kun"],
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Golden Hearthstone Card: Lord Jaraxxus",
        ToyItemID = 119211,
        Instance = "The Nighthold",
        InstanceID = 786,
        IsRaid = true,
        MapID = 1530,
        AreaPoiID = 5101,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["This item is obtainable even though it does not appear on the loot table for Gul'dan"],
        Waypoint = { mapID = 680, x = 0.437, y = 0.573 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Hearthstone of the Flame",
        ToyItemID = 209035,
        Instance = "Amirdrassil, the Dream's Hope",
        InstanceID = 1207,
        IsRaid = true,
        MapID = 2549,
        AreaPoiID = 7631,
        EncounterID = 2553,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Can also be looting by fishing within the instance"],
        Waypoint = { mapID = 2200, x = 0.273, y = 0.31 },
        SearchTags = AddOn.ExpansionTags.Dragonflight
    },
    {
        Name = "Krastinov's Bag of Horrors",
        ToyItemID = 88566,
        Instance = "Scholomance",
        InstanceID = 246,
        IsRaid = false,
        MapID = 1007,
        AreaPoiID = 6726,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Orb of the Sin'dorei",
        ToyItemID = 35275,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        IsRaid = false,
        MapID = 585,
        AreaPoiID = 6718,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Can drop from every boss in the dungeon"].."\n\n"..L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 122, x = 0.61, y = 0.307 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Piccolo of the Flaming Fire",
        ToyItemID = 13379,
        Instance = "Stratholme - Main Gate",
        InstanceID = 236,
        IsRaid = false,
        MapID = 329,
        EncounterID = 443,
        AreaPoiID = 6724,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 122, x = 0.61, y = 0.307 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Skull of Corruption",
        ToyItemID = 143544,
        Instance = "The Nighthold",
        InstanceID = 786,
        IsRaid = true,
        MapID = 1530,
        AreaPoiID = 5101,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Can only be looted and used by a Demon Hunter"].."\n\n"..L["This item is obtainable even though it does not appear on the loot table for Gul'dan"],
        Waypoint = { mapID = 680, x = 0.437, y = 0.573 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Unstable Portal Emitter",
        ToyItemID = 153004,
        Instance = "Seat of the Triumvirate",
        InstanceID = 945,
        IsRaid = false,
        MapID = 1753,
        AreaPoiID = 5327,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Dropped by the Rare Elite Vixx the Collector"],
        Waypoint = { mapID = 882, x = 0.222, y = 0.566 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Vixx's Chest of Tricks",
        ToyItemID = 152982,
        Instance = "Seat of the Triumvirate",
        InstanceID = 945,
        IsRaid = false,
        MapID = 1753,
        AreaPoiID = 5327,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Dropped by the Rare Elite Vixx the Collector"],
        Waypoint = { mapID = 882, x = 0.222, y = 0.566 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Vial of Green Goo",
        ToyItemID = 141331,
        Instance = "Gnomeregan",
        InstanceID = 231,
        IsRaid = false,
        MapID = 90,
        AreaPoiID = 6502,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["Dropped by the hidden boss Endgineer Omegaplugg"].."\n\n"..L["It is highly recommended to attempt this encounter with a full party"],
        Waypoint = { mapID = 27, x = 0.314, y = 0.380 },
        SearchTags = AddOn.ExpansionTags.Classic
    }
}