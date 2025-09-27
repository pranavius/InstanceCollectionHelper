local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class TimewalkingItem
---@field Name string Name of the collectible (for information only, displayed name is in user's locale)
---@field ItemID number ID number for item that adds the collectible to the collection
---@field Type "Mount"|"Pet"|"Toy" The type of collectible that the item provides (one of "Mount", "Pet", "Toy")
---@field VendorName? string Name of the vendor that sells this collectible (for information only, displayed name is in user's locale)
---@field VendorNpcID? number NPC ID number of the vendor that sells this collectible
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
        Name = "Amani Hunting Bear",
        ItemID = 224399,
        Type = "Mount",
        VendorName = "Cupri",
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 5000,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Chuck",
        ItemID = 35350,
        Type = "Pet",
        VendorName = "Cupri",
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Craggles",
        ItemID = 224410,
        Type = "Pet",
        VendorName = "Bobadormu",
        VendorNpcID = 234555,
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
        VendorNpcID = 98685,
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
        VendorNpcID = 98690,
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
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 500,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Fractured Necrolyte Skull",
        ItemID = 151016,
        Type = "Toy",
        VendorName = "Cupri",
        VendorNpcID = 98685,
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
        VendorNpcID = 234555,
        Expansion = "Classic",
        Cost = 5000,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Ironbound Wraithcharger",
        ItemID = 129922,
        Type = "Mount",
        VendorName = "Auzin",
        VendorNpcID = 98690,
        Expansion = "Wrath of the Lich King",
        Cost = 5000,
        AreaPoiID = 6982,
        SearchTags = AddOn.ExpansionTags.WrathOfTheLichKing
    },
    {
        Name = "Karazhan Syphoner",
        ItemID = 231365,
        Type = "Pet",
        VendorName = "Cupri",
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 2200,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Mark of the Ashtongue",
        ItemID = 129926,
        Type = "Toy",
        VendorName = "Cupri",
        VendorNpcID = 98685,
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
        VendorNpcID = 234555,
        Expansion = "Classic",
        Cost = 2200,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    },
    {
        Name = "Muckbreath",
        ItemID = 33818,
        Type = "Pet",
        VendorName = "Cupri",
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Practice Ravager",
        ItemID = 224192,
        Type = "Toy",
        VendorName = "Bobadormu",
        VendorNpcID = 234555,
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
        Name = "Snarly",
        ItemID = 35349,
        Type = "Pet",
        VendorName = "Cupri",
        VendorNpcID = 98685,
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
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 25,
        AreaPoiID = 6981,
        Notes = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures"),
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    },
    {
        Name = "Verdant Throwing Sphere",
        ItemID = 151184,
        Type = "Toy",
        VendorName = "Cupri",
        VendorNpcID = 98685,
        Expansion = "The Burning Crusade",
        Cost = 500,
        AreaPoiID = 6981,
        SearchTags = AddOn.ExpansionTags.TheBurningCrusade
    }
}

-- C_SuperTrack.SetSuperTrackedMapPin(0, 8190)
