local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "enUS", true, true)

if not L then return end
--@retail@
local ICH_GetQuestName = C_QuestLog.GetTitleForQuestID
local ICH_GetClassColor = C_ClassColor.GetClassColor
--@end-retail@
--@version-mists@
local ICH_GetQuestName = C_QuestLog.GetQuestInfo
local ICH_GetClassColor = GetClassColorObj
--@end-version-mists@
local function ICH_GetClassName(classID, fallbackValue)
    local className = select(1, GetClassInfo(classID))
    if not className then return fallbackValue end
    return className
end
local function ICH_GetCurrencyName(currencyID, fallbackValue)
    local currency = C_CurrencyInfo.GetCurrencyInfo(currencyID)
    if not currency or not currency.name then return fallbackValue end
    return currency.name
end

--- Mount Notes ---
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Available in Normal Legacy Raid difficulty, but Heroic should be set if "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Life-Binder's Handmaiden").." is not obtained yet"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Drop from trash mobs around "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Temple of Ahn'Qiraj")
L["Also obtainable in Timewalking"] = "Also obtainable in Timewalking"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtainable in Raid Finder (LFR) difficulty by killing "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Lady Jaina Proudmoore")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Drops for "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." characters, but obtaining this also gives you the "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." version"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Drops for "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." characters, but obtaining this also gives you the "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." version"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Upon entering the instance, raid difficulty will automatically be set to Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Do not talk to any of the Titan Keepers, otherwise this mount will not drop"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Entrance can be in either "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." or "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vale of Eternal Blossoms")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Requires completing the Tazavesh storyline to unlock flight path, beginning with |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "The Al'ley Cat of Oribos") -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requires completing a short questline after looting "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Malfunctioning Mechsuit]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Dropped by "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Doctor Theolen Krastinov")..", who has a random chance to spawn after killing "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Rattlegore")
L["Dropped by the Rare Elite Vixx the Collector"] = "Dropped by the Rare Elite "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vixx the Collector")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "This item is obtainable even though it does not appear on the loot table for "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan")
L["Can drop from every boss in the dungeon"] = "Can drop from every boss in the dungeon"
L["Can only be looted and used by a Druid"] = "Can only be looted and used by a "..WrapTextInColor(ICH_GetClassName(11, "Druid"), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Can also be looting by fishing within the instance"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requires completion of the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Dropped by the hidden boss "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Endgineer Omegaplugg")
L["It is highly recommended to attempt this encounter with a full party"] = "It is highly recommended to attempt this encounter with a full party"
L["Can only be looted and used by a Demon Hunter"] = "Can only be looted and used by a "..WrapTextInColor(ICH_GetClassName(12, "Demon Hunter"), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Drops from "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." who patrols part of the path south of Tarren Mill"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "There are some reports of "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." despawning after any bosses are killed, so proceed with caution"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Drops from Gastropod mobs found between "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaera").." and "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji-Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Also obtainable in a Follower dungeon"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "This item is obtainable even though it does not appear on the loot table for "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Goldie Baronbottom")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "Instance entrance is at the very top of the tower where the waypoint is located"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Dropped by "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Deviate Guardians").." and "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Deviate Ravagers").." throughout the dungeon"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Dropped by the Rare Elite "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than the Malodorous")
L["Guides for how to spawn this mob can be found online"] = "Guides for how to spawn this mob can be found online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Dropped by "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Defias Pirates").." on the boat towards the end of the dungeon"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Dropped by "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("The Lanticore")..", which has a random chance to spawn after killing "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Orebender Gor'ashan")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Dropped by "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sand Elementals").." in Normal and Heroic, but can be looted from "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Council of Elders").." in LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Obtained by using an "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Amani Hex Stick]")).." on "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Forest Frogs")
L["Detailed guides for how to obtain this pet can be found online"] = "Detailed guides for how to obtain this pet can be found online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "This item is obtainable even though it does not appear on the loot table for "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dragons of Nightmare")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "This pet takes 3 days to hatch after looting "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Viable Cobra Egg]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "This item is obtainable even though it does not appear on the loot table for "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sire Denathrius")

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroic"
L["Mythic"] = "Mythic"
L["10 player"] = "10 player"
L["10 Player (Heroic)"] = "10 Player (Heroic)"
L["25 player"] = "25 player"
L["25 Player (Heroic)"] = "25 Player (Heroic)"
L["40 player"] = "40 player"
L["Unknown"] = "Unknown"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "Dungeon Difficulty is already set to"
L["Legacy Raid Difficulty is already set to"] = "Legacy Raid Difficulty is already set to"
L["Raid Difficulty is already set to"] = "Raid Difficulty is already set to"
L["Current Instance Difficulties"] = "Current Instance Difficulties"
L["Dungeon Difficulty:"] = "Dungeon Difficulty:"
L["Legacy Raid Difficulty:"] = "Legacy Raid Difficulty:"
L["Raid Difficulty:"] = "Raid Difficulty:"
L["Invalid dungeon difficulty provided."] = "Invalid dungeon difficulty provided."
L["Invalid legacy raid difficulty provided."] = "Invalid legacy raid difficulty provided."
L["Invalid raid difficulty provided."] = "Invalid raid difficulty provided."
L["Accepted values:"] = "Accepted values:"
L["Show/hide the minimap icon"] = "Show/hide the minimap icon"
L["Updated available mount list"] = "Updated available mount list" -- Currently unused
L["Map pin set for"] = "Map pin set for"
L["Unable to set map pin for"] = "Unable to set map pin for"
L["TomTom waypoint set for"] = "TomTom waypoint set for"
L["Unable to set TomTom waypoint for"] = "Unable to set TomTom waypoint for"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Display all current instance difficulties"
L["Set dungeon difficulty."] = "Set dungeon difficulty."
L["Set legacy raid difficulty."] = "Set legacy raid difficulty."
L["Set raid difficulty."] = "Set raid difficulty."
L["Show/hide the minimap icon"] = "Show/hide the minimap icon"

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Track available mounts, toys, and pets from instances and easily set required instance difficulty"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Type \"/ich help\" in the chat window for available slash commands"

-- Special Search Terms --
L["dungeon"] = "dungeon"
L["raid"] = "raid"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Search by mount/instance name, instance type, difficulty, or expansion"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Search by toy/instance name, instance type, difficulty, or expansion"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Search by pet/instance name, instance type, difficulty, or expansion"
L["Scale"] = "Scale"
L["Use TomTom waypoints"] = "Use TomTom waypoints"
L["Show Owned"] = "Show Owned"
L["How To Use:"] = "How To Use:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"
L["to make sure it is updated."] = "to make sure it is updated."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "When you are locked out on a particular difficulty, the button for that difficulty will be disabled."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "A button will also be disabled for legacy raids completed on another difficulty since those lockouts"
L["are shared across difficulties."] = "are shared across difficulties."
L["Search Hints:"] = "Search Hints:"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"raid\"").." will show all collectibles that can be collected from a raid"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." will show all collectibles and instances that contain \"fel\" in the name"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mythic\"").." will show all collectibles that can be obtained from a Mythic dungeon or raid"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." or "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." will show all collectibles that can be obtained from Wrath of the Lich King instances"
L["Name"] = "Name"
L["Instance"] = "Instance"
L["Available Difficulty(s)"] = "Available Difficulty(s)"
L["Shares lockout with:"] = "Shares lockout with:"
L["View in encounter journal"] = "View in encounter journal"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Waypoint tracking on the minimap may not always appear until you are in a specific zone."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "For example, an arrow pointing towards "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Throne of Thunder").." will only appear when you are on the "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Isle of Thunder")
L["Set map pin"] = "Set map pin"
L["Set TomTom waypoint"] = "Set "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom").." waypoint"
L["Coming soon"] = "Coming soon"

--- About ---
L["About the AddOn"] = "About the AddOn"
L["Created by Pranavius"] = "Created by Pranavius"
L["Translations:"] = "Translations:"
L["Open ICH"] = "Open ICH"
L["Close"] = "Close"

--- New in v11: To be categorized ---
L["Type"] = "Type"
L["Expansion"] = "Expansion"
L["Cost"] = "Cost"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = "Random chance to obtain when opening a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Originally rewarded for completing the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Can now be purchased from any Timewalking vendor."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Originally rewarded for completing the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Can now be purchased from any Timewalking vendor."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Originally rewarded for completing the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Can now be purchased from any Timewalking vendor."
L["Special Thanks"] = "Special Thanks"
L["Mount"] = "Mount"
L["Pet"] = "Pet"
L["Toy"] = "Toy"
L["Timewalking Vendor"] = "Timewalking Vendor"
L["Unable to transfer Timewarped Badges to this character right now."] = "Unable to transfer "..ICH_GetCurrencyName(1166, "Timewarped Badges").." to this character right now."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "Unable to open the currency transfer menu. Please open it manually or try again."
L["Click to open currency transfer menu"] = "Click to open currency transfer menu"
L["Cannot transfer to this character"] = "Cannot transfer to this character"
L["Legion: Remix Vendor"] = "Legion: Remix Vendor"
--- New in v12: To be categorized ---
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "This pet is a reward from a quest chain started by the item "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", which is purchasable from the vendor."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"
L["Available In"] = "Available In"
L["Event Exclusive"] = "Event Exclusive"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Search by collectible name/type or expansion"
--- New in v12.1: To be categorized ---
L["Unable to transfer Bronze to this character right now."] = "Unable to transfer "..ICH_GetCurrencyName(3252, "Bronze").." to this character right now."
--- New in v12.2: To be categorized ---
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Obtained through the quest chain started by "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]"))..", which is purchasable from the vendor."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."
