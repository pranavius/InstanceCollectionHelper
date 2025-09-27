local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "deDE")

if not L then return end

-- Mount Notes --- 
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Verfügbar im normalen Schwierigkeitsgrad für klassiche Schlachtzüge. Heroisch sollte jedoch eingestellt werden, wenn die "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Erste Dame der Lebensbinderin").." noch nicht erbeutet wurde."
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Beute von Trash-Gegnern rund um den "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Tempel von Ahn'Qiraj")
L["Also obtainable in Timewalking"] = "Auch in Zeitwanderungen erhältlich."
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Erhältlich im Schlachtzugsbrowser (LFR) durch das Besiegen von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Lady Jaina Prachtmeer")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Droppt für "..WrapTextInColor("Allianz", PLAYER_FACTION_COLOR_ALLIANCE).."-Charaktere, aber beim Erhalt bekommt man auch die "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).."-Version."
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Droppt für "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE).."-Charaktere, aber beim Erhalt bekommt man auch die "..WrapTextInColor("Allianz", PLAYER_FACTION_COLOR_ALLIANCE).."-Version."
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Beim Betreten der Instanz wird die Schlachtzugsschwierigkeit automatisch auf Normal gesetzt."
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Nicht mit den Titanenwächtern sprechen, sonst kann dieses Reittier nicht erbeutet werden."
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Erfordert das Abschließen bestimmter Ziele innerhalb eines bestimmten Zeitrahmens. Es wird empfohlen, online nach einem Leitfaden zu suchen, um dieses Reittier zu erhalten."
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Der Eingang befindet sich entweder in "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." oder im "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Tal der Ewigen Blüten")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Erfordert den Abschluss der Tazavesh-Handlung, um den Flugpunkt von Oribos freizuschalten, beginnend mit |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(C_QuestLog.GetTitleForQuestID(63976) or "Al'ter Gauner von Oribos")
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Erfordert das Abschließen einer kurzen Questreihe nach dem Plündern von "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Defekter Mechanzug]"))

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Beute von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Doktor Theolen Krastinov")..", der nach dem Töten von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Blutrippe").." mit zufälliger Chance spawnen kann"
L["Dropped by the Rare Elite Vixx the Collector"] = "Beute von dem seltenen Elitegegner "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vizz der Sammler")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Dieser Gegenstand ist erhältlich, obwohl er nicht in der Beutetabelle von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan").." erscheint"
L["Can drop from every boss in the dungeon"] = "Kann von jedem Boss im Verlies fallen"
L["Can only be looted and used by a Druid"] = "Kann nur von einem "..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID")).." geplündert und benutzt werden"
L["Can also be looting by fishing within the instance"] = "Kann auch durch Angeln innerhalb der Instanz erbeutet werden"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Erfordert den Abschluss der Errungenschaft "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Dies ist nur in der Classic-Version von Scholomance sammelbar. Falls die Instanz nicht freigeschaltet ist, suche zuerst online nach einer Anleitung."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Beute vom versteckten Boss "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Endgenieur Omegadraht")
L["It is highly recommended to attempt this encounter with a full party"] = "Es wird dringend empfohlen, diesen Kampf mit einer vollen Gruppe zu versuchen"
L["Can only be looted and used by a Demon Hunter"] = "Kann nur von einem "..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER")).." geplündert und benutzt werden"
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Beute von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos")..", der einen Teil des Weges südlich von Tarrens Mühle patrouilliert"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Es gibt Berichte, dass "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." verschwindet, nachdem Bossgegner getötet wurden; mit Vorsicht vorgehen"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Beute von Bauchfüßer zwischen "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaera").." und "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji-Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Auch in einem Gefährten-Dungeon erhältlich"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Dieser Gegenstand ist erhältlich, obwohl er nicht in der Beutetabelle von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Goldie Barontasch").." erscheint"
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "Der Eingang zur Instanz befindet sich ganz oben im Turm, wo der Wegpunkt liegt"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Drop von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Deviatwächter").." und "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Deviatverheerer").." im gesamten Dungeon"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Drop von dem seltenen Elitegegner "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than der Übelriechende")
L["Guides for how to spawn this mob can be found online"] = "Anleitungen, wie man diesen Gegner erscheinen lässt, findet man online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Drop von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Defiaspiraten").." auf dem Boot gegen Ende des Dungeons"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Drop von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Der Lantikor")..", der mit zufälliger Chance erscheint, nachdem "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Erzformer Gor'ashan").." getötet wurde"
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "Der Zugang zum Raid-Eingang erfordert das Abschließen der Quest |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or "Das Blatt wendet sich")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Drop von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sandelementare").." in Normal und Heroisch, kann aber im LFR vom "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Rat der Ältesten").." geplündert werden"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Erhältlich durch Verwendung eines "..(select(2, C_Item.GetItemInfo(33865)) or DARKYELLOW_FONT_COLOR:WrapTextInColorCode("[Hexerstecken der Amani]")).." auf "..GREEN_FONT_COLOR:WrapTextInColorCode("Urwaldfrösche")
L["Detailed guides for how to obtain this pet can be found online"] = "Detaillierte Anleitungen, wie man dieses Haustier erhält, findet man online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Dieser Gegenstand ist erhältlich, obwohl er nicht in der Beutetabelle von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Drachen des Alptraums").." erscheint"
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Dieses Haustier braucht 3 Tage zum Schlüpfen, nachdem man "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Lebensfähiges Kobraei]")).." geplündert hat"
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Dieser Gegenstand ist erhältlich, obwohl er nicht in der Beutetabelle von "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Graf Denathrius").." erscheint"

--- Instance Difficulties --- 
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroisch"
L["Mythic"] = "Mythisch"
L["10 player"] = "10 Spieler"
L["10 Player (Heroic)"] = "10 Spieler (Heroisch)"
L["25 player"] = "25 Spieler"
L["25 Player (Heroic)"] = "25 Spieler (Heroisch)"
L["40 player"] = "40 Spieler"
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
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Verfolge verfügbare Reittiere, Spielzeuge und Haustiere in Instanzen und lege einfach die erforderliche Instanzschwierigkeit fest."
L["Type \"/ich help\" in the chat window for available slash commands"] = "Gib \"/ich help\" im Chatfenster ein, um verfügbare Befehle zu sehen."

-- Special Search Terms --
L["dungeon"] = "dungeon"
L["raid"] = "raid"

--- UI --- 
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Suche nach Reittier-/Instanznamen, Instanztyp, Schwierigkeit oder Erweiterung"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Suche nach Spielzeug-/Instanznamen, Instanztyp, Schwierigkeit oder Erweiterung"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Suche nach Haustier-/Instanznamen, Instanztyp, Schwierigkeit oder Erweiterung"
L["Scale"] = "Skalierung"
L["Use TomTom waypoints"] = "TomTom-Wegpunkte verwenden"
L["Show Owned"] = "Gesammelte Artikel anzeigen"
L["How To Use:"] = "Anleitung:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Finde das gewünschte Sammelobjekte in der Liste und klicke auf den Button für die gewünschte Schwierigkeit."
L["to make sure it is updated."] = "um sicherzustellen, dass sie aktualisiert ist."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Wenn du für eine bestimmte Schwierigkeit gesperrt bist, wird der Button für diese Schwierigkeit deaktiviert."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Ein Button wird auch für alte Schlachtzüge deaktiviert, die auf einer anderen Schwierigkeit abgeschlossen wurden, da diese Sperren"
L["are shared across difficulties."] = "über die Schwierigkeitsgrade hinweg geteilt werden."
L["Search Hints:"] = "Suchhinweise:"
L["\"raid\" will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"raid\"").." zeigt alle Sammelobjekte, die aus einem Schlachtzug gesammelt werden können."
L["\"10\" will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." zeigt alle Sammelobjekte, die aus einem klassischen 10-Spieler-Schlachtzug (Normal oder Heroisch) gesammelt werden können."
L["\"fel\" will show all collectibles and instances that contain \"fel\" in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." zeigt alle Sammelobjekte und Instanzen, die \"fel\" im Namen enthalten."
L["\"mythic\" will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mythisch\"").." zeigt alle Sammelobjekte, die aus einem mythischen Dungeon oder Schlachtzug gesammelt werden können."
L["\"lfr\" will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." zeigt alle Sammelobjekte, die im Schlachtzugsbrowser (LFR) gesammelt werden können."
L["\"wotlk\" or \"wrath\" will show all collectibles that can be obtained from Wrath of the Lich King instances"] = "\"wotlk\" oder \"wrath\" zeigt alle Sammelobjekte, die in Instanzen von Wrath of the Lich King erhalten werden können"
L["Name"] = "Name"
L["Instance"] = "Instanz"
L["Available Difficulty(s)"] = "Schwierigkeit(en)"
L["Shares lockout with:"] = "Teilt ID-Sperre mit:"
L["View in encounter journal"] = "Im Dungeon-Kompendium anzeigen"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Dieser Button dient nur zur Verfolgung einer Schlachtzugsbrowser-Sperre (LFR). Die Schlachtzugsschwierigkeit wurde nicht geändert."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Die Wegpunktverfolgung auf der Minimap erscheint möglicherweise nicht immer, bis du dich in einer bestimmten Zone befindest."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Zum Beispiel erscheint eine Wegpunktmarkierung, die auf den Thron des Donners zeigt, nur wenn du dich auf der Insel des Donners befindest."
L["Set map pin"] = "Kartenmarkierung setzen"
L["Set TomTom waypoint"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom").."-Wegpunkt setzen"
L["Coming soon"] = "Demnächst"

--- About ---
L["About the AddOn"] = "Über das AddOn"
L["Created by Pranavius"] = "Erstellt von Pranavius"
L["Translations:"] = "Übersetzungen:"
L["Open ICH"] = "ICH öffnen"
L["Close"] = "Schließen"

--- Deprecated: to be removed in future release once it has been confirmed they are not needed or used ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 10-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 25-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "Diesen Schlachtzug gibt es nur in 40-Spieler-Schwierigkeit. Daher kann jede Schlachtzugsschwierigkeit vor dem Betreten der Instanz eingestellt werden."
L["Search by mount/instance name, instance type, or difficulty"] = "Suche nach Reittier-/Instanzname, Instanztyp oder Schwierigkeit"
L["Search by toy/instance name, instance type, or difficulty"] = "Suche nach Spielzeug-/Instanzname, Instanztyp oder Schwierigkeit"
L["Show Owned Mounts"] = "Gesammelte Reittiere anzeigen"
L["View in mount journal"] = "In Reittiersammlung anzeigen"
L["Track available mounts from instances and easily set required instance difficulty"] = "Verfolge verfügbare Reittiere aus Instanzen und stelle einfach die benötigte Instanz-Schwierigkeit ein."
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Finde das gewünschte Reittier in der Liste und klicke auf den Button für die gewünschte Schwierigkeit."
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "Wenn du für ein Reittier auf einer bestimmten Schwierigkeit gesperrt bist, wird der Button für diese Schwierigkeit deaktiviert."
L["\"raid\" will show all mounts that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"raid\"").." zeigt alle Reittiere, die aus einem Schlachtzug gesammelt werden können."
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." zeigt alle Reittiere, die aus einem klassischen 10-Spieler-Schlachtzug (Normal oder Heroisch) gesammelt werden können."
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." zeigt alle Reittiere und Instanzen, die \"fel\" im Namen enthalten."
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mythisch\"").." zeigt alle Reittiere, die aus einem mythischen Dungeon oder Schlachtzug gesammelt werden können."
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." zeigt alle Reittiere, die im Schlachtzugsbrowser (LFR) gesammelt werden können."
