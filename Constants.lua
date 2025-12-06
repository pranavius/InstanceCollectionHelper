local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

AddOn.Title = "Instance Collection Helper"

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

---@class ExpansionTags
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
    Midnight = { "midnight", "mn" },
}

---@enum LemixPhase
AddOn.LemixPhases = {
    Phase1 = L["Phase 1: Skies of Fire"],
    Phase2 = L["Phase 2: Rise of the Nightfallen"],
    Phase3 = L["Phase 3: Legionfall"],
    Phase4 = L["Phase 4: Argus Eternal"],
    Phase5 = L["Phase 5: Infinite Echoes"]
}

AddOn.InstanceToDamIDMap = {
    [744] = 320, -- AQ40
    [1292] = 318, -- Strat Undead
    -- missing entry for old Scholomance
    [236] = 317, -- Strat Living
    [231] = 226, -- Gnomeregan
    [240] = 279, -- Wailing Caverns
    [63] = 291, -- Deadmines
    [229] = 252, -- LBRS
    [228] = 242, -- BRD
    [64] = 310, -- SFK
    [741] = 232, -- MC
    [742] = 287, -- BWL,
    [749] = 334, -- Tempest Keep
    [745] = 350, -- Kara
    [252] = 258, -- Sethekk Halls
    [249] = 349, -- Magister's Terrace (TBC)
    [251] = 274, -- Old Hillsbrad Foothills
    [751] = 340, -- Black Temple
    [752] = 335, -- Sunwell Plateau
    [748] = 332, -- Serpentshrine Cavern
    [750] = 329, -- Battle for Mount Hyjal
    [756] = 141, -- Eye of Eternity
    [755] = 155, -- Obsidian Sanctum
    [286] = 136, -- Utgarde Pinnacle
    [279] = 131, -- Culling of Stratholme
    [753] = 156, -- Vault of Archavon
    [758] = 186, -- ICC
    [759] = 147, -- Ulduar
    [760] = 248, -- Onyxia's Lair
    [757] = 172, -- Trial of the Crusader
    [754] = 163, -- Naxx
    [77] = 333, -- ZA
    [76] = 337, -- ZG
    [187] = 409, -- Dragon Soul
    [68] = 325, -- VP
    [74] = 328, -- TotFW
    -- [78] = 367, -- Firelands
    [67] = 324, -- Stonecore
    [72] = 294, -- Bastion of Twilight
    [73] = 285, -- BWD
    [317] = 471, -- MSV
    [362] = 508, --TOT
    [246] = 476, -- Scholomance
    [330] = 474, -- Heart of Fear
    [320] = 456, -- Terrace of Endless Spring
    [313] = 429, -- Temple of the Jade Serpent
    -- From WoD onwards only dungeons are missing a DungeonAreaMapID mapping
    [559] = 617, -- UBRS
    [547] = 593, -- Auchindoun
    [558] = 595, -- Iron Docks
    [860] = 812, -- Return to Kara
    [945] = 903, -- Seat of the Triumvirate
    [762] = 733, -- DHT
    [800] = 761, -- CoS
    [767] = 731, -- NL
    [1178] = 1490, -- Mechagon
    [1001] = 936, -- Freehold
    [1041] = 1004, -- Kings Rest
    [1022] = 1041, -- Underrot
    [1002] = 974, -- Tol Dagor
    [1030] = 1038, -- Temple of Sethraliss
    [1036] = 1039, -- Shrine of the Storm,
    [1194] = 1989, -- Tazavesh
    [1182] = 1666, -- Necrotic Wake
    [1189] = 1675, -- Sanguine Depths
    [1183] = 1674, -- Plaguefall
    [1184] = 1669, --MoTS
    [1199] = 2080, -- Neltharus
    [1201] = 2097, -- Algeth'ar Academy
    [1202] = 2095, -- RLP
    [1269] = 2341, -- Stonevault
    [1210] = 2303, -- DFC
    [1272] = 2335, -- Cinderbrew Meadery
    [1298] = 2387, -- Floodgate
    [1267] = 2308, -- PSF
}
