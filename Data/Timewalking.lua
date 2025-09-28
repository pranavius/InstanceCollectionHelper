local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class TimewalkingItem
---@field Name string Name of the collectible (for information only, displayed name is in user's locale)
---@field ItemID number ID number for item that adds the collectible to the collection
---@field Type "Mount"|"Pet"|"Toy" The type of collectible that the item provides (one of "Mount", "Pet", "Toy")
---@field VendorName? string Name of the vendor that sells this collectible (for information only, displayed name is in user's locale)
---@field Expansion string Expansion for which the timewalking vendor that the collectible can be purchased from will be available
---@field Cost number Number of Timewarped badges required to purchase the item
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the vendor location on the map. Used to place Blizzard map pins for navigation guidance
---@field Notes? string Additional notes about the collectible
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available. Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a collectible. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

local function combineLists(...)
    local argTable = { ... }
    local result = {}
    for _, tbl in ipairs(argTable) do
        for _, v in ipairs(tbl) do
            tinsert(result, v)
        end
    end

    return result
end

---@type TimewalkingItem[]
AddOn.TimewalkingItems = {
    {
        Name = "Adopted Puppy Crate",
        ItemID = 144072,
        Type = "Toy",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 1000,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Amani Hunting Bear",
        ItemID = 224399,
        Type = "Mount",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 5000,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Apexis Focusing Shard",
        ItemID = 168012,
        Type = "Toy",
        Expansion = "Warlords of Draenor",
        Cost = 500,
        -- AreaPoiID = 6986 (Alliance) or 6985 (Horde),
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Banner of the Burning Blade",
        ItemID = 168014,
        Type = "Toy",
        Expansion = "Warlords of Draenor",
        Cost = 750,
        -- AreaPoiID = 6986 (Alliance) or 6985 (Horde),
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Beastlord's Irontusk",
        ItemID = 167894,
        Type = "Mount",
        Expansion = "Warlords of Draenor",
        Cost = 5000,
        -- AreaPoiID = 6986 (Alliance) or 6985 (Horde),
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Beastlord's Warwolf",
        ItemID = 167895,
        Type = "Mount",
        Expansion = "Warlords of Draenor",
        Cost = 5000,
        -- AreaPoiID = 6986 (Alliance) or 6985 (Horde),
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Broodling of Sinestra",
        ItemID = 234730,
        Type = "Mount",
        VendorName = "Kiatke",
        Expansion = "Cataclysm",
        Cost = 5000,
        -- AreaPoiID = 6984 (Alliance) or 6983 (Horde),
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Chuck",
        ItemID = 35350,
        Type = "Pet",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Copper-Maned Quilen",
        ItemID = 234740,
        Type = "Mount",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 5000,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Craggles",
        ItemID = 224410,
        Type = "Pet",
        VendorName = "Bobadormu",
        Expansion = "Classic",
        Cost = 2200,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Eclipse Dragonhawk",
        ItemID = 129923,
        Type = "Mount",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 5000,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Enchanted Spellweave Carpet",
        ItemID = 231374,
        Type = "Mount",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 5000,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ever-Shifting Mirror",
        ItemID = 129929,
        Type = "Toy",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 500,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Flotsam Harvester",
        ItemID = 245543,
        Type = "Toy",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 2200,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Fractured Necrolyte Skull",
        ItemID = 151016,
        Type = "Toy",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 750,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Frayfeather Hippogryph",
        ItemID = 224398,
        Type = "Mount",
        VendorName = "Bobadormu",
        Expansion = "Classic",
        Cost = 5000,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Grizzlesnout's Fang",
        ItemID = 129965,
        Type = "Toy",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 750,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Gurboggle's Gleaming Bauble",
        ItemID = 133511,
        Type = "Toy",
        VendorName = "Kiatke",
        Expansion = "Cataclysm",
        Cost = 1500,
        -- AreaPoiID = 6984 (Alliance) or 6983 (Horde),
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Hourglass of Eternity",
        ItemID = 129952,
        Type = "Toy",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 2000,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Infinite Hatchling",
        ItemID = 143953,
        Type = "Pet",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 2200,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Ironbound Wraithcharger",
        ItemID = 129922,
        Type = "Mount",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 5000,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ivory Saveagemane",
        ItemID = 245694,
        Type = "Mount",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 5000,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Karazhan Syphoner",
        ItemID = 231365,
        Type = "Pet",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 2200,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Lightning-Blessed Spire",
        ItemID = 246227,
        Type = "Toy",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 1000,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Lil' Daz'ti",
        ItemID = 245574,
        Type = "Toy",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 2200,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Mark of the Ashtongue",
        ItemID = 129926,
        Type = "Toy",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 1250,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Misty",
        ItemID = 224406,
        Type = "Pet",
        VendorName = "Bobadormu",
        Expansion = "Classic",
        Cost = 2200,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Moonlit Nightsaber",
        ItemID = 245695,
        Type = "Mount",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 5000,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Muckbreath",
        ItemID = 33818,
        Type = "Pet",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Nightborne Guard's Vigilance",
        ItemID = 187591,
        Type = "Toy",
        VendorName = "Aridormi",
        Expansion = "Legion",
        Cost = 1500,
        AreaPoiID = 7018,
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Nightfall Skyreaver",
        ItemID = 234716,
        Type = "Mount",
        Expansion = "Warlords of Draenor",
        Cost = 5000,
        -- AreaPoiID = 6986 (Alliance) or 6985 (Horde),
        SearchTags = AddOn.ExpansionTags.WarlordsOfDraenor
    },
    {
        Name = "Paradox Spirit",
        ItemID = 143954,
        Type = "Pet",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 2200,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Portable Yak Wash",
        ItemID = 144393,
        Type = "Toy",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 500,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    },
    {
        Name = "Practice Ravager",
        ItemID = 224192,
        Type = "Toy",
        VendorName = "Bobadormu",
        Expansion = "Classic",
        Cost = 200,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Sandy Shalewing",
        ItemID = 205208,
        Type = "Mount",
        Expansion = "-",
        Cost = 5000,
        Notes = "Originally rewarded for completing the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Master of the Turbulent Timeways")..". Can now be purchased from any Timewalking vendor",
        SearchTags = combineLists(AddOn.ExpansionTags.Classic,
            AddOn.ExpansionTags.TheBurningCrusade,
            AddOn.ExpansionTags.WrathOfTheLichKing,
            AddOn.ExpansionTags.MistsOfPandaria,
            AddOn.ExpansionTags.WarlordsOfDraenor,
            AddOn.ExpansionTags.Legion,
            AddOn.ExpansionTags.BattleForAzeroth)
    },
    {
        Name = "Sea-Blessed Shrine",
        ItemID = 245942,
        Type = "Toy",
        VendorName = "Churbro",
        Expansion = "Battle for Azeroth",
        Cost = 1000,
        SearchTags = AddOn.ExpansionTags.BattleForAzeroth
    },
    {
        Name = "Snarly",
        ItemID = 35349,
        Type = "Pet",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Timely Buzbee",
        ItemID = 232624,
        Type = "Mount",
        Expansion = "-",
        Cost = 5000,
        Notes = "Originally rewarded for completing the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Master of the Turbulent Timeways II")..". Can now be purchased from any Timewalking vendor",
        SearchTags = combineLists(AddOn.ExpansionTags.Classic,
            AddOn.ExpansionTags.TheBurningCrusade,
            AddOn.ExpansionTags.WrathOfTheLichKing,
            AddOn.ExpansionTags.MistsOfPandaria,
            AddOn.ExpansionTags.WarlordsOfDraenor,
            AddOn.ExpansionTags.Legion,
            AddOn.ExpansionTags.BattleForAzeroth)
    },
    {
        Name = "Toothy",
        ItemID = 33816,
        Type = "Pet",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Tosslewrench's Mega-Accurate Simulation Viewfinder",
        ItemID = 133542,
        Type = "Toy",
        VendorName = "Kiatke",
        Expansion = "Cataclysm",
        Cost = 3000,
        -- AreaPoiID = 6984 (Alliance) or 6983 (Horde),
        SearchTags = AddOn.ExpansionTags.Cataclysm
    },
    {
        Name = "Specter",
        ItemID = 231356,
        Type = "Pet",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 2200,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Strand Crawler",
        ItemID = 44983,
        Type = "Pet",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 150,
        AreaPoiID = 6982,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Unusual Compass",
        ItemID = 45984,
        Type = "Toy",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 150,
        AreaPoiID = 6982,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Ur'zul Fleshripper",
        ItemID = 234721,
        Type = "Mount",
        VendorName = "Aridormi",
        Expansion = "Legion",
        Cost = 5000,
        AreaPoiID = 7018,
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Val'sharah Hippogryph",
        ItemID = 187595,
        Type = "Mount",
        VendorName = "Aridormi",
        Expansion = "Legion",
        Cost = 5000,
        AreaPoiID = 7018,
        SearchTags = AddOn.ExpansionTags.Legion
    },
    {
        Name = "Verdant Throwing Sphere",
        ItemID = 151184,
        Type = "Toy",
        VendorName = "Cupri",
        Expansion = "The Burning Crusade",
        Cost = 500,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Will of Northrend",
        ItemID = 129938,
        Type = "Toy",
        VendorName = "Auzin",
        Expansion = "Wrath of the Lich King",
        Cost = 1500,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Yu'lei, Daughter of Jade",
        ItemID = 87775,
        Type = "Mount",
        VendorName = "Mistweaver Xia",
        Expansion = "Mists of Pandaria",
        Cost = 5000,
        AreaPoiID = 6980,
        SearchTags = AddOn.ExpansionTags.MistsOfPandaria
    }
}
