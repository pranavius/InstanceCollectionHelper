local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@class Toy Toy data to process and display as a list item in the AddOn
---@field Name string Name of the toy (for information only, displayed name is in user's locale)
---@field ItemID number ID number for item that adds the toy to the collection
---@field Instance string Instance from which the toy can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance where the toy can be obtained
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance
---@field EncounterID? number ID number for the encounter from which the toy is available
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the toy can be obtained in
---@field Notes? string Additional notes about the toy or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a toy. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@type Toy[] List of toys available from instances
AddOn.Toys = {
    {
        Name = "Brazier of Madness",
        ItemID = 203757,
        Instance = "Zul'Gurub",
        InstanceID = 76,
        MapID = 859,
        AreaPoiID = 6682,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Requires completion of the achievement Relics of a Fallen Empire"],
        Waypoint = { mapID = 224, x = 0.64, y = 0.218 },
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Cosmic Hearthstone",
        ItemID = 246565,
        Instance = "Manaforge Omega",
        InstanceID = 1302,
        MapID = 2810,
        AreaPoiID = 8363,
        EncounterID = 2691,
        DifficultyIDs = { RaidDifficulty.LFR, RaidDifficulty.Normal, RaidDifficulty.Heroic, RaidDifficulty.Mythic },
        Waypoint = { mapID = 2371, x = 0.417, y = 0.215 },
        SearchTags = AddOn.ExpansionTags.TheWarWithin
    },
    {
        Name = "Don Carlos' Famous Hat",
        ItemID = 134019,
        Instance = "Old Hillsbrad Foothills",
        InstanceID = 251,
        MapID = 560,
        AreaPoiID = 6666,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"].."\n\n"..L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Explosive Hearthstone",
        ItemID = 236687,
        Instance = "Liberation of Undermine",
        InstanceID = 1296,
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
        ItemID = 208096,
        Instance = "Scholomance (Classic)",
        InstanceID = 246,
        MapID = 1007,
        AreaPoiID = 6726,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Fandral's Seed Pouch",
        ItemID = 122304,
        Instance = "Firelands",
        InstanceID = 78,
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
        ItemID = 98136,
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
        Notes = L["Drops from Gastropod mobs found between Megaera and Ji-Kun"],
        Waypoint = { mapID = 504, x = 0.638, y = 0.32 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Golden Hearthstone Card: Lord Jaraxxus",
        ItemID = 119211,
        Instance = "The Nighthold",
        InstanceID = 786,
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
        ItemID = 209035,
        Instance = "Amirdrassil, the Dream's Hope",
        InstanceID = 1207,
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
        ItemID = 88566,
        Instance = "Scholomance",
        InstanceID = 246,
        MapID = 1007,
        AreaPoiID = 6726,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"],
        Waypoint = { mapID = 22, x = 0.698, y = 0.736 },
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Orb of the Sin'dorei",
        ItemID = 35275,
        Instance = "Magister's Terrace",
        InstanceID = 249,
        MapID = 585,
        AreaPoiID = 6718,
        DifficultyIDs = { DungeonDifficulty.Heroic },
        Notes = L["Can drop from every boss in the dungeon"].."\n\n"..L["Also obtainable in Timewalking"],
        Waypoint = { mapID = 122, x = 0.61, y = 0.307 },
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Piccolo of the Flaming Fire",
        ItemID = 13379,
        Instance = "Stratholme - Main Gate",
        InstanceID = 236,
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
        ItemID = 143544,
        Instance = "The Nighthold",
        InstanceID = 786,
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
        ItemID = 153004,
        Instance = "Seat of the Triumvirate",
        InstanceID = 945,
        MapID = 1753,
        AreaPoiID = 5327,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Dropped by the Rare Elite Vixx the Collector"],
        Waypoint = { mapID = 882, x = 0.222, y = 0.566 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Vixx's Chest of Tricks",
        ItemID = 152982,
        Instance = "Seat of the Triumvirate",
        InstanceID = 945,
        MapID = 1753,
        AreaPoiID = 5327,
        DifficultyIDs = { DungeonDifficulty.Heroic, DungeonDifficulty.Mythic },
        Notes = L["Dropped by the Rare Elite Vixx the Collector"],
        Waypoint = { mapID = 882, x = 0.222, y = 0.566 },
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Vial of Green Goo",
        ItemID = 141331,
        Instance = "Gnomeregan",
        InstanceID = 231,
        MapID = 90,
        AreaPoiID = 6502,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Notes = L["Dropped by the hidden boss Endgineer Omegaplugg"].."\n\n"..L["It is highly recommended to attempt this encounter with a full party"],
        Waypoint = { mapID = 27, x = 0.314, y = 0.380 },
        SearchTags = AddOn.ExpansionTags.Classic
    }
}