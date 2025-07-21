local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "enUS", true, true)

if not L then return end

--- Mount Notes ---
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Available in Normal Legacy Raid difficulty, but Heroic should be set if "..WrapTextInColor("Life-Binder's Handmaiden", DARKYELLOW_FONT_COLOR).." is not obtained yet"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
L["Also obtainable in Timewalking"] = "Also obtainable in Timewalking"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtainable in Raid Finder (LFR) difficulty by killing "..WrapTextInColor("Lady Jaina Proudmoore", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Drops for "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." characters, but obtaining this also gives you the "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." version"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Drops for "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." characters, but obtaining this also gives you the "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." version"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Upon entering the instance, raid difficulty will automatically be set to Normal"
L["Requires completing the Tazavesh story line to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Erfordert den Abschluss der Tazavesh-Handlungsreihe, um den Flugpunkt freizuschalten, beginnend mit |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976), DARKYELLOW_FONT_COLOR)

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
L["Search by mount/instance name, instance type, or difficulty"] = "Search by mount/instance name, instance type, or difficulty"
L["Scale"] = "Scale"
L["Use TomTom waypoints"] = "Use TomTom waypoints"
L["Show Owned Mounts"] = "Show Owned Mounts"
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
L["Name"] = "Name"
L["Instance"] = "Instance"
L["Available Difficulty(s)"] = "Available Difficulty(s)"
L["Shares lockout with:"] = "Shares lockout with:"
L["View in mount journal"] = "View in mount journal"
L["View in encounter journal"] = "View in encounter journal"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Do not talk to any of the Titan Keepers, otherwise this mount will not drop"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Entrance can be in either "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." or "..WrapTextInColor("Vale of Eternal Blossoms", DARKYELLOW_FONT_COLOR)
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Waypoint tracking on the minimap may not always appear until you are in a specific zone."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "For example, an arrow pointing towards "..WrapTextInColor("Throne of Thunder", DARKYELLOW_FONT_COLOR).." will only appear when you are on the "..WrapTextInColor("Isle of Thunder", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "Set map pin"
L["Set TomTom waypoint"] = "Set "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR).." waypoint"