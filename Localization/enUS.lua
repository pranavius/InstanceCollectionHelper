local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "enUS", true, true)

if not L then return end

--- Mount Notes ---
-- L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"
-- L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Available in Normal Legacy Raid difficulty, but Heroic should be set if "..WrapTextInColor("Life-Binder's Handmaiden", DARKYELLOW_FONT_COLOR).." is not obtained yet"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
-- L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
L["Also obtainable in Timewalking"] = "Also obtainable in Timewalking"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtainable in Raid Finder (LFR) difficulty by killing "..WrapTextInColor("Lady Jaina Proudmoore", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Drops for "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." characters, but obtaining this also gives you the "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." version"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Drops for "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." characters, but obtaining this also gives you the "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." version"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Upon entering the instance, raid difficulty will automatically be set to Normal"
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Requires completing the Tazavesh storyline to unlock flight path, beginning with |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos", DARKYELLOW_FONT_COLOR)
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requires completing a short questline after looting "..(select(2, C_Item.GetItemInfo(226683)) or WrapTextInColor("[Malfunctioning Mechsuit]", EPIC_PURPLE_COLOR))

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Dropped by "..WrapTextInColor("Doctor Theolen Krastinov", DARKYELLOW_FONT_COLOR)..", who has a random chance to spawn after killing "..WrapTextInColor("Rattlegore", DARKYELLOW_FONT_COLOR)
L["Dropped by the Rare Elite Vixx the Collector"] = "Dropped by the Rare Elite "..WrapTextInColor("Vixx the Collector", DARKYELLOW_FONT_COLOR)
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Gul'dan", DARKYELLOW_FONT_COLOR)
L["Can drop from every boss in the dungeon"] = "Can drop from every boss in the dungeon"
L["Can only be looted and used by a Druid"] = "Can only be looted and used by a "..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Can also be looting by fishing within the instance"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requires completion of the achievement "..WrapTextInColor(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire", DARKYELLOW_FONT_COLOR)
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Dropped by the hidden boss "..WrapTextInColor("Endgineer Omegaplugg", DARKYELLOW_FONT_COLOR)
L["It is highly recommended to attempt this encounter with a full party"] = "It is highly recommended to attempt this encounter with a full party"
L["Can only be looted and used by a Demon Hunter"] = "Can only be looted and used by a "..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Drops from "..WrapTextInColor("Don Carlos", DARKYELLOW_FONT_COLOR).." who patrols part of the path south of Tarren Mill"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "There are some reports of "..WrapTextInColor("Don Carlos", DARKYELLOW_FONT_COLOR).." despawning after any bosses are killed, so proceed with caution"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Drops from Gastropod mobs found between "..WrapTextInColor("Megaera", DARKYELLOW_FONT_COLOR).." and "..WrapTextInColor("Ji-Kun", DARKYELLOW_FONT_COLOR)

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Also obtainable in a Follower dungeon"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Goldie Baronbottom", DARKYELLOW_FONT_COLOR)
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "Instance entrance is at the very top of the tower where the waypoint is located"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Dropped by "..WrapTextInColor("Deviate Guardians", DARKYELLOW_FONT_COLOR).." and "..WrapTextInColor("Deviate Ravagers", DARKYELLOW_FONT_COLOR).." throughout the dungeon"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Dropped by the Rare Elite "..WrapTextInColor("Gol'than the Malodorous", DARKYELLOW_FONT_COLOR)
L["Guides for how to spawn this mob can be found online"] = "Guides for how to spawn this mob can be found online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Dropped by "..WrapTextInColor("Defias Pirates", DARKYELLOW_FONT_COLOR).." on the boat towards the end of the dungeon"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Dropped by "..WrapTextInColor("The Lanticore", DARKYELLOW_FONT_COLOR)..", which has a random chance to spawn after killing "..WrapTextInColor("Orebender Gor'ashan", DARKYELLOW_FONT_COLOR)
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "Access to the raid entrance requires completing the quest |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "The Tide Turns" or "Changing Tides", DARKYELLOW_FONT_COLOR)
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Dropped by "..WrapTextInColor("Sand Elementals", DARKYELLOW_FONT_COLOR).." in Normal and Heroic, but can be looted from "..WrapTextInColor("Council of Elders", DARKYELLOW_FONT_COLOR).." in LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Obtained by using an "..(select(2, C_Item.GetItemInfo(33865)) or WrapTextInColor("[Amani Hex Stick]", GREEN_FONT_COLOR)).." on "..WrapTextInColor("Forest Frogs", DARKYELLOW_FONT_COLOR)
L["Detailed guides for how to obtain this pet can be found online"] = "Detailed guides for how to obtain this pet can be found online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Dragons of Nightmare", DARKYELLOW_FONT_COLOR)
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "This pet takes 3 days to hatch after looting "..(select(2, C_Item.GetItemInfo(160832)) or WrapTextInColor("[Viable Cobra Egg]", RARE_BLUE_COLOR))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "This item is obtainable even though it does not appear on the loot table for "..WrapTextInColor("Sire Denathrius", DARKYELLOW_FONT_COLOR)

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroic"
L["Mythic"] = "Mythic"
L["10 player"] = "10 player"
L["10 Player (Heroic)"] = "10 Player (Heroic)"
L["25 player"] = "25 player"
L["25 Player (Heroic)"] = "25 Player (Heroic)"
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
L["Updated available mount list"] = "Updated available mount list"
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
L["Track available mounts from instances and easily set required instance difficulty"] = "Track available mounts from instances and easily set required instance difficulty"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Type \"/ich help\" in the chat window for available slash commands"

-- Special Search Terms --
L["dungeon"] = "dungeon"
L["raid"] = "raid"

--- UI ---
-- L["Search by mount/instance name, instance type, or difficulty"] = "Search by mount/instance name, instance type, or difficulty"
-- L["Search by toy/instance name, instance type, or difficulty"] = "Search by toy/instance name, instance type, or difficulty"
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Search by mount/instance name, instance type, difficulty, or expansion"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Search by toy/instance name, instance type, difficulty, or expansion"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Search by pet/instance name, instance type, difficulty, or expansion"
L["Scale"] = "Scale"
L["Use TomTom waypoints"] = "Use TomTom waypoints"
-- L["Show Owned Mounts"] = "Show Owned Mounts"
L["Show Owned"] = "Show Owned"
L["How To Use:"] = "How To Use:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Find the mount you want to collect in the list and click the button for the difficulty you want to run on"
L["to make sure it is updated."] = "to make sure it is updated."
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "A button will also be disabled for legacy raids completed on another difficulty since those lockouts"
L["are shared across difficulties."] = "are shared across difficulties."
L["Search Hints:"] = "Search Hints:"
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"raid\"", DARKYELLOW_FONT_COLOR).." will show all mounts that can be collected from a raid"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." will show all mounts and instances that contain \"fel\" in the name"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mythic\"", DARKYELLOW_FONT_COLOR).." will show all mounts that can be obtained from a Mythic dungeon or raid"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"
L["\"wotlk\" or \"wrath\" will show all mounts that can be obtained from Wrath of the Lich King instances"] = "\"wotlk\" or \"wrath\" will show all mounts that can be obtained from Wrath of the Lich King instances"
L["Name"] = "Name"
L["Instance"] = "Instance"
L["Available Difficulty(s)"] = "Available Difficulty(s)"
L["Shares lockout with:"] = "Shares lockout with:"
-- L["View in mount journal"] = "View in mount journal"
L["View in encounter journal"] = "View in encounter journal"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Do not talk to any of the Titan Keepers, otherwise this mount will not drop"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Entrance can be in either "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." or "..WrapTextInColor("Vale of Eternal Blossoms", DARKYELLOW_FONT_COLOR)
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Waypoint tracking on the minimap may not always appear until you are in a specific zone."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "For example, an arrow pointing towards "..WrapTextInColor("Throne of Thunder", DARKYELLOW_FONT_COLOR).." will only appear when you are on the "..WrapTextInColor("Isle of Thunder", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "Set map pin"
L["Set TomTom waypoint"] = "Set "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR).." waypoint"
L["Coming soon"] = "Coming soon"

--- About ---
L["About the AddOn"] = "About the AddOn"
L["Created by Pranavius"] = "Created by Pranavius"
L["Translations:"] = "Translations:"
L["Open ICH"] = "Open ICH"
L["Close"] = "Close"