local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "deDE")

if not L then return end

-- Mount Notes --- 
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 10-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 25-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Verfügbar im normalen Schwierigkeitsgrad für klassiche Schlachtzüge. Heroisch sollte jedoch eingestellt werden, wenn die "..WrapTextInColor("Erste Dame der Lebensbinderin", DARKYELLOW_FONT_COLOR).." noch nicht erbeutet wurde."
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Beute von Trash-Gegnern rund um den "..WrapTextInColor("Tempel von Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 40-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["Also obtainable in Timewalking"] = "Auch in Zeitwanderungen erhältlich."
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Erhältlich im Schlachtzugsbrowser (LFR) durch das Besiegen von "..WrapTextInColor("Lady Jaina Prachtmeer", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Droppt für "..WrapTextInColor("Allianz", PLAYER_FACTION_COLOR_ALLIANCE).."-Charaktere, aber beim Erhalt bekommt man auch die "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).."-Version."
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Droppt für "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).."-Charaktere, aber beim Erhalt bekommt man auch die "..WrapTextInColor("Allianz", PLAYER_FACTION_COLOR_ALLIANCE).."-Version."
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Beim Betreten der Instanz wird die Schlachtzugsschwierigkeit automatisch auf Normal gesetzt."
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Erfordert den Abschluss der Tazavesh-Handlung, um den Flugpunkt von Oribos freizuschalten, beginnend mit |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos", DARKYELLOW_FONT_COLOR)

--- Instance Difficulties --- 
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroisch"
L["Mythic"] = "Mythisch"
L["10 player"] = "10 Spieler"
L["10 Player (Heroic)"] = "10 Spieler (Heroisch)"
L["25 player"] = "25 Spieler"
L["25 Player (Heroic)"] = "25 Spieler (Heroisch)"
L["Unknown"] = "Unbekannt"

--- Chat Messages --- 
L["Dungeon Difficulty is already set to"] = "Dungeon-Schwierigkeit bereits gesetzt auf"
L["Legacy Raid Difficulty is already set to"] = "Schwierigkeit für klassiche Schlachtzüge bereits gesetzt auf"
L["Raid Difficulty is already set to"] = "Schlachtzugsschwierigkeit bereits gesetzt auf"
L["Current Instance Difficulties"] = "Aktuelle Instanz-Schwierigkeiten"
L["Dungeon Difficulty:"] = "Dungeon-Schwierigkeit:"
L["Legacy Raid Difficulty:"] = "Schwierigkeit für alte Schlachtzüge:"
L["Raid Difficulty:"] = "Schlachtzugsschwierigkeit:"
L["Invalid dungeon difficulty provided."] = "Ungültige Dungeon-Schwierigkeit angegeben."
L["Invalid legacy raid difficulty provided."] = "Ungültige Schwierigkeit für klassiche Schlachtzüge angegeben."
L["Invalid raid difficulty provided."] = "Ungültige Schlachtzugsschwierigkeit angegeben."
L["Accepted values:"] = "Akzeptierte Werte:"
L["Show/hide the minimap icon"] = "Minimap-Symbol zeigen/verbergen"
L["Updated available mount list"] = "Verfügbare Reittierliste aktualisiert"
L["Map pin set for"] = "Wegpunkt gesetzt für"
L["Unable to set map pin for"] = "Wegpunkt konnte nicht gesetzt werden für"
L["TomTom waypoint set for"] = "TomTom-Wegpunkt gesetzt für"
L["Unable to set TomTom waypoint for"] = "TomTom-Wegpunkt konnte nicht gesetzt werden fürr"

--- Slash Commands --- 
L["Display all current instance difficulties"] = "Zeige alle aktuellen Instanz-Schwierigkeiten"
L["Set dungeon difficulty."] = "Dungeon-Schwierigkeit festlegen."
L["Set legacy raid difficulty."] = "Klassiche Schlatzugsschwierigkeit festlegen."
L["Set raid difficulty."] = "Schlachtzugsschwierigkeit festlegen."
L["Show/hide the minimap icon"] = "Minimap-Symbol zeigen/verbergen."

--- Icon Tooltip --- 
L["Track available mounts from instances and easily set required instance difficulty"] = "Verfolge verfügbare Reittiere aus Instanzen und stelle einfach die benötigte Instanz-Schwierigkeit ein."
L["Type \"/ich help\" in the chat window for available slash commands"] = "Gib \"/ich help\" im Chatfenster ein, um verfügbare Befehle zu sehen."

-- Special Search Terms --
L["dungeon"] = "dungeon"
L["raid"] = "raid"

--- UI --- 
L["Search by mount/instance name, instance type, or difficulty"] = "Suche nach Reittier-/Instanzname, Instanztyp oder Schwierigkeit"
L["Scale"] = "Skalierung"
L["Use TomTom waypoints"] = "TomTom-Wegpunkte verwenden"
L["Show Owned Mounts"] = "Gesammelte Reittiere anzeigen"
L["How To Use:"] = "Anleitung:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Finde das gewünschte Reittier in der Liste und klicke auf den Button für die gewünschte Schwierigkeit."
L["to make sure it is updated."] = "um sicherzustellen, dass sie aktualisiert ist."
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "Wenn du für ein Reittier auf einer bestimmten Schwierigkeit gesperrt bist, wird der Button für diese Schwierigkeit deaktiviert."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Ein Button wird auch für alte Schlachtzüge deaktiviert, die auf einer anderen Schwierigkeit abgeschlossen wurden, da diese Sperren"
L["are shared across difficulties."] = "über die Schwierigkeitsgrade hinweg geteilt werden."
L["Search Hints:"] = "Suchhinweise:"
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"raid\"", DARKYELLOW_FONT_COLOR).." zeigt alle Reittiere, die aus einem Schlachtzug gesammelt werden können."
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." zeigt alle Reittiere, die aus einem klassischen 10-Spieler-Schlachtzug (Normal oder Heroisch) gesammelt werden können."
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." zeigt alle Reittiere und Instanzen, die \"fel\" im Namen enthalten."
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mythisch\"", DARKYELLOW_FONT_COLOR).." zeigt alle Reittiere, die aus einem mythischen Dungeon oder Schlachtzug gesammelt werden können."
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." zeigt alle Reittiere, die im Schlachtzugsbrowser (LFR) gesammelt werden können."
L["Name"] = "Name"
L["Instance"] = "Instanz"
L["Available Difficulty(s)"] = "Schwierigkeit(en)"
L["Shares lockout with:"] = "Teilt ID-Sperre mit:"
L["View in mount journal"] = "In Reittiersammlung anzeigen"
L["View in encounter journal"] = "Im Dungeon-Kompendium anzeigen"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Dieser Button dient nur zur Verfolgung einer Schlachtzugsbrowser-Sperre (LFR). Die Schlachtzugsschwierigkeit wurde nicht geändert."
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Erfordert das Abschließen bestimmter Ziele innerhalb eines bestimmten Zeitrahmens. Es wird empfohlen, online nach einem Leitfaden zu suchen, um dieses Reittier zu erhalten."
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Nicht mit den Titanenwächtern sprechen, sonst kann dieses Reittier nicht erbeutet werden."
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Der Eingang befindet sich entweder in "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." oder im "..WrapTextInColor("Tal der Ewigen Blüten", DARKYELLOW_FONT_COLOR)
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Die Wegpunktverfolgung auf der Minimap erscheint möglicherweise nicht immer, bis du dich in einer bestimmten Zone befindest."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Zum Beispiel erscheint eine Wegpunktmarkierung, die auf den Thron des Donners zeigt, nur wenn du dich auf der Insel des Donners befindest."
L["Set map pin"] = "Kartenmarkierung setzen"
L["Set TomTom waypoint"] = WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR).."-Wegpunkt setzen"