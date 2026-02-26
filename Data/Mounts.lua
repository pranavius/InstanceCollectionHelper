local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@type Mount[] List of mounts available from instances
AddOn.Mounts = {
    {
        Name = "Abyss Worm",
        ID = 899,
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
        Name = "Aerial Unit R-21/X",
        ID = 1227,
        Instance = "Operation: Mechagon",
        InstanceID = 1178,
        MapID = 2097,
        AreaPoiID = 6129,
        EncounterID = 2331,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1462, x = 0.729, y = 0.365 },
        Notes = L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Amani Battle Bear",
        ID = 419,
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
        ID = 971,
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
        ID = 1818,
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
        ID = 410,
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
        ID = 2223,
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
        ID = 183,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        AreaPoiID = 6534,
        EncounterID = 1576,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 109, x = 0.736, y = 0.637 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Ashes of Belo'ren",
        ID = 2607,
        Instance = "March on Quel'Danas",
        InstanceID = 1308,
        MapID = 2913,
        AreaPoiID = 8271,
        EncounterID = 2740,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 2424, x = 0.526, y = 0.853 },
        SearchTags = AddOn.ExpansionTags.Midnight
    },
    {
        Name = "Astral Cloud Serpent",
        ID = 478,
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
        ID = 246,
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
        ID = 253,
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
        ID = 442,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 333,
        --@retail@
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Notes = L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"],
        --@end-retail@
        --@version-mists@
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10
        },
        --@end-version-mists@
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Blue Drake",
        ID = 247,
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
        ID = 264,
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
        ID = 117,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Bronze Drake",
        ID = 248,
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
        ID = 1481,
        Instance = "Tazavesh, the Veiled Market",
        InstanceID = 1194,
        MapID = 2441,
        AreaPoiID = 2395,
        EncounterID = 2455,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        -- Commenting the below note and waypoint due to alternate entrace available in K'aresh. Unsure if this will be a permanent entrance or not as of now
        -- Notes = L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"],
        -- Waypoint = { mapID = 1671, x = 0.602, y = 0.676 },
        Waypoint = { mapID = 2371, x = 0.636, y = 0.702 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Clutch of Ji-Kun",
        ID = 543,
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
        ID = 395,
        Instance = "The Vortex Pinnacle",
        InstanceID = 68,
        MapID = 657,
        AreaPoiID = 6685,
        EncounterID = 115,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        --@retail@
        Notes = L["Also obtainable in Timewalking"],
        --@end-retail@
        Waypoint = { mapID = 1527, x = 0.767, y = 0.844 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Drake of the South Wind",
        ID = 396,
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
        ID = 445,
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
        ID = 791,
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
        ID = 751,
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
        ID = 168,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1553,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Flametalon of Alysrazor",
        ID = 425,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 194,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        --@retail@
        Notes = L["Also obtainable in Timewalking"],
        --@end-retail@
        -- TODO: Fix for mists
        -- DifficultyIDs = { RaidDifficulty.Legacy10, RaidDifficulty.Legacy10H, RaidDifficulty.Legacy25, RaidDifficulty.Legacy25H },
        -- SharedDifficulties = {
        --     [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy25,
        --     [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy25H
        -- },
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Glacial Tidestorm",
        ID = 1219,
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
        ID = 1217,
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
        ID = 286,
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
        ID = 287,
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
        ID = 120,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Hellfire Infernal",
        ID = 633,
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
        ID = 363,
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
        ID = 613,
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
        ID = 559,
        Instance = "Siege of Orgimmar",
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
        ID = 444,
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
        Name = "Lucent Hawkstrider",
        ID = 2817,
        Instance = "Magister's Terrace",
        InstanceID = 1300,
        MapID = 2811,
        AreaPoiID = 8510,
        EncounterID = 2662,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2424, x = 0.635, y = 0.154 },
        SearchTags = AddOn.ExpansionTags.Midnight
    },
    {
        Name = "Marrowfang",
        ID = 1406,
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
        ID = 1252,
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
        ID = 875,
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
        ID = 304,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1649,
        DifficultyIDs = { RaidDifficulty.Normal },
        --@retail@
        Notes = L["Upon entering the instance, raid difficulty will automatically be set to Normal"].."\n\n"..L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"],
        --@end-retail@
        --@version-mists@
        Notes = L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"],
        --@end-version-mists@
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ny'alotha Allseer",
        ID = 1293,
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
        ID = 349,
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
        ID = 2507,
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
        ID = 415,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 198,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        --@retail@
        Notes = L["Also obtainable in Timewalking"],
        --@end-retail@
        -- TODO: Fix for mists
        -- DifficultyIDs = { RaidDifficulty.Legacy10, RaidDifficulty.Legacy10H, RaidDifficulty.Legacy25, RaidDifficulty.Legacy25H },
        -- SharedDifficulties = {
        --     [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy25,
        --     [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy25H
        -- },
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Raven Lord",
        ID = 185,
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
        ID = 118,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Rivendare's Deathcharger",
        ID = 69, -- Nice
        Instance = "Stratholme - Service Entrance",
        --@retail@
        InstanceID = 1292,
        --@end-retail@
        --@version-mists@
        InstanceID = 236,
        --@end-version-mists@
        MapID = 329,
        EncounterID = 456,
        DifficultyIDs = { DungeonDifficulty.Normal },
        --@retail@
        Notes = L["Also obtainable in Timewalking"],
        --@end-retail@
        Waypoint = { mapID = 23, x = 0.436, y = 0.191 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Sanctum Gloomcharger",
        ID = 1500,
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
        ID = 954,
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
        ID = 995,
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
        Name = "Slime Serpent",
        ID = 1445,
        Instance = "Plaguefall",
        InstanceID = 1183,
        MapID = 2289,
        AreaPoiID = 6585,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Clear the dungeon solo, then return to the area where Domina Venomblade was and interact with the Curious Slime Serpent."],
        Waypoint = { mapID = 1536, x = 0.594, y = 0.65 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Smoldering Ember Wyrm",
        ID = 883,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        MapID = 1651,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Notes = L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"],
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Spawn of Horridon",
        ID = 531,
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
        Name = "Spectral Hawkstrider",
        ID = 2805,
        Instance = "Windrunner Spire",
        InstanceID = 1299,
        MapID = 2805,
        AreaPoiID = 8386,
        EncounterID = 2658,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2395, x = 0.355, y = 0.788 },
        SearchTags = AddOn.ExpansionTags.Midnight
    },
    {
        Name = "Stonevalut Mechsuit",
        ID = 2119,
        Instance = "The Stonevault",
        InstanceID = 1269,
        MapID = 2652,
        AreaPoiID = 7820,
        EncounterID = 2582,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 2214, x = 0.427, y = 0.086 },
        Notes = L["Requires completing a short questline after looting Malfunctioning Mechsuit"],
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Sureki Skyrazor",
        ID = 2219,
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
        ID = 213,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        MapID = 585,
        AreaPoiID = 6718,
        EncounterID = 533,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        --@retail@
        Notes = L["Also obtainable in Timewalking"],
        --@end-retail@
        Waypoint = { mapID = 122, x = 0.61, y = 0.307 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Swift Zulian Panther",
        ID = 411,
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
        ID = 2487,
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
        ID = 1040,
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
        ID = 250,
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
        ID = 2569,
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
        ID = 1053,
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
        ID = 1471,
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
        ID = 397,
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
        ID = 2204,
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
        ID = 119,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Notes = L["Drop from trash mobs around Temple of Ahn'Qiraj"],
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Zereth Overseer",
        ID = 1587,
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