local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

---@enum DungeonDifficulty
 AddOn.DungeonDifficulty = {
    Normal = 1,
    Heroic = 2,
    Mythic = 23
}

---@enum RaidDifficulty
AddOn.RaidDifficulty = {
    Legacy10 = 3,
    Legacy25 = 4,
    Legacy10H = 5,
    Legacy25H = 6,
    LFR = 17,
    Normal = 14,
    Heroic = 15,
    Mythic = 16
}

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@class InstanceMount
---@field Name string
---@field MountID number
---@field Instance string
---@field InstanceID number
---@field MapID number
---@field EncounterID? number
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[]
---@field SharedDifficulties table<RaidDifficulty, RaidDifficulty>
---@field Notes? string Additional notes about this mount or instance

---@type table<string, InstanceMount>
AddOn.InstanceMounts = {
    {
        Name = "Abyss Worm",
        MountID = 899,
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        MapID = 1676,
        EncounterID = 1861,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Amani Battle Bear",
        MountID = 419,
        Instance = "Zul'Aman",
        InstanceID = 77,
        MapID = 568,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Antoran Charhound",
        MountID = 971,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        MapID = 1712,
        EncounterID = 1987,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Anu'relos, Flame's Guidance",
        MountID = 1818,
        Instance = "Amirdrassil, the Dream's Hope",
        InstanceID = 1207,
        MapID = 2549,
        EncounterID = 2519,
        DifficultyIDs = { RaidDifficulty.Mythic },
    },
    {
        Name = "Armored Razzashi Raptor",
        MountID = 410,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        MapID = 859,
        EncounterID = 176,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Ascendant Skyrazor",
        MountID = 2223,
        Instance = "Nerub-ar Palance",
        InstanceID = 1273,
        MapID = 2657,
        EncounterID = 2602,
        DifficultyIDs = { RaidDifficulty.Mythic },
    },
    {
        Name = "Ashes of Al'ar",
        MountID = 183,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        EncounterID = 1576,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Notes = "This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"
    },
    {
        Name = "Astral Cloud Serpent",
        MountID = 478,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        EncounterID = 726,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        }
    },
    {
        Name = "Azure Drake",
        MountID = 246,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        MapID = 616,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 }
    },
    {
        Name = "Black Drake",
        MountID = 253,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        MapID = 615,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Blazing Drake",
        MountID = 442,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Notes = "Available in Normal Legacy Raid difficulty, but Heroic should be set if |cFFFFD100Life-Binder's Handmaiden|r is not obtained yet"
    },
    {
        Name = "Blue Drake",
        MountID = 247,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        MapID = 616,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 }
    },
    {
        Name = "Blue Proto-Drake",
        MountID = 264,
        Instance = "Utgarde Pinnacle",
        InstanceID = 286,
        MapID = 575,
        EncounterID = 643,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Blue Qiraji Battle Tank",
        MountID = 117,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        DifficultyIDs = {},
        Notes = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR).."\n\nThis raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
    },
    {
        Name = "Bronze Drake",
        MountID = 248,
        Instance = "The Culling of Stratholme",
        InstanceID = 279,
        MapID = 595,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Cartel Master's Gearglider",
        MountID = 1481,
        Instance = "Tazavesh, the Veiled Market",
        InstanceID = 1194,
        MapID = 2441,
        EncounterID = 2455,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic }
    },
    {
        Name = "Clutch of Ji-Kun",
        MountID = 543,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        EncounterID = 828,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        }
    },
    {
        Name = "Drake of the North Wind",
        MountID = 395,
        Instance = "The Vortex Pinnacle",
        InstanceID = 68,
        MapID = 657,
        EncounterID = 115,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Drake of the South Wind",
        MountID = 396,
        Instance = "Throne of the Four Winds",
        InstanceID = 74,
        MapID = 754,
        EncounterID = 155,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        }
    },
    {
        Name = "Experiment 12-B",
        MountID = 445,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        EncounterID = 331,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Notes = "Available in Normal Legacy Raid difficulty, but Heroic should be set if |cFFFFD100Life-Binder's Handmaiden|r is not obtained yet"
    },
    {
        Name = "Felblaze Infernal",
        MountID = 791,
        Instance = "The Nighthold",
        InstanceID = 786,
        MapID = 1530,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Felsteel Annihilator",
        MountID = 751,
        Instance = "Hellfire Citadel",
        InstanceID = 669,
        MapID = 1448,
        EncounterID = 1438,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Fiery Warhorse",
        MountID = 168,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        EncounterID = 1553,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Flametalon of Alysrazor",
        MountID = 425,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        EncounterID = 194,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic }
    },
    {
        Name = "Glacial Tidestorm",
        MountID = 1219,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        EncounterID = 2343,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "G.M.O.D",
        MountID = 1217,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        EncounterID = 2334,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Obtainable in Raid Finder (LFR) difficulty by killing "..WrapTextInColor("Lady Jaina Proudmoore", DARKYELLOW_FONT_COLOR)
    },
    {
        Name = "Grand Black War Mammoth |A:QuestPortraitIcon-Alliance:15:17|a",
        MountID = 286,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        MapID = 624,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = "Drops for "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." characters, but obtaining this also gives you the "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." version"
    },
    {
        Name = "Grand Black War Mammoth |A:QuestPortraitIcon-Horde:15:17|a",
        MountID = 287,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        MapID = 624,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = "Drops for "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." characters, but obtaining this also gives you the "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." version"
    },
    {
        Name = "Green Qiraji Battle Tank",
        MountID = 120,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        DifficultyIDs = {},
        Notes = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR).."\n\nThis raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
    },
    {
        Name = "Hellfire Infernal",
        MountID = 633,
        Instance = "The Nighthold",
        InstanceID = 786,
        MapID = 1530,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Invincible",
        MountID = 363,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy25H }
    },
    {
        Name = "Ironhoof Destroyer",
        MountID = 613,
        Instance = "Blackrock Foundry",
        InstanceID = 457,
        MapID = 1205,
        EncounterID = 959,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Kor'kron Juggernaut",
        MountID = 559,
        Instance = "Seige of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        EncounterID = 869,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Life-Binder's Handmaiden",
        MountID = 444,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = { [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H }
    },
    {
        Name = "Marrowfang",
        MountID = 1406,
        Instance = "The Necrotic Wake",
        InstanceID = 1182,
        MapID = 2286,
        EncounterID = 2396,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Mechagon Peacekeeper",
        MountID = 1252,
        Instance = "Operation: Mechagon",
        InstanceID = 1178,
        MapID = 2097,
        EncounterID = 2355,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Midnight",
        MountID = 875,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        MapID = 1651,
        EncounterID = 1835,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Mimiron's Head",
        MountID = 304,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        EncounterID = 1649,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = "Upon entering the instance, raid difficulty will automatically be set to Normal"
    },
    {
        Name = "Ny'alotha Allseer",
        MountID = 1293,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        EncounterID = 2375,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Onyxian Drake",
        MountID = 349,
        Instance = "Onyxia's Lair",
        InstanceID = 760,
        MapID = 249,
        EncounterID = 1651,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = { [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10 },
    },
    {
        Name = "Prototype A.S.M.R",
        MountID = 2507,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
        MapID = 2769,
        EncounterID = 2646,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Pureblood Fire Hawk",
        MountID = 415,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        EncounterID = 198,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic }
    },
    {
        Name = "Raven Lord",
        MountID = 185,
        Instance = "Sethekk Halls",
        InstanceID = 252,
        MapID = 556,
        EncounterID = 542,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Red Qiraji Battle Tank",
        MountID = 118,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        DifficultyIDs = {},
        Notes = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR).."\n\nThis raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
    },
    {
        Name = "Rivendare's Deathcharger",
        MountID = 69, -- Nice
        Instance = "Stratholme - Service Entrance",
        InstanceID = 1292,
        MapID = 329,
        EncounterID = 456,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Sanctum Gloomcharger",
        MountID = 1500,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        EncounterID = 2439,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Shackled Ur'zul",
        MountID = 954,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        MapID = 1712,
        EncounterID = 2031,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Sharkbait",
        MountID = 995,
        Instance = "Freehold",
        InstanceID = 1001,
        MapID = 1754,
        EncounterID = 2095,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Smoldering Ember Wyrm",
        MountID = 883,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        MapID = 1651,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Spawn of Horridon",
        MountID = 531,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        EncounterID = 819,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        }
    },
    {
        Name = "Sureki Skyrazor",
        MountID = 2219,
        Instance = "Nerub-ar Palace",
        InstanceID = 1273,
        MapID = 2657,
        EncounterID = 2602,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Swift White Hawkstrider",
        MountID = 213,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        MapID = 585,
        EncounterID = 533,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Swift Zulian Panther",
        MountID = 411,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        MapID = 859,
        EncounterID = 181,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "The Big G",
        MountID = 2487,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
        MapID = 2769,
        EncounterID = 2646,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Tomb Stalker",
        MountID = 1040,
        Instance = "Kings' Rest",
        InstanceID = 1041,
        MapID = 1762,
        EncounterID = 2172,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Twilight Drake",
        MountID = 250,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        MapID = 615,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy25 }
    },
    {
        Name = "Underrot Crawg",
        MountID = 1053,
        Instance = "The Underrot",
        InstanceID = 1022,
        MapID = 1841,
        EncounterID = 2158,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Vengeance",
        MountID = 1471,
        Instance = "Sanctum of Dominiation",
        InstanceID = 1193,
        MapID = 2450,
        EncounterID = 2441,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Vitreous Stone Drake",
        MountID = 397,
        Instance = "The Stonecore",
        InstanceID = 67,
        MapID = 725,
        EncounterID = 111,
        DifficultyIDs = { DungeonDifficulty.Normal }
    },
    {
        Name = "Wick",
        MountID = 2204,
        Instance = "Darkflame Cleft",
        InstanceID = 1210,
        MapID = 2651,
        EncounterID = 2561,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Yellow Qiraji Battle Tank",
        MountID = 119,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        DifficultyIDs = {},
        Notes = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR).."\n\nThis raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
    },
    {
        Name = "Zereth Overseer",
        MountID = 1587,
        Instance = "Sepulcher of the First Ones",
        InstanceID = 1195,
        MapID = 2481,
        EncounterID = 2464,
        DifficultyIDs = { RaidDifficulty.Mythic }
    }
}