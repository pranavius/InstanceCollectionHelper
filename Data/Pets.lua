local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@class Pet Pet data to process and display as a list item in the AddOn
---@field Name string Name of the pet (for information only, displayed name is in user's locale)
---@field PetItemID number Item ID number for the pet
---@field Instance string Instance from which the pet can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance
---@field EncounterID? number ID number for the encounter from which the pet is available
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the pet can be obtained in
---@field Notes? string Additional notes about the pet or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a pet. This can include expansion abbreviations, expansion names, zones, continents, etc<br/>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@type Pet[] List of pets available from instances
AddOn.InstancePets = {
    {
        Name = "Abyssius",
        PetItemID = 122106,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1583,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Amberglow Stinger",
        PetItemID = 167053,
        Instance = "Heart of Fear",
        InstanceID = 330,
        MapID = 1009,
        AreaPoiID = 6510,
        EncounterID = 744,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Anubisath Idol",
        PetItemID = 93040,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        EncounterID = 1549,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Aqir Hivespawn",
        PetItemID = 174448,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2372,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Ashstone Core",
        PetItemID = 93035,
        Instance = "Molten Core",
        InstanceID = 741,
        MapID = 409,
        AreaPoiID = 6535,
        EncounterID = 1526,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 35, x = 0.538, y = 0.813 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Azure Windseeker",
        PetItemID = 167051,
        Instance = "Terrace of Endless Spring",
        InstanceID = 320,
        MapID = 996,
        AreaPoiID = 6509,
        EncounterID = 742,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 433, x = 0.484, y = 0.614 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Baoh-Xi",
        PetItemID = 167050,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        AreaPoiID = 6511,
        EncounterID = 677,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 379, x = 0.596, y = 0.392 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Blackfuse Bombling",
        PetItemID = 104158,
        Instance = "Siege of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 865,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Blazehound",
        PetItemID = 152975,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 195,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Blightbreath",
        PetItemID = 142096,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1628,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Blood Boil",
        PetItemID = 142095,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1631,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Boneshard",
        PetItemID = 142094,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1624,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Bop",
        PetItemID = 223155,
        Instance = "Cinderbrew Meadery",
        InstanceID = 1272,
        MapID = 2661,
        AreaPoiID = 7857,
        EncounterID = 2589,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = "Also obtainable in a Follower dungeon".."\n\n".."This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Goldie Baronbottom", DARKYELLOW_FONT_COLOR),
        Waypoint = { mapID = 2248, x = 0.766, y = 0.438 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Bound Stream",
        PetItemID = 152970,
        Instance = "Bastion of Twilight",
        InstanceID = 72,
        MapID = 671,
        AreaPoiID = 6516,
        EncounterID = 158,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Notes = "Instance entrance is at the very top of the tower where the waypoint is located",
        Waypoint = { mapID = 241, x = 0.348, y = 0.772 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Cinderweb Recluse",
        PetItemID = 152976,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 192,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Chaos Pup",
        PetItemID = 122114,
        Instance = "Sunwell Plateau",
        InstanceID = 752,
        MapID = 580,
        AreaPoiID = 6533,
        EncounterID = 1595,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 122, x = 0.443, y = 0.456 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Child of Pa'ku",
        PetItemID = 165846,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        -- AreaPoiID = 6012 -- Horde
        -- AreaPoiID = 6013 -- Alliance
        EncounterID = 2330,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        -- Waypoint = { mapID = 862, x = 0.543, y = 0.299 } -- Zuldazar
        -- Waypoint = { mapID = 1161, x = 0.704, y = 0.356 } -- Boralus,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Chrominius",
        PetItemID = 93038,
        Instance = "Blackwing Lair",
        InstanceID = 742,
        MapID = 469,
        AreaPoiID = 6536,
        EncounterID = 1535,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 33, x = 0.64, y = 0.715 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Coilfang Stalker",
        PetItemID = 97554,
        Instance = "Serpentshrine Cavern",
        InstanceID = 748,
        MapID = 548,
        AreaPoiID = 6530,
        EncounterID = 1572,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 102, x = 0.519, y = 0.335 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Comet",
        PetItemID = 167049,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        AreaPoiID = 6511,
        EncounterID = 726,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 379, x = 0.596, y = 0.392 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Corefire Imp",
        PetItemID = 93034,
        Instance = "Molten Core",
        InstanceID = 741,
        MapID = 409,
        AreaPoiID = 6535,
        EncounterID = 1520,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 35, x = 0.538, y = 0.813 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Corrupted Blood",
        PetItemID = 152980,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 333,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Corrupted Nest Guardian",
        PetItemID = 127749,
        Instance = "Hellfire Citadel",
        InstanceID = 669,
        MapID = 1448,
        AreaPoiID = 6504,
        EncounterID = 1433,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 534, x = 0.47, y = 0.526 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Craboom",
        PetItemID = 236768,
        Instance = "Operation: Floodgate",
        InstanceID = 1298,
        MapID = 2773,
        AreaPoiID = 8162,
        EncounterID = 2650,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = "Also obtainable in a Follower dungeon",
        Waypoint = { mapID = 2214, x = 0.421, y = 0.395 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Creeping Tentacle",
        PetItemID = 142093,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1649,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Death Talon Whelpguard",
        PetItemID = 93037,
        Instance = "Blackwing Lair",
        InstanceID = 742,
        MapID = 469,
        AreaPoiID = 6536,
        EncounterID = 1531,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 33, x = 0.64, y = 0.715 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Deviate Hatchling",
        PetItemID = 48114,
        Instance = "Wailing Caverns",
        InstanceID = 240,
        MapID = 43,
        AreaPoiID = 6720,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Waypoint = { mapID = 240, x = 0.405, y = 0.687 },
        Notes = "Dropped by "..WrapTextInColor("Deviate Guardians", DARKYELLOW_FONT_COLOR).." and "..WrapTextInColor("Deviate Ravagers", DARKYELLOW_FONT_COLOR).." throughout the dungeon",
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Discarded Experiment",
        PetItemID = 152967,
        Instance = "Blackwing Descent",
        InstanceID = 73,
        MapID = 669,
        AreaPoiID = 6517,
        EncounterID = 173,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 36, x = 0.231, y = 0.264 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Drafty",
        PetItemID = 152974,
        Instance = "Throne of the Four Winds",
        InstanceID = 74,
        MapID = 754,
        AreaPoiID = 6515,
        EncounterID = 154,
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
        Name = "Dreadmaw",
        PetItemID = 142083,
        Instance = "Trial of the Crusader",
        InstanceID = 757,
        MapID = 649,
        AreaPoiID = 6522,
        EncounterID = 1618,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.752, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Droplet of Y'Shaarj",
        PetItemID = 104162,
        Instance = "Siege of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 867,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Drudge Ghoul",
        PetItemID = 142098,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Eye of Allseeing",
        PetItemID = 186554,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2442,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Eye of Corruption",
        PetItemID = 174452,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2375,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Eye of Extermination",
        PetItemID = 186555,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2442,
        DifficultyIDs = { RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Faceless Mindlasher",
        PetItemID = 152979,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 325,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Faceless Minion",
        PetItemID = 152972,
        Instance = "Bastion of Twilight",
        InstanceID = 72,
        MapID = 671,
        AreaPoiID = 6516,
        EncounterID = 167,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Notes = "Instance entrance is at the very top of the tower where the waypoint is located",
        Waypoint = { mapID = 241, x = 0.348, y = 0.772 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Fiendish Imp",
        PetItemID = 97551,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1560,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Filthy Slime",
        PetItemID = 160704,
        Instance = "Tol Dagor",
        InstanceID = 1002,
        MapID = 1771,
        AreaPoiID = 5831,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Notes = "Dropped by the Rare Elite "..WrapTextInColor("Gol'than the Malodorous", DARKYELLOW_FONT_COLOR).."\n\n".."Guides for how to spawn this mob can be found online",
        Waypoint = { mapID = 864, x = 0.519, y = 0.255 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Fragment of Anger",
        PetItemID = 122107,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1587,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Fragment of Anger",
        PetItemID = 122109,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1587,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Fragment of Suffering",
        PetItemID = 122108,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1587,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Fungal Abomination",
        PetItemID = 93032,
        Instance = "Naxxramas",
        InstanceID = 754,
        MapID = 533,
        AreaPoiID = 6524,
        EncounterID = 1606,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 115, x = 0.873, y = 0.51 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "G0-R41-0N Ultratonk",
        PetItemID = 142092,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1647,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Giant Bone Spider",
        PetItemID = 93030,
        Instance = "Naxxramas",
        InstanceID = 754,
        MapID = 533,
        AreaPoiID = 6524,
        EncounterID = 1603,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 115, x = 0.873, y = 0.51 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Gizmo",
        PetItemID = 186534,
        Instance = "Tazavesh, the Veiled Market",
        InstanceID = 1194,
        MapID = 2441,
        AreaPoiID = 2395,
        EncounterID = 2436,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        -- Commenting the below note and waypoint due to alternate entrace available in K'aresh. Unsure if this will be a permanent entrance or not as of now
        -- Notes = L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"],
        -- Waypoint = { mapID = 1671, x = 0.602, y = 0.676 },
        Waypoint = { mapID = 2371, x = 0.636, y = 0.702 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Golden Snorf",
        PetItemID = 169378,
        Instance = "Operation: Mechagon (Workshop)",
        InstanceID = 1178,
        MapID = 2097,
        AreaPoiID = 6129,
        EncounterID = 2331,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1462, x = 0.729, y = 0.365 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Gooey Sha-ling",
        PetItemID = 104163,
        Instance = "Siege of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 867,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Green Wing Macaw",
        PetItemID = 8492,
        Instance = "The Deadmines",
        InstanceID = 63,
        MapID = 36,
        AreaPoiID = 6500,
        DifficultyIDs = { DungeonDifficulty.Normal, DungeonDifficulty.Heroic },
        Notes = "Dropped by "..WrapTextInColor("Defias Pirates", DARKYELLOW_FONT_COLOR).." on the boat towards the end of the dungeon",
        Waypoint = { mapID = 52, x = 0.426, y = 0.716 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Grotesque",
        PetItemID = 122105,
        Instance = "The Battle for Mount Hyjal",
        InstanceID = 750,
        MapID = 534,
        AreaPoiID = 6513,
        EncounterID = 1580,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 75, x = 0.396, y = 0.17 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Harbinger of Flame",
        PetItemID = 93033,
        Instance = "Molten Core",
        InstanceID = 741,
        MapID = 409,
        AreaPoiID = 6535,
        EncounterID = 1525,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 35, x = 0.538, y = 0.813 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Hyjal Wisp",
        PetItemID = 122112,
        Instance = "The Battle for Mount Hyjal",
        InstanceID = 750,
        MapID = 534,
        AreaPoiID = 6513,
        EncounterID = 1581,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 75, x = 0.396, y = 0.17 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Infernal Pyreclaw",
        PetItemID = 152978,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 197,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Ironbound Proto-Whelp",
        PetItemID = 142087,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1639,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Irongrasp",
        PetItemID = 186558,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2445,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Ji-Kun Hatchling",
        PetItemID = 94835,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 828,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Kor'thik Swarmling",
        PetItemID = 167058,
        Instance = "Heart of Fear",
        InstanceID = 330,
        MapID = 1009,
        AreaPoiID = 6510,
        EncounterID = 745,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Kovok",
        PetItemID = 104165,
        Instance = "Siege of Orgimmar",
        InstanceID = 369,
        MapID = 1136,
        AreaPoiID = 6507,
        EncounterID = 853,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1530, x = 0.741, y = 0.401 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Lanticore Spawnling",
        PetItemID = 117528,
        Instance = "Upper Blackrock Spire",
        InstanceID = 559,
        MapID = 1358,
        AreaPoiID = 6660,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = "Dropped by "..WrapTextInColor("The Lanticore", DARKYELLOW_FONT_COLOR)..", who has a random chance to spawn after killing "..WrapTextInColor("Orebender Gor'ashan", DARKYELLOW_FONT_COLOR),
        Waypoint = { mapID = 33, x = 0.790, y = 0.338 },
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Lesser Voidcaller",
        PetItemID = 97556,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        AreaPoiID = 6534,
        EncounterID = 1575,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 109, x = 0.736, y = 0.637 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Leviathan Hatchling",
        PetItemID = 122104,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1582,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Lightless Ambusher",
        PetItemID = 169358,
        Instance = "The Eternal Palace",
        InstanceID = 1179,
        MapID = 2164,
        -- AreaPoiID = 6510,
        EncounterID = 2354,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides", DARKYELLOW_FONT_COLOR),
        -- Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Lil' Bad Wolf",
        PetItemID = 97548,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1556,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Living Amber",
        PetItemID = 167055,
        Instance = "Heart of Fear",
        InstanceID = 330,
        MapID = 1009,
        AreaPoiID = 6510,
        EncounterID = 737,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Living Fluid",
        PetItemID = 97959,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 820,
        DifficultyIDs = { RaidDifficulty.LegacyLFR },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Living Sandling",
        PetItemID = 94125,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Notes = "Dropped by "..WrapTextInColor("Sand Elementals", DARKYELLOW_FONT_COLOR).." in Normal and Heroic, but can be looted from "..WrapTextInColor("Council of Elders", DARKYELLOW_FONT_COLOR).." in LFR",
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Magma Rageling",
        PetItemID = 142086,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1638,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Mawsworn Minion",
        PetItemID = 186550,
        Instance = "Sanctum of Domination",
        InstanceID = 1193,
        MapID = 2450,
        AreaPoiID = 6994,
        EncounterID = 2440,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 1543, x = 0.697, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Menagerie Custodian",
        PetItemID = 97549,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1557,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Microbot 8D",
        PetItemID = 169385,
        Instance = "Operation: Mechagon (Junkyard)",
        InstanceID = 1178,
        MapID = 2097,
        AreaPoiID = 6129,
        EncounterID = 2355,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1462, x = 0.729, y = 0.365 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Mindlost Bloodfrenzy",
        PetItemID = 169360,
        Instance = "The Eternal Palace",
        InstanceID = 1179,
        MapID = 2164,
        -- AreaPoiID = 6510,
        EncounterID = 2347,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides", DARKYELLOW_FONT_COLOR),
        -- Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Mini Mindslayer",
        PetItemID = 93041,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        EncounterID = 1543,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Mojo",
        PetItemID = 33993,
        Instance = "Zul'Aman",
        InstanceID = 77,
        MapID = 568,
        AreaPoiID = 6683,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = "Obtained by using an "..(select(2, C_Item.GetItemInfo(33865)) or WrapTextInColor("[Amani Hex Stick]", GREEN_FONT_COLOR)).." on "..WrapTextInColor("Forest Frogs", DARKYELLOW_FONT_COLOR).."\n\n".."Detailed guides for how to obtain this pet can be found online",
        Waypoint = { mapID = 95, x = 0.82, y = 0.643 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Muar",
        PetItemID = 174446,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2365,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Nameless Octopode",
        PetItemID = 169362,
        Instance = "The Eternal Palace",
        InstanceID = 1179,
        MapID = 2164,
        -- AreaPoiID = 6510,
        EncounterID = 2349,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides", DARKYELLOW_FONT_COLOR),
        -- Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Nerubian Swarmer",
        PetItemID = 142085,
        Instance = "Trial of the Crusader",
        InstanceID = 757,
        MapID = 649,
        AreaPoiID = 6522,
        EncounterID = 1623,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.752, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Netherspace Abyssal",
        PetItemID = 97550,
        Instance = "Karazhan",
        InstanceID = 745,
        MapID = 532,
        AreaPoiID = 6528,
        EncounterID = 1563,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        Waypoint = { mapID = 42, x = 0.47, y = 0.749 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Nightmare Whelpling",
        PetItemID = 136903,
        Instance = "The Emerald Nightmare",
        InstanceID = 768,
        MapID = 1520,
        AreaPoiID = 5095,
        EncounterID = 1704,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 641, x = 0.567, y = 0.375 },
        Notes = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Dragons of Nightmare", DARKYELLOW_FONT_COLOR),
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Phoenix Hatchling",
        PetItemID = 35504,
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
        Name = "Phoenix Hawk Hatchling",
        PetItemID = 97557,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        AreaPoiID = 6534,
        EncounterID = 1573,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 109, x = 0.736, y = 0.637 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Pigmy Direhorn",
        PetItemID = 94574,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 819,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Pocket Reaver",
        PetItemID = 97555,
        Instance = "The Eye",
        InstanceID = 749,
        MapID = 550,
        AreaPoiID = 6534,
        EncounterID = 1574,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 109, x = 0.736, y = 0.637 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Ra'kim",
        PetItemID = 174449,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2372,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Rattlejar",
        PetItemID = 152968,
        Instance = "Blackwing Descent",
        InstanceID = 73,
        MapID = 669,
        AreaPoiID = 6517,
        EncounterID = 174,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 36, x = 0.231, y = 0.264 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Ravenous Prideling",
        PetItemID = 167056,
        Instance = "Heart of Fear",
        InstanceID = 330,
        MapID = 1009,
        AreaPoiID = 6510,
        EncounterID = 743,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Raw Emotion",
        PetItemID = 180591,
        Instance = "Sanguine Depths",
        InstanceID = 1189,
        MapID = 2284,
        AreaPoiID = 6589,
        EncounterID = 2421,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1525, x = 0.511, y = 0.301 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Runeforged Servitor",
        PetItemID = 142088,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1641,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Sanctum Cub",
        PetItemID = 142089,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1643,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Sister of Temptation",
        PetItemID = 122110,
        Instance = "Black Temple",
        InstanceID = 751,
        MapID = 564,
        AreaPoiID = 6532,
        EncounterID = 1588,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 104, x = 0.711, y = 0.463 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Sludge Feeler",
        PetItemID = 181271,
        Instance = "Plaguefall",
        InstanceID = 1183,
        MapID = 2289,
        AreaPoiID = 6585,
        EncounterID = 2404,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1536, x = 0.594, y = 0.65 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Smolderweb Hatchling",
        PetItemID = 68673,
        Instance = "Lower Blackrock Spire",
        InstanceID = 229,
        MapID = 229,
        AreaPoiID = 6661,
        EncounterID = 391,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Waypoint = { mapID = 33, x = 0.805, y = 0.419 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Snaplasher",
        PetItemID = 142091,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1646,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Snobold Runt",
        PetItemID = 142084,
        Instance = "Trial of the Crusader",
        InstanceID = 757,
        MapID = 649,
        AreaPoiID = 6522,
        EncounterID = 1618,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.752, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Son of Animus",
        PetItemID = 94152,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 824,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Soulbroken Whelpling",
        PetItemID = 142097,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Spawn of Garalon",
        PetItemID = 167054,
        Instance = "Heart of Fear",
        InstanceID = 330,
        MapID = 1009,
        AreaPoiID = 6510,
        EncounterID = 713,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Spawn of Krag'wa",
        PetItemID = 165848,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        -- AreaPoiID = 6012 -- Horde
        -- AreaPoiID = 6013 -- Alliance
        EncounterID = 2330,
        DifficultyIDs = { RaidDifficulty.Mythic },
        -- Waypoint = { mapID = 862, x = 0.543, y = 0.299 } -- Zuldazar
        -- Waypoint = { mapID = 1161, x = 0.704, y = 0.356 } -- Boralus,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Spawn of Merektha",
        PetItemID = 160702,
        Instance = "Temple of Sethraliss",
        InstanceID = 1030,
        MapID = 1877,
        AreaPoiID = 5840,
        EncounterID = 2143,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Notes = "This pet takes 3 days to hatch after looting "..(select(2, C_Item.GetItemInfo(160832)) or WrapTextInColor("[Viable Cobra Egg]", RARE_BLUE_COLOR)),
        Waypoint = { mapID = 864, x = 0.519, y = 0.255 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Spinemaw Gormling",
        PetItemID = 183623,
        Instance = "Mists of Tirna Scithe",
        InstanceID = 1184,
        MapID = 2290,
        AreaPoiID = 6586,
        EncounterID = 2405,
        DifficultyIDs = { DungeonDifficulty.Mythic },
        Waypoint = { mapID = 1565, x = 0.355, y = 0.541 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Spirit of the Spring",
        PetItemID = 167052,
        Instance = "Terrace of Endless Spring",
        InstanceID = 320,
        MapID = 996,
        AreaPoiID = 6509,
        EncounterID = 729,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 433, x = 0.484, y = 0.614 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Stinkrot",
        PetItemID = 122111,
        Instance = "The Battle for Mount Hyjal",
        InstanceID = 750,
        MapID = 534,
        AreaPoiID = 6513,
        EncounterID = 1578,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 75, x = 0.396, y = 0.17 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Stitched Pup",
        PetItemID = 93029,
        Instance = "Naxxramas",
        InstanceID = 754,
        MapID = 533,
        AreaPoiID = 6524,
        EncounterID = 1612,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 115, x = 0.873, y = 0.51 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Stoneclaw",
        PetItemID = 167047,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        AreaPoiID = 6511,
        EncounterID = 679,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 379, x = 0.596, y = 0.392 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Sunblade Micro-Defender",
        PetItemID = 122113,
        Instance = "Sunwell Plateau",
        InstanceID = 752,
        MapID = 580,
        AreaPoiID = 6533,
        EncounterID = 1592,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 122, x = 0.443, y = 0.456 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Surger",
        PetItemID = 152977,
        Instance = "Firelands",
        InstanceID = 78,
        MapID = 720,
        AreaPoiID = 6514,
        EncounterID = 196,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 198, x = 0.468, y = 0.784 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Tainted Waveling",
        PetItemID = 97553,
        Instance = "Serpentshrine Cavern",
        InstanceID = 748,
        MapID = 548,
        AreaPoiID = 6530,
        EncounterID = 1567,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 102, x = 0.519, y = 0.335 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Thunder Lizard Runt",
        PetItemID = 165847,
        Instance = "Battle of Dazar'alor",
        InstanceID = 1176,
        MapID = 2070,
        -- AreaPoiID = 6012 -- Horde
        -- AreaPoiID = 6013 -- Alliance
        EncounterID = 2330,
        DifficultyIDs = { RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        -- Waypoint = { mapID = 862, x = 0.543, y = 0.299 } -- Zuldazar
        -- Waypoint = { mapID = 1161, x = 0.704, y = 0.356 } -- Boralus,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Tideskipper",
        PetItemID = 97552,
        Instance = "Serpentshrine Cavern",
        InstanceID = 748,
        MapID = 548,
        AreaPoiID = 6530,
        EncounterID = 1571,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 102, x = 0.519, y = 0.335 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Tinytron",
        PetItemID = 152966,
        Instance = "Blackwing Descent",
        InstanceID = 73,
        MapID = 669,
        AreaPoiID = 6517,
        EncounterID = 169,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 36, x = 0.231, y = 0.264 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Twilight Clutch-Sister",
        PetItemID = 152969,
        Instance = "Bastion of Twilight",
        InstanceID = 72,
        MapID = 671,
        AreaPoiID = 6516,
        EncounterID = 157,
        DifficultyIDs = { RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Notes = "Instance entrance is at the very top of the tower where the waypoint is located",
        Waypoint = { mapID = 241, x = 0.348, y = 0.772 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Unstable Tendril",
        PetItemID = 152981,
        Instance = "Dragon Soul",
        InstanceID = 187,
        MapID = 967,
        AreaPoiID = 6512,
        EncounterID = 318,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Waypoint = { mapID = 71, x = 0.647, y = 0.513 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Untamed Hatchling",
        PetItemID = 93036,
        Instance = "Blackwing Lair",
        InstanceID = 742,
        MapID = 469,
        AreaPoiID = 6536,
        EncounterID = 1529,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 33, x = 0.64, y = 0.715 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Viscidus Globule",
        PetItemID = 93039,
        Instance = "Temple of Ahn'Qiraj",
        InstanceID = 744,
        MapID = 531,
        AreaPoiID = 6537,
        EncounterID = 1548,
        DifficultyIDs = { RaidDifficulty.Legacy40 },
        Waypoint = { mapID = 327, x = 0.468, y = 0.075 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Viscous Horror",
        PetItemID = 97960,
        Instance = "Throne of Thunder",
        InstanceID = 362,
        MapID = 1098,
        AreaPoiID = 6508,
        EncounterID = 820,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Void-Scarred Anubisath",
        PetItemID = 174447,
        Instance = "Ny'alotha, the Waking City",
        InstanceID = 1180,
        MapID = 2217,
        -- AreaPoiID = 6539, -- Or 6540 (Uldum)
        EncounterID = 2364,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = L["Entrance can be in either Uldum or Vale of Eternal Blossoms"],
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Wayward Spirit",
        PetItemID = 167048,
        Instance = "Mogu'shan Vaults",
        InstanceID = 317,
        MapID = 1008,
        AreaPoiID = 6511,
        EncounterID = 682,
        DifficultyIDs = { RaidDifficulty.LegacyLFR, RaidDifficulty.Legacy10 },
        SharedDifficulties = {
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy10H] = RaidDifficulty.Legacy10,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10
        },
        Waypoint = { mapID = 379, x = 0.596, y = 0.392 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Wicked Soul",
        PetItemID = 142099,
        Instance = "Icecrown Citadel",
        InstanceID = 758,
        MapID = 631,
        AreaPoiID = 6521,
        EncounterID = 1636,
        DifficultyIDs = { RaidDifficulty.Legacy10H },
        SharedDifficulties = {
            [RaidDifficulty.Legacy10] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25] = RaidDifficulty.Legacy10H,
            [RaidDifficulty.Legacy25H] = RaidDifficulty.Legacy10H
        },
        Waypoint = { mapID = 118, x = 0.538, y = 0.871 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Will of Remornia",
        PetItemID = 183395,
        Instance = "Castle Nathria",
        InstanceID = 1190,
        MapID = 2296,
        AreaPoiID = 6590,
        EncounterID = 2424,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Sire Denathrius", DARKYELLOW_FONT_COLOR),
        Waypoint = { mapID = 1525, x = 0.464, y = 0.415 },
        SearchTags = AddOn.ExpansionTags.Shadowlands
    },
    {
        Name = "Winter Rageling",
        PetItemID = 142090,
        Instance = "Ulduar",
        InstanceID = 759,
        MapID = 603,
        AreaPoiID = 6523,
        EncounterID = 1644,
        DifficultyIDs = { RaidDifficulty.Normal },
        Notes = L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 120, x = 0.416, y = 0.178 },
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Worg Pup",
        PetItemID = 12264,
        Instance = "Lower Blackrock Spire",
        InstanceID = 229,
        MapID = 229,
        AreaPoiID = 6661,
        EncounterID = 393,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Waypoint = { mapID = 33, x = 0.805, y = 0.419 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Wretched Servant",
        PetItemID = 122115,
        Instance = "Sunwell Plateau",
        InstanceID = 752,
        MapID = 580,
        AreaPoiID = 6533,
        EncounterID = 1594,
        DifficultyIDs = { RaidDifficulty.Legacy25 },
        Waypoint = { mapID = 122, x = 0.443, y = 0.456 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Zanj'ir Poker",
        PetItemID = 169348,
        Instance = "The Eternal Palace",
        InstanceID = 1179,
        MapID = 2164,
        -- AreaPoiID = 6510,
        EncounterID = 2361,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Notes = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides", DARKYELLOW_FONT_COLOR),
        -- Waypoint = { mapID = 422, x = 0.389, y = 0.35 },
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Zephyrian Prince",
        PetItemID = 152973,
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
}