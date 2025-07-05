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
---@field EncounterID? number
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[]
---@field Notes? string Additional notes about this mount or instance

---@type table<string, InstanceMount>
AddOn.InstanceMounts = {
    {
        Name = "Abyss Worm",
        MountID = 899,
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        EncounterID = 1861,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Also obtainable in Raid Finder (LFR) difficulty"
    },
    {
        Name = "Amani Battle Bear",
        MountID = 419,
        Instance = "Zul'Aman",
        InstanceID = 77,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Antoran Charhound",
        MountID = 971,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 1987,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Also obtainable in Raid Finder (LFR) difficulty"
    },
    {
        Name = "Armored Razzashi Raptor",
        MountID = 410,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        EncounterID = 176,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Ashes of Al'ar",
        MountID = 183,
        Instance = "The Eye",
        InstanceID = 749,
        EncounterID = 1576,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 25-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Azure Drake",
        MountID = 246,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Black Drake",
        MountID = 253,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Blazing Drake",
        MountID = 442,
        Instance = "Dragon Soul",
        InstanceID = 187,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H }
    },
    {
        Name = "Blue Drake",
        MountID = 247,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        EncounterID = 1617,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Blue Proto-Drake",
        MountID = 264,
        Instance = "Utgarde Pinnacle",
        InstanceID = 286,
        EncounterID = 643,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Blue Qiraji Battle Tank",
        MountID = 117,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 40-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Bronze Drake",
        MountID = 248,
        Instance = "The Culling of Stratholme",
        InstanceID = 279,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Cartel Master's Gearglider",
        MountID = 1481,
        Instance = "Tazavesh, the Veiled Market",
        InstanceID = 1194,
        EncounterID = 2455,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic }
    },
    {
        Name = "Clutch of Ji-Kun",
        MountID = 543,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        EncounterID = 828,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Drake of the North Wind",
        MountID = 395,
        Instance = "The Vortex Pinnacle",
        InstanceID = 68,
        EncounterID = 115,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Drake of the South Wind",
        MountID = 396,
        Instance = "Throne of the Four Winds",
        InstanceID = 74,
        EncounterID = 155,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Experiment 12-B",
        MountID = 445,
        Instance = "Dragon Soul",
        InstanceID = 187,
        EncounterID = 331,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        Notes = "Obtainable in Normal difficulty as well, but only 2 mounts are available in Normal vs. 3 in Heroic"
    },
    {
        Name = "Felblaze Infernal",
        MountID = 791,
        Instance = "The Nighthold",
        InstanceID = 786,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic }
    },
    {
        Name = "Felsteel Annihilator",
        MountID = 751,
        Instance = "Hellfire Citadel",
        InstanceID = 669,
        EncounterID = 1438,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Fiery Warhorse",
        MountID = 168,
        Instance = "Karazhan",
        InstanceID = 745,
        EncounterID = 1553,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Flametalon of Alysrazor",
        MountID = 425,
        Instance = "Firelands",
        InstanceID = 78,
        EncounterID = 194,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic }
    },
    {
        Name = "G.M.O.D",
        MountID = 1217,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        EncounterID = 2334,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Also obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"
    },
    {
        Name = "Glacial Tidestorm",
        MountID = 1219,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        EncounterID = 2343,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Grand Black War Mammoth",
        MountID = 286,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = "Alliance/Horde specific"
    },
    {
        Name = "Grand Black War Mammoth",
        MountID = 287,
        Instance = "Vault of Archavon",
        InstanceID = 753,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Notes = "Alliance/Horde specific"
    },
    {
        Name = "Green Qiraji Battle Tank",
        MountID = 120,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 40-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Hellfire Infernal",
        MountID = 633,
        Instance = "The Nighthold",
        InstanceID = 786,
        EncounterID = 1737,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Invincible",
        MountID = 363,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy25H }
    },
    {
        Name = "Ironhoof Destroyer",
        MountID = 613,
        Instance = "Blackrock Foundry",
        InstanceID = 457,
        EncounterID = 959,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Kor'kron Juggernaut",
        MountID = 559,
        Instance = "Seige of Orgimmar",
        InstanceID = 369,
        EncounterID = 869,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Life-Binder's Handmaiden",
        MountID = 444,
        Instance = "Dragon Soul",
        InstanceID = 187,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.Legacy10H }
    },
    {
        Name = "Marrowfang",
        MountID = 1406,
        Instance = "The Necrotic Wake",
        InstanceID = 1182,
        EncounterID = 2396,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Mechagon Peacekeeper",
        MountID = 1252,
        Instance = "Operation: Mechagon",
        InstanceID = 1178,
        EncounterID = 2355,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Midnight",
        MountID = 875,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        EncounterID = 1835,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Mimiron's Head",
        MountID = 304,
        Instance = "Ulduar",
        InstanceID = 759,
        EncounterID = 1649,
        DifficultyIDs = { RaidDifficulty.Legacy25 }
    },
    {
        Name = "Ny'alotha Allseer",
        MountID = 1293,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        EncounterID = 2375,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Onyxian Drake",
        MountID = 349,
        Instance = "Onyxia's Lair",
        InstanceID = 760,
        EncounterID = 1651,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Pureblood Fire Hawk",
        MountID = 415,
        Instance = "Firelands",
        InstanceID = 78,
        EncounterID = 198,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic }
    },
    {
        Name = "Raven Lord",
        MountID = 185,
        Instance = "Sethekk Halls",
        InstanceID = 252,
        EncounterID = 542,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Red Qiraji Battle Tank",
        MountID = 118,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 40-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Rivendare's Deathcharger",
        MountID = 69, -- Nice
        Instance = "Stratholme - Service Entrance",
        InstanceID = 1292,
        EncounterID = 456,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Sanctum Gloomcharger",
        MountID = 1500,
        Instance = "Sanctum of Dominiation",
        InstanceID = 1193,
        EncounterID = 2439,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Also obtainable in Raid Finder (LFR) difficulty"
    },
    {
        Name = "Shackled Ur'zul",
        MountID = 954,
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 2031,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Sharkbait",
        MountID = 995,
        Instance = "Freehold",
        InstanceID = 1001,
        EncounterID = 2095,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Smoldering Ember Wyrm",
        MountID = 883,
        Instance = "Return to Karazhan",
        InstanceID = 860,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Spawn of Horridon",
        MountID = 531,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        EncounterID = 819,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Swift White Hawkstrider",
        MountID = 213,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        EncounterID = 533,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Swift Zulian Panther",
        MountID = 411,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        EncounterID = 181,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Tomb Stalker",
        MountID = 1040,
        Instance = "Kings' Rest",
        InstanceID = 1041,
        EncounterID = 2172,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Twilight Drake",
        MountID = 250,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        EncounterID = 1616,
        DifficultyIDs = { RaidDifficulty.Legacy25 }
    },
    {
        Name = "Vitreous Stone Drake",
        MountID = 397,
        Instance = "The Stonecore",
        InstanceID = 67,
        EncounterID = 111,
        DifficultyIDs = { DungeonDifficulty.Normal }
    },
    {
        Name = "Underrot Crawg",
        MountID = 1053,
        Instance = "The Underrot",
        InstanceID = 1022,
        EncounterID = 2158,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Vengeance",
        MountID = 1471,
        Instance = "Sanctum of Dominiation",
        InstanceID = 1193,
        EncounterID = 2441,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Wick",
        MountID = 2204,
        Instance = "Darkflame Cleft",
        InstanceID = 1210,
        EncounterID = 2561,
        DifficultyIDs = { DungeonDifficulty.Mythic }
    },
    {
        Name = "Yellow Qiraji Battle Tank",
        MountID = 119,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 40-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Zereth Overseer",
        MountID = 1587,
        Instance = "Sepulcher of the First Ones",
        InstanceID = 1195,
        EncounterID = 2464,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
}