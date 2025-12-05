local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local DungeonDifficulty = AddOn.DungeonDifficulty
local RaidDifficulty = AddOn.RaidDifficulty

---@type HousingItem[]
AddOn.HousingItems = {
    {
        Name = "Dark Iron Chandelier",
        DecorItemID = 246429,
        Instance = "Blackrock Depths",
        InstanceID = 228,
        MapID = 230,
        AreaPoiID = 6499,
        EncounterID = 387,
        DifficultyIDs = { DungeonDifficulty.Normal },
        Waypoint = { mapID = 35, x = 0.538, y = 0.813 }, -- Molten Core Waypoint
        Notes = L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"],
        SearchTags = AddOn.ExpansionTags.Classic
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
}