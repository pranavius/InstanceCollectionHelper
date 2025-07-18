local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "enUS", true, true)

if not L then return end

--- Mount Notes ---
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Available in Normal Legacy Raid difficulty, but Heroic should be set if "..WrapTextInColor("Life-Binder's Handmaiden", DARKYELLOW_FONT_COLOR).." is not obtained yet"
L["Drops from trash mobs around Temple of Ahn'Qiraj"] = "Drop from trash mobs around "..WrapTextInColor("Temple of Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"
L["Also obtainable in Timewalking"] = "Also obtainable in Timewalking"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtainable in Raid Finder (LFR) difficulty by killing "..WrapTextInColor("Lady Jaina Proudmoore", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Drops for "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." characters, but obtaining this also gives you the "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." version"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Drops for "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).." characters, but obtaining this also gives you the "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE).." version"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Upon entering the instance, raid difficulty will automatically be set to Normal"

--- Instance Difficulties --
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

--- Slash Commands ---
L["Display all current instance difficulties"] = "Display all current instance difficulties"
L["Set dungeon difficulty."] = "Set dungeon difficulty."
L["Set legacy raid difficulty."] = "Set legacy raid difficulty."
L["Set raid difficulty."] = "Set raid difficulty."
L["Show/hide the minimap icon"] = "Show/hide the minimap icon"

--- Icon Tooltip ---
L["Track available mounts from instances and easily set required instance difficulty"] = "Track available mounts from instances and easily set required instance difficulty"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Type \"/ich help\" in the chat window for available slash commands"

--- UI ---
L["Search by mount/instance name, instance type, or difficulty"] = "Search by mount/instance name, instance type, or difficulty"
L["Scale"] = "Scale"
L["Show Owned Mounts"] = "Show Owned Mounts"
L["How To Use:"] = "How To Use:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Find the mount you want to collect in the list and click the button for the difficulty you want to run on"
L["to make sure it is updated."] = "to make sure it is updated."
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "A button will also be disabled for legacy raids completed on another difficulty since those lockouts"
L["are shared across difficulties."] = "are shared across difficulties."
L["Search Hints:"] = "Search Hints:"
L["\"raid\" will show all mounts that can be collected from a raid"] = "\"raid\" will show all mounts that can be collected from a raid"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = "\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = "\"fel\" will show all mounts and instances that contain \"fel\" in the name"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = "\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = "\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"
L["Shares lockout with:"] = "Shares lockout with:"
L["View in mount journal"] = "View in mount journal"
L["View in encounter journal"] = "View in encounter journal"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."