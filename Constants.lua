local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@enum DungeonDifficulty
AddOn.DungeonDifficulty = {
    Normal = 1,
    Heroic = 2,
    Mythic = 23
}

---@enum RaidDifficulty
AddOn.RaidDifficulty = {
    LegacyLFR = 7,
    Legacy40 = 9,
    Legacy10 = 3,
    Legacy25 = 4,
    Legacy10H = 5,
    Legacy25H = 6,
    LFR = 17,
    Normal = 14,
    Heroic = 15,
    Mythic = 16
}

---A table containing entries for each WoW expansion.<br>
---Each table entry consists of a list of strings associated with that expansion to use when searching for a collectible by expansion
---@class ExpansionTags
---@field Classic string[]
---@field TheBurningCrusade string[]
---@field WrathOfTheLichKing string[]
---@field Cataclysm string[]
---@field MistsOfPandaria string[]
---@field WarlordsOfDraenor string[]
---@field Legion string[]
---@field BattleForAzeroth string[]
---@field Shadowlands string[]
---@field Dragonflight string[]
---@field TheWarWithin string[]
---@field Midnight string[]
AddOn.ExpansionTags = {
    Classic = { "classic", "vanilla" },
    TheBurningCrusade = { "the burning crusade", "burning crusade", "tbc", "bc" },
    WrathOfTheLichKing = { "wrath of the lich king", "wrath of lich king", "wrath", "wotlk" },
    Cataclysm = { "cataclysm", "cata" },
    MistsOfPandaria = { "mists of pandaria", "mists", "mop" },
    WarlordsOfDraenor = { "warlords of draenor", "warlords", "wod" },
    Legion = { "legion" },
    BattleForAzeroth = { "battle for azeroth", "bfa" },
    Shadowlands = { "shadowlands", "shadow lands", "sl" },
    Dragonflight = { "dragonflight", "dragon flight", "df" },
    TheWarWithin = { "the war within", "war within", "tww" },
    Midnight = { "midnight" },
}

---@class Waypoint Information for placing a Blizzard map pin at a location
---@field mapID number Identifier for the map on which to place the pin
---@field x number X coordinate of the location on the map
---@field y number Y coordinate of the location on the map
