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
        Name = "Sandy Shalewing",
        ItemID = 205208,
        Type = "Mount",
        Expansion = "Classic",
        Cost = 5000,
        Notes = "Can be purchased from any Timewalking vendor",
        SearchTags = combineLists(AddOn.ExpansionTags.Classic,
            AddOn.ExpansionTags.TheBurningCrusade,
            AddOn.ExpansionTags.WrathOfTheLichKing,
            AddOn.ExpansionTags.MistsOfPandaria,
            AddOn.ExpansionTags.WarlordsOfDraenor,
            AddOn.ExpansionTags.Legion,
            AddOn.ExpansionTags.BattleForAzeroth)
    },
    {
        Name = "Frayfeather Hippogryph",
        ItemID = 224398,
        Type = "Mount",
        VendorName = "Bobbadormu",
        VendorNpcID = 234555,
        Expansion = "Classic",
        Cost = 5000,
        -- AreaPoiID = 8190 (Alliance) or 8191 (Horde),
        SearchTags = AddOn.ExpansionTags.Classic
    }
}

-- C_SuperTrack.SetSuperTrackedMapPin(0, 8190)
