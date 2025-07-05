local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)

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
    Normal = 14,
    Heroic = 15,
    Mythic = 16
}

---@class InstanceMount
---@field Name string
---@field MountID number
---@field Instance string
---@field InstanceID number
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[]
---@field Notes? string Additional notes about this mount or instance

---@type table<string, InstanceMount>
AddOn.InstanceMounts = {
    {
        Name = "Abyss Worm",
        MountID = 899,
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
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
        Name = "Armored Razzashi Raptor",
        MountID = 410,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        DifficultyIDs = { DungeonDifficulty.Heroic }
    },
    {
        Name = "Ashes of Al'ar",
        MountID = 183,
        Instance = "The Eye",
        InstanceID = 749,
        DifficultyIDs = {},
        Notes = "This raid only has an option for 25-man difficulty, so any raid difficulty will suffice"
    },
    {
        Name = "Black Drake",
        MountID = 253,
        Instance = "The Obsidian Sanctum",
        InstanceID = 755,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Blue Drake",
        MountID = 247,
        Instance = "Eye of Eternity",
        InstanceID = 756,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
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
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic }
    },
    {
        Name = "Clutch of Ji-Kun",
        MountID = 543,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Drake of the North Wind",
        MountID = 395,
        Instance = "The Vortex Pinnacle",
        InstanceID = 68,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = "Also obtainable in Timewalking"
    },
    {
        Name = "Experiment 12-B",
        MountID = 445,
        Instance = "Dragon Soul",
        InstanceID = 187,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        Notes = "Obtainable in Normal difficulty as well, but only 2 mounts are available in Normal vs. 3 in Heroic"
    },
    {
        Name = "Felsteel Annihilator",
        MountID = 751,
        Instance = "Hellfire Citadel",
        InstanceID = 669,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Fiery Warhorse",
        MountID = 168,
        Instance = "Karazhan",
        InstanceID = 745,
        DifficultyIDs = { RaidDifficulty.Legacy10 }
    },
    {
        Name = "Flametalon of Alysrazor",
        MountID = 425,
        Instance = "Firelands",
        InstanceID = 78,
        DifficultyIDs = { RaidDifficulty.Legacy10, RaidDifficulty.Legacy10H }
    },
    {
        Name = "G.M.O.D",
        MountID = 1217,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Also obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"
    },
    {
        Name = "Glacial Tidestorm",
        MountID = 1219,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        DifficultyIDs = { RaidDifficulty.Mythic }
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
        InstanceID = 768,
        DifficultyIDs = { RaidDifficulty.Mythic }
    },
    {
        Name = "Invincible",
        MountID = 363,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        DifficultyIDs = { RaidDifficulty.Legacy25H }
    },
    {
        Name = "Rivendare's Deathcharger",
        MountID = 69, -- Nice
        Instance = "Stratholme - Service Entrance",
        InstanceID = 1292,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = "Also obtainable in Timewalking"
    },
}