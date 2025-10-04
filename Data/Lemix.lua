local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

---@class LemixResource
---@field ItemID integer
---@field Amount integer

---@class LemixItem
---@field Name string
---@field ItemID integer
---@field Type "Mount"|"Pet"|"Toy"|"Cosmetic"
---@field InstanceID? integer
---@field EncounterID? integer
---@field VendorName string
---@field Cost integer
---@field AdditionalResources? LemixResource[]
---@field AreaPoiID? integer
---@field Notes? string
---@field SearchTags string[]
---@field IsLemixExclusive boolean

---@type LemixItem[]
AddOn.LemixItems = {
    {
        Name = "Archmage's Felscorned Disc",
        ItemID = 253026,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61089)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Mage")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Farseer's Felscorned Tempest",
        ItemID = 253031,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42686)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Shaman")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Grandmaster's Companion",
        ItemID = 253027,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61085)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Monk")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Highlord's Charger",
        ItemID = 253028,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42504)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Paladin")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Netherlord's Dreadsteed",
        ItemID = 253032,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61090)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Warlock")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Vilebrood Vanquisher",
        ItemID = 252954,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42685)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Death Knight")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned War Wyrm",
        ItemID = 253033,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42684)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Warrior")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Felscorned Wolfhawk",
        ItemID = 253025,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement "..(select(2, GetAchievementInfo(42687)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Hunter")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Hammer of Vigilance",
        ItemID = 242368,
        Type = "Cosmetic",
        Instance = "Tomb of Sargeras",
        InstanceID = 875,
        EncounterID = 1897,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResources = { { ItemID = 253305, Amount = 20 } },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253305)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Felwarped Slab]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1897)) or "Maiden of Vigilance")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "High Priest's Felscorned Seeker",
        ItemID = 253029,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61088)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Priest")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Scythe of the Unmaker",
        ItemID = 253273,
        Type = "Cosmetic",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 2031,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResources = { { ItemID = 253304, Amount = 20 } },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253304)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Cosmic Soulsliver]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(2031)) or "Argus the Unmaker")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "Scornwing Flight Form",
        ItemID = 253024,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61086)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Druid")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Shadowblade's Felscorned Omen",
        ItemID = 253030,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61084)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Rogue")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Slayer's Felscorned Shrieker",
        ItemID = 253013,
        Type = "Mount",
        VendorName = "Grandmaster Jakkus",
        Cost = 20000,
        AreaPoiID = nil,
        Notes = "Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement "..(select(2, GetAchievementInfo(61087)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Timerunner: Demon Hunter")),
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = true
    },
    {
        Name = "Taeshalach",
        ItemID = 255006,
        Type = "Cosmetic",
        Instance = "Antorus, the Burning Throne",
        InstanceID = 946,
        EncounterID = 1984,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResources = { { ItemID = 253306, Amount = 20 } },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(253306)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Everflame of Hatred]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1984)) or "Aggramar")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    },
    {
        Name = "The First Satyr's Spaulders",
        ItemID = 242368,
        Type = "Cosmetic",
        Instance = "The Emerald Nightmare",
        InstanceID = 768,
        EncounterID = 1726,
        VendorName = "Pythagorus",
        Cost = 30000,
        AdditionalResources = { { ItemID = 242370, Amount = 20 } },
        AreaPoiID = nil,
        Notes = (select(2, C_Item.GetItemInfo(242370)) or WHITE_FONT_COLOR:WrapTextInColorCode("[Horns of the First Satyr]")).." are obtained from defeating "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(1, EJ_GetEncounterInfo(1726)) or "Xavius")..".".."\n\n".."The number dropped increases based on raid difficulty.",
        SearchTags = AddOn.ExpansionTags.Legion,
        IsLemixExclusive = false
    }
}