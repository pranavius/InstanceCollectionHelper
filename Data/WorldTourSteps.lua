local name, AddOn = ...
---@class InstanceCollectionHelper
AddOn = LibStub("AceAddon-3.0"):GetAddon(name)
local L = LibStub("AceLocale-3.0"):GetLocale(name, true)

local playerFaction, localizedPlayerFaction = UnitFactionGroup("player")
local playerCapitalCity = playerFaction == "Alliance" and "Stormwind City" or "Orgrimmar"

---@type WorldTour
local WorldTour = {}
AddOn.WorldTour = WorldTour

local introText = [[Welcome to the ICH World Tour!

]]..HEIRLOOM_BLUE_COLOR:WrapTextInColorCode("Route data derived from the Mount Planner feature on Simple Armory (www.simplearmory.com)")..[[


This feature is still under development, so all text is only shown in English at this time. The route does not currently take into account spells, abilities, toys, or other items that can allow you to travel directly to a location on the route faster.

Feedback is always welcome and appreciated in order to improve the experience. ]]..WHITE_FONT_COLOR:WrapTextInColorCode("To get started, set your Hearthstone location to "..playerCapitalCity.." and click the Start button!")

-- Steps follow the pattern of defining the Alliance version of a step as a baseline, adding an override for Horde where needed
-- TODO: Check for items/spells/toys that can provide fast travel to certain places to optimize even further (M+ ports, Garrison Hearthstones, Northrend Dal portal item from Shadowmourne quest, etc)
WorldTour.Steps = {
    {
        DestinationID = 84,
        RelatedInstances = {},
        HelpText = introText,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = { 249, 1527 },
        RelatedInstances = { 68, 744, 760 },
        Waypoint = AddOn.Waypoints.PortalStormwindToUldum,
        HelpText = "Take the portal from "..playerCapitalCity.." to Uldum\n\n"..ERROR_COLOR:WrapTextInColorCode("Known Bug: ")..WHITE_FONT_COLOR:WrapTextInColorCode("Using the Uldum portal can sometimes cause you to permanently be stuck on the loading screen, requiring the game to be force closed and reopened."),
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToUldum }
    },
    {
        InstanceID = 68,
        AreaPoiID = 6685,
        Waypoint = AddOn.Waypoints.TheVortexPinnacle,
        HelpText = "Dungeon is repeatable 10 times per hour on Normal difficulty and once per day on Heroic difficulty"
    },
    {
        InstanceID = 744,
        AreaPoiID = 6537,
        Waypoint = AddOn.Waypoints.TempleOfAhnQiraj
    },
    {
        InstanceID = 760,
        AreaPoiID = 6527,
        Waypoint = AddOn.Waypoints.OnyxiasLair
    },
    {
        DestinationID = 84,
        RelatedInstances = { 68, 744, 760 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 125,
        RelatedInstances = { 758, 753, 756, 755, 286 },
        Waypoint = AddOn.Waypoints.PortalStormwindToNorthrendDalaran,
        HelpText = "Take the portal from "..playerCapitalCity.." to Dalaran, Cystalsong Forest (Northrend)",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToNorthrendDalaran }
    },
    {
        InstanceID = 758,
        AreaPoiID = 6521,
        Waypoint = AddOn.Waypoints.IcecrownCitadel,
    },
    {
        InstanceID = 753,
        AreaPoiID = 6526,
        Waypoint = AddOn.Waypoints.VaultOfArchavon,
        HelpText = "Zone must be under "..localizedPlayerFaction.." control.\n\nAll bosses have a chance to drop the mount"
    },
    {
        InstanceID = 756,
        AreaPoiID = 6525,
        Waypoint = AddOn.Waypoints.EyeOfEternity
    },
    {
        InstanceID = 755,
        AreaPoiID = 6520,
        Waypoint = AddOn.Waypoints.TheObsidianSanctum
    },
    {
        InstanceID = 286,
        AreaPoiID = 6690,
        Waypoint = AddOn.Waypoints.UtgardePinnacle,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 758, 753, 756, 755, 286 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 198,
        RelatedInstances = { 78 },
        Waypoint = AddOn.Waypoints.PortalStormwindToHyjal,
        HelpText = "Take the portal from "..playerCapitalCity.." to Hyjal",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToHyjal }
    },
    {
        InstanceID = 78,
        AreaPoiID = 6514,
        Waypoint = AddOn.Waypoints.Firelands,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 78 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 74,
        RelatedInstances = { 187 },
        Waypoint = AddOn.Waypoints.PortalStormwindToCavernsOfTime,
        HelpText = "Take the portal from "..playerCapitalCity.." to Caverns of Time",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToCavernsOfTime, HelpText = "Take the portal from "..playerCapitalCity.." to Caverns of Time (lower level of the portal room)" }
    },
    {
        InstanceID = 187,
        AreaPoiID = 6512,
        Waypoint = AddOn.Waypoints.DragonSoul,
        HelpText = "Life-Binder's Handmaiden only available in Heroic difficulty"
    },
    {
        DestinationID = 84,
        RelatedInstances = { 187 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 207,
        RelatedInstances = { 67 },
        Waypoint = AddOn.Waypoints.PortalStormwindToDeepholm,
        HelpText = "Take the portal from "..playerCapitalCity.." to Deepholm",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToDeepholm }
    },
    {
        InstanceID = 67,
        AreaPoiID = 6687,
        Waypoint = AddOn.Waypoints.TheStonecore,
        HelpText = "Dungeon is repeatable 10 times per hour on Normal difficulty and once per day on Heroic difficulty"
    },
    {
        DestinationID = 84,
        RelatedInstances = { 67 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 111,
        RelatedInstances = { 252, 749 },
        Waypoint = AddOn.Waypoints.PortalStormwindToShattrath,
        HelpText = "Take the portal from "..playerCapitalCity.." to Shattrath",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToShattrath, HelpText = "Take the portal from "..playerCapitalCity.." to Shattrath (lower level of the portal room)" }
    },
    {
        InstanceID = 252,
        AreaPoiID = 6717,
        Waypoint = AddOn.Waypoints.SethekkHalls,
        HelpText = L["Heroic"]
    },
    {
        InstanceID = 749,
        AreaPoiID = 6534,
        Waypoint = AddOn.Waypoints.TheEye
    },
    {
        DestinationID = 84,
        RelatedInstances = { 252, 749 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 111,
        RelatedInstances = { 249, 77, 1292 },
        Waypoint = AddOn.Waypoints.PortalStormwindToShattrath,
        HelpText = "Take the portal from "..playerCapitalCity.." to Shattrath",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToShattrath, HelpText = "Take the portal from "..playerCapitalCity.." to Shattrath (lower level of the portal room)" }
    },
    {
        DestinationID = 122,
        RelatedInstances = { 249, 77, 1292 },
        Waypoint = AddOn.Waypoints.PortalShattrathToQuelDanas,
        HelpText = "Take the portal from Shattrath to Isle of Quel'Danas",
    },
    {
        InstanceID = 249,
        AreaPoiID = 6718,
        Waypoint = AddOn.Waypoints.MagistersTerrace,
    },
    {
        InstanceID = 77,
        AreaPoiID = 6683,
        Waypoint = AddOn.Waypoints.ZulAman,
    },
    {
        InstanceID = 1292,
        Waypoint = AddOn.Waypoints.StratholmeDead
    },
    {
        DestinationID = 84,
        RelatedInstances = { 249, 77, 1292 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 50,
        RelatedInstances = { 76, 745, 860 },
        Waypoint = AddOn.Waypoints.StranglethornValeZeppelinHorde,
        HelpText = "Take the zeppelin from Orgrimmar to Stranglethorn Vale",
        Condition = playerFaction == "Horde"
    }, -- Destination = Northern Stranglethorn
    {
        Condition = playerFaction == "Alliance",
        InstanceID = 745,
        AreaPoiID = 6528,
        Waypoint = AddOn.Waypoints.Karazhan
    },
    {
        Condition = playerFaction == "Alliance",
        InstanceID = 860,
        Waypoint = AddOn.Waypoints.ReturnToKarazhan,
    },
    {
        Condition = playerFaction == "Alliance",
        InstanceID = 76,
        AreaPoiID = 6682,
        Waypoint = AddOn.Waypoints.ZulGurub,
    },
    {
        Condition = playerFaction == "Horde",
        InstanceID = 76,
        AreaPoiID = 6682,
        Waypoint = AddOn.Waypoints.ZulGurub,
    },
    {
        Condition = playerFaction == "Horde",
        InstanceID = 745,
        AreaPoiID = 6528,
        Waypoint = AddOn.Waypoints.Karazhan
    },
    {
        Condition = playerFaction == "Horde",
        InstanceID = 860,
        Waypoint = AddOn.Waypoints.ReturnToKarazhan,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 76, 745, 860 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 371,
        RelatedInstances = { 317, 362 },
        Waypoint = AddOn.Waypoints.PortalStormwindToJadeForest,
        HelpText = "Take the portal from "..playerCapitalCity.." to The Jade Forest",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToJadeForest }
    },
    {
        InstanceID = 317,
        AreaPoiID = 6511,
        Waypoint = AddOn.Waypoints.MogushanVaults
    },
    {
        DestinationID = 388,
        RelatedInstances = { 362 },
        Waypoint = AddOn.Waypoints.PortalIsleOfThunderAlliance,
        HelpText = "Take the portal from Shado-Pan Garrison to Isle of Thunder",
        Horde = { Waypoint = AddOn.Waypoints.PortalIsleOfThunderHorde }
    },
    {
        InstanceID = 362,
        AreaPoiID = 6508,
        Waypoint = AddOn.Waypoints.ThroneOfThunder
    },
    {
        DestinationID = 84,
        RelatedInstances = { 317, 362 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 371,
        RelatedInstances = { 369 },
        Waypoint = AddOn.Waypoints.PortalStormwindToJadeForest,
        HelpText = "Take the portal from "..playerCapitalCity.." to The Jade Forest",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToJadeForest }
    },
    {
        InstanceID = 369,
        AreaPoiID = 6507,
        Waypoint = AddOn.Waypoints.SiegeOfOrgrimmar,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 369 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 622,
        RelatedInstances = { 669, 457 },
        Waypoint = AddOn.Waypoints.PortalStormwindToStormshield,
        HelpText = "Take the portal from "..playerCapitalCity.." to Stormshield, Ashran (upper area of the portal room)",
        Horde = { DestinationID = 624, Waypoint = AddOn.Waypoints.PortalOrgrimmarToWarspear, HelpText = "Take the portal from "..playerCapitalCity.." to Warspear, Ashran (Lower level of the portal room)" }
    },
    {
        InstanceID = 669,
        AreaPoiID = 6504,
        Waypoint = AddOn.Waypoints.HellfireCitadel,
    },
    {
        InstanceID = 457,
        AreaPoiID = 6505,
        Waypoint = AddOn.Waypoints.BlackrockFoundry,
    },
    {
        DestinationID = 627,
        RelatedInstances = { 786, 875 },
        HelpText = "Use your Dalaran Hearthstone to teleport to Dalaran in the Broken Isles. If you cannot use the Dalaran Hearthstone yet, find the portal to Azuna in "..playerCapitalCity.."'s portal room and fly to Dalaran from there."
    },
    {
        InstanceID = 786,
        AreaPoiID = 5101,
        Waypoint = AddOn.Waypoints.TheNighthold,
    },
    {
        InstanceID = 875,
        AreaPoiID = 5250,
        Waypoint = AddOn.Waypoints.TombOfSargeras
    },
    {
        DestinationID = 627,
        RelatedInstances = { 946 },
        HelpText = "Use your Dalaran Hearthstone to teleport to Dalaran in the Broken Isles. If you cannot use the Dalaran Hearthstone yet, find the portal to Azuna in "..playerCapitalCity.."'s portal room and fly to Dalaran from there."
    },
    {
        DestinationID = 831,
        RelatedInstances = { 946 },
        Waypoint = AddOn.Waypoints.PortalDalaranToArgus,
        HelpText = "Use the teleportation pad in Dalaran to board the Vindicaar and reach Argus"
    },
    {
        DestinationID = 885,
        RelatedInstances = { 946 },
        Waypoint = AddOn.Waypoints.PortalVindicaarToAntoranWastes,
        HelpText = "Use the teleportation pad in the Vindicaar to travel to any available location in Antoran Wastes"
    },
    {
        InstanceID = 946,
        AreaPoiID = 5440,
        Waypoint = AddOn.Waypoints.Antorus,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 669, 457, 786, 875, 946 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1161,
        RelatedInstances = { 1176, 1041, 1022, 1001 },
        Waypoint = AddOn.Waypoints.PortalStormwindToBoralus,
        HelpText = "Take the portal from "..playerCapitalCity.." to Boralus (upper area of the portal room)",
        Horde = { DestinationID = 862, Waypoint = AddOn.Waypoints.PortalOrgrimmarToZuldazar, HelpText = "Take the portal from "..playerCapitalCity.." to Zuldazar (lower level of the portal room)" }
    },
    {
        InstanceID = 1176,
        AreaPoiID = 6013,
        Waypoint = AddOn.Waypoints.BattleOfDazaralorAlliance,
        Horde = { Waypoint = AddOn.Waypoints.BattleOfDazaralorHorde }
    },
    {
        Condition = playerFaction == "Alliance",
        InstanceID = 1001,
        AreaPoiID = 5834,
        Waypoint = AddOn.Waypoints.Freehold,
    },
    {
        DestinationID = 862,
        RelatedInstances = { 1041, 1022 },
        Waypoint = AddOn.Waypoints.ZuldazarBoatAlliance,
        HelpText = "Take the boat from Boralus to Zuldazar",
        Condition = playerFaction == "Alliance"
    }, -- need to complete BfA intro questline (Tides of War)
    {
        InstanceID = 1041,
        AreaPoiID = 5839,
        Waypoint = AddOn.Waypoints.KingsRest,
        Condition = playerFaction == "Alliance"
    },
    {
        InstanceID = 1022,
        AreaPoiID = 5841,
        Waypoint = AddOn.Waypoints.TheUnderrot,
        Condition = playerFaction == "Alliance"
    },
    {
        InstanceID = 1041,
        AreaPoiID = 5839,
        Waypoint = AddOn.Waypoints.KingsRest,
        Condition = playerFaction == "Horde"
    },
    {
        InstanceID = 1022,
        AreaPoiID = 5841,
        Waypoint = AddOn.Waypoints.TheUnderrot,
        Condition = playerFaction == "Horde"
    },
    {
        DestinationID = 895,
        RelatedInstances = { 1001 },
        Waypoint = AddOn.Waypoints.TiragardeSoundBoatHorde,
        HelpText = "Take the boat from Zuldazar to Tiragarde Sound",
        Condition = playerFaction == "Horde"
    }, -- need to complete BfA intro questline (Horde questline name unknown right now)
    {
        Condition = playerFaction == "Horde",
        InstanceID = 1001,
        AreaPoiID = 5834,
        Waypoint = AddOn.Waypoints.Freehold,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1176, 1041, 1022, 1001 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1161,
        RelatedInstances = { 1178 },
        Waypoint = AddOn.Waypoints.PortalStormwindToBoralus,
        HelpText = "Take the portal from "..playerCapitalCity.." to Boralus (upper area of the portal room)",
        Horde = { DestinationID = 862, Waypoint = AddOn.Waypoints.PortalOrgrimmarToZuldazar, HelpText = "Take the portal from "..playerCapitalCity.." to Zuldazar (lower level of the portal room)" }
    },
    {
        DestinationID = 1462,
        RelatedInstances = { 1178 },
        Waypoint = AddOn.Waypoints.MechagonFlightPathAlliance,
        HelpText = "Take the flight path to Mechagon (must complete The Legend of Mechagon quest line to access the flight path)",
        Horde = { Waypoint = AddOn.Waypoints.MechagonFastTravelHorde, HelpText = "Speak to Captain Krooz to travel to Mechagon (must complete The Legend of Mechagon quest line to access the boat)" }
    },
    {
        InstanceID = 1178,
        AreaPoiID = 6129,
        Waypoint = AddOn.Waypoints.OperationMechagon,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1178 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1527,
        HelpText = "Take the portal from "..playerCapitalCity.." to Uldum\n\n"..ERROR_COLOR:WrapTextInColorCode("Known Bug: ")..WHITE_FONT_COLOR:WrapTextInColorCode("Using the Uldum portal can sometimes cause you to permanently be stuck on the loading screen, requiring the game to be force closed and reopened."),
        Waypoint = AddOn.Waypoints.PortalStormwindToUldum,
        Condition = not AddOn.IsNyalothaEntranceInPandaria(),
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToUldum }
    },
    {
        DestinationID = 371,
        Waypoint = AddOn.Waypoints.PortalStormwindToJadeForest,
        HelpText = "Take the portal from "..playerCapitalCity.." to The Jade Forest",
        Condition = AddOn.IsNyalothaEntranceInPandaria(),
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToJadeForest }
    },
    {
        InstanceID = 1180,
        AreaPoiID = 6540,
        HelpText = "Ensure you are in the present day version of the zone by talking to Zidormi",
        Condition = AddOn.IsNyalothaEntranceInPandaria()
    }, -- Ny'alotha, the Waking City (VoEB) (TODO: Add Waypoint to list and entry)
    {
        InstanceID = 1180,
        AreaPoiID = 6539,
        HelpText = "Ensure you are in the present day version of the zone by talking to Zidormi",
        Condition = not AddOn.IsNyalothaEntranceInPandaria()
    }, -- Ny'alotha, the Waking City (Uldum) (TODO: Add Waypoint to list and entry)
    {
        DestinationID = 84,
        RelatedInstances = { 1180 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1670,
        RelatedInstances = { 1182 },
        Waypoint = AddOn.Waypoints.PortalStormwindToOribos,
        HelpText = "Take the portal from "..playerCapitalCity.." to Oribos",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToOribos }
    },
    {
        DestinationID = 1533,
        RelatedInstances = { 1182 },
        Waypoint = AddOn.Waypoints.BastionFlightPath,
        HelpText = "Take the flight path to Bastion from the Ring of Transference (upper level of Oribos).\n\nRequires completing the Shadowlands introduction quest line to unlock the flight master."
    },
    {
        InstanceID = 1182,
        AreaPoiID = 6582,
        Waypoint = AddOn.Waypoints.TheNecroticWake,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1182 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1670,
        RelatedInstances = { 1193 },
        Waypoint = AddOn.Waypoints.PortalStormwindToOribos,
        HelpText = "Take the portal from "..playerCapitalCity.." to Oribos",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToOribos }
    },
    {
        DestinationID = 1543,
        RelatedInstances = { 1193 },
        HelpText = "Reach the Ring of Transference (upper level of Oribos), then jump into the large hole in the center of the floor to travel to The Maw.\n\nRequires completing the Shadowlands introduction quest line."
    },
    {
        InstanceID = 1193,
        AreaPoiID = 6994,
        Waypoint = AddOn.Waypoints.SanctumOfDomination,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1193 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 1670,
        RelatedInstances = { 1195 },
        Waypoint = AddOn.Waypoints.PortalStormwindToOribos,
        HelpText = "Take the portal from "..playerCapitalCity.." to Oribos",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToOribos }
    },
    {
        DestinationID = 1970,
        RelatedInstances = { 1195 },
        Waypoint = AddOn.Waypoints.PortalOribosToZerethMortis,
        HelpText = "Enter the portal to Zereth Mortis from the Ring of Transference (upper level of Oribos).\n\nThis portal becomes available once the Zereth Mortis introduction quest line is completed by at least one character on your account."
    },
    {
        InstanceID = 1195,
        AreaPoiID = 7021,
        Waypoint = AddOn.Waypoints.SepulcherOfTheFirstOnes,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1195 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 2112,
        RelatedInstances = { 1207 },
        Waypoint = AddOn.Waypoints.PortalStormwindToValdrakken,
        HelpText = "Take the portal from "..playerCapitalCity.." to Valdrakken",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToValdrakken }
    },
    {
        DestinationID = 2200,
        RelatedInstances = { 1207 },
        Waypoint = AddOn.Waypoints.PortalValdrakkenToEmeraldDream,
        HelpText = "Take the portal from Valdrakken to the Emerald Dream located on top of the Valdrakken Bank.\n\nThis portal may not be available until the Emerald Dream quest line is completed by at least one character on your account.",
    },
    {
        InstanceID = 1207,
        AreaPoiID = 7631,
        Waypoint = AddOn.Waypoints.Amirdrassil,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1207 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 2339,
        RelatedInstances = { 1269, 1210, 1273 },
        Waypoint = AddOn.Waypoints.PortalStormwindToDornogal,
        HelpText = "Take the portal from "..playerCapitalCity.." to Dornogal",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToDornogal }
    },
    {
        InstanceID = 1269,
        AreaPoiID = 7820,
        Waypoint = AddOn.Waypoints.TheStonevault,
    },
    {
        InstanceID = 1210,
        AreaPoiID = 7821,
        Waypoint = AddOn.Waypoints.DarkflameCleft,
    },
    {
        InstanceID = 1273,
        AreaPoiID = 7546,
        Waypoint = AddOn.Waypoints.NerubArPalace,
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1269, 1210, 1273 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 2339,
        RelatedInstances = { 1296, 1302, 1194 },
        Waypoint = AddOn.Waypoints.PortalStormwindToDornogal,
        HelpText = "Take the portal from "..playerCapitalCity.." to Dornogal",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToDornogal }
    },
    {
        DestinationID = 2346,
        RelatedInstances = { 1296 },
        Waypoint = AddOn.Waypoints.PortalDornogalToUndermine,
        HelpText = "Step on the teleportation pad from Dornogal to Undermine located near the center of the city near the Dornogal bank.\n\nTeleportation pad may not be active until the Undermine introduction quest line has been completed by at least one character on your account."
    },
    {
        InstanceID = 1296,
        AreaPoiID = 8240,
        Waypoint = AddOn.Waypoints.LiberationOfUndermine,
    },
    {
        DestinationID = 2339,
        RelatedInstances = { 1296 },
        Waypoint = AddOn.Waypoints.PortalUndermineToDornogal,
        HelpText = "Step on the teleportation pad from Undermine to Dornogal located near the rocket station"
    },
    {
        DestinationID = 2472,
        RelatedInstances = { 1302, 1194 },
        Waypoint = AddOn.Waypoints.PortalDornogalToTazavesh,
        HelpText = "Take the portal from Dornogal to Tazavesh in K'aresh.\n\nPortal will not be available until the Ghosts of K'aresh introductory quest has been completed by at least one character on your account."
    }, -- DestinationID is for Tazavesh (zone), not K'aresh
    {
        InstanceID = 1302,
        AreaPoiID = 8363,
        Waypoint = AddOn.Waypoints.ManaforgeOmega,
    },
    {
        DestinationID = 2472,
        RelatedInstances = { 1302 },
        HelpText = "Travel back to Tazavesh, the Veiled Market in K'aresh"
    },
    {
        InstanceID = 1194,
        AreaPoiID = 2395,
        Waypoint = AddOn.Waypoints.TazaveshKaresh,
        HelpText = "Dungeon is repeatable once per day on Heroic difficulty and once per week on Mythic difficulty"
    },
    {
        DestinationID = 84,
        RelatedInstances = { 1273, 1296, 1302, 1194 },
        HelpText = "Use your Hearthstone to teleport back to "..playerCapitalCity,
        Horde = { DestinationID = 85 }
    },
    {
        DestinationID = 2393,
        RelatedInstances = { 1300, 1308, 1299 },
        Waypoint = AddOn.Waypoints.PortalStormwindToSilvermoon,
        HelpText = "Take the portal from "..playerCapitalCity.." to Silvermoon (Midnight zone)",
        Horde = { Waypoint = AddOn.Waypoints.PortalOrgrimmarToSilvermoon }
    },
    {
        InstanceID = 1300,
        AreaPoiID = 8510,
        Waypoint = AddOn.Waypoints.MagistersTerraceMidnight,
    },
    {
        InstanceID = 1308,
        AreaPoiID = 8271,
        Waypoint = AddOn.Waypoints.MarchOnQuelDanas,
    },
    {
        InstanceID = 1299,
        AreaPoiID = 8386,
        Waypoint = AddOn.Waypoints.WindrunnerSpire,
    },
}

WorldTour.factionCapitalMapIDs = { 84, 85 }

---@param step WorldTourStep
---@param faction "Alliance"|"Horde"
---@return WorldTourStep resolvedStep
local function resolveStepForFaction(step, faction)
    local override = step[faction]
    if not override then return step end

    ---@type WorldTourStep
    local resolved = {}
    for key, value in pairs(step) do
        if key ~= "Alliance" and key ~= "Horde" then
            resolved[key] = value
        end
    end
    for key, value in pairs(override) do
        resolved[key] = value
    end
    return resolved
end

---@param retainCurrentStep boolean
function WorldTour:BuildRoute(retainCurrentStep)
    ---@type WorldTourStep[]
    local route = {}
    local awayFromCapitalCity = false

    for _, rawStep in ipairs(self.Steps) do
        local step = resolveStepForFaction(rawStep, playerFaction)

        -- Ensure the step isn't gated by a condition or that the specified condition is met before potentially adding it to the route
        if step.Condition == nil or step.Condition then
            local isCapitalCityStep = not step.InstanceID and tContains(self.factionCapitalMapIDs, step.DestinationID)
            local isInitialCapitalCityStep = tContains(self.factionCapitalMapIDs, step.DestinationID) and step.RelatedInstances and #step.RelatedInstances == 0

            if isInitialCapitalCityStep then
                -- Always include the initial step to set Hearthstone to faction's capital city
                tinsert(route, step)
                AddOn:PrintDebugMessage("Away from capital for step:", step.HelpText or step.DestinationID or step.InstanceID, "is =", awayFromCapitalCity)
            elseif isCapitalCityStep and awayFromCapitalCity then
                -- Includes steps to return to faction's capital city provided some prior steps have had the player travel elsewhere to begin with
                tinsert(route, step)
                awayFromCapitalCity = false
                AddOn:PrintDebugMessage("Away from capital for step:", step.HelpText or step.DestinationID or step.InstanceID, "is =", awayFromCapitalCity)
            elseif not step.RelatedInstances or self:CanLootSomethingFromInstances(step.RelatedInstances or {}) then
                tinsert(route, step)
                -- If the step is a navigation step, this should indicate that the player has left the capital city by completing this step
                if not step.InstanceID then awayFromCapitalCity = true end
                AddOn:PrintDebugMessage("Away from capital for step:", step.HelpText or step.DestinationID or step.InstanceID, "is =", awayFromCapitalCity)
            end
        else
            AddOn:PrintDebugMessage("Skipping step due to condition not being met")
        end
    end

    self.Route = route
    if not retainCurrentStep then
        AddOn.db.global.worldTour.currentStep = 1
    end
end
