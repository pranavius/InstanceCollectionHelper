local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "itIT")

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
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponibile in difficoltà incursione eredità Normale, ma deve essere impostato su Eroico se "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ancella della Protettrice della Vita").." non è ancora stata ottenuta"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Si ottiene dai mob normali intorno al "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Tempio di Ahn'qiraj")
L["Also obtainable in Timewalking"] = "Ottenibile anche nel Camminacronos"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Ottenibile in difficoltà Cercaincursione (LFR) sconfiggendo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dama Jaina Marefiero")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Si ottiene per i personaggi dell'"..WrapTextInColor("Alleanza", PLAYER_FACTION_COLOR_ALLIANCE)..", ma ottenendolo si ottiene anche la versione dell'"..WrapTextInColor("Orda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Si ottiene per i personaggi dell'"..WrapTextInColor("Orda", PLAYER_FACTION_COLOR_HORDE)..", ma ottenendolo si ottiene anche la versione dell'"..WrapTextInColor("Alleanza", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "All'ingresso nell'istanza, la difficoltà incursione verrà automaticamente impostata su Normale"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Non parlare con nessuno dei Custodi Titani, altrimenti questa cavalcatura non sarà disponibile come bottino"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Richiede il completamento di determinati obiettivi entro un certo tempo, quindi si consiglia di cercare una guida online per ottenere questa cavalcatura prima di tentare"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "L'ingresso può trovarsi in "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." o nella "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vallata dell'Eterna Primavera")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Richiede il completamento della storia di Tazavesh per sbloccare il percorso di volo, iniziando con |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "Il gatto di Oribos") -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Richiede il completamento di una breve catena di missioni dopo aver saccheggiato "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Mecatuta malfunzionante]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Richiede il completamento della spedizione dopo aver attivato la modalità difficile. Le guide su come farlo possono essere trovate online."
L["Clear the dungeon solo, then return to the area where Domina Venomblade was and interact with the Curious Slime Serpent."] = "Completa la spedizione in solitaria, poi torna nell'area dove si trovava "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Domina Lamatossica").." e interagisci con il "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Curioso serpente di melma").."."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Si ottiene dal "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dottor Theolen Krastinov")..", che ha una probabilità casuale di apparire dopo aver ucciso "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Scuotiossa")
L["Dropped by the Rare Elite Vixx the Collector"] = "Si ottiene dall'élite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vixx il Collezionista")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Questo oggetto è ottenibile anche se non appare nella tabella del bottino di "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan")
L["Can drop from every boss in the dungeon"] = "Può cadere da ogni boss nella spedizione"
L["Can only be looted and used by a Druid"] = "Può essere saccheggiato e usato solo da un "..WrapTextInColor(ICH_GetClassName(11, "Druid"), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Può essere ottenuto anche pescando all'interno dell'istanza"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Richiede il completamento del traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "È collezionabile solo nella versione classica di Scholomance. Se non hai questa istanza sbloccata, cerca prima una guida online."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Si ottiene dal boss nascosto "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Fingegnere Omeganoid")
L["It is highly recommended to attempt this encounter with a full party"] = "È vivamente consigliato affrontare questo scontro con un gruppo completo"
L["Can only be looted and used by a Demon Hunter"] = "Può essere saccheggiato e usato solo da un "..WrapTextInColor(ICH_GetClassName(12, "Demon Hunter"), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Si ottiene da "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." che pattuglia parte del percorso a sud di Mulino Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Ci sono alcune segnalazioni di "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." che scompare dopo che alcuni boss vengono uccisi; procedere con cautela"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Si ottiene dai mob Gastropode che si trovano tra "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaera").." e "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji-Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Ottenibile anche in una spedizione con seguaci"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Questo oggetto è ottenibile anche se non appare nella tabella del bottino di "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dora Bottepiena")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "L'ingresso dell'istanza si trova in cima alla torre dove si trova il waypoint"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Si ottiene dai "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Guardiani Degeneri").." e dai "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Devastatori Degeneri").." in tutta la spedizione"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Si ottiene dall'élite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than il Maleodorante")
L["Guides for how to spawn this mob can be found online"] = "Le guide su come far apparire questo mob possono essere trovate online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Si ottiene dai "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Pirati dei Defias").." sulla barca verso la fine della spedizione"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Si ottiene da "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("La Lanticora")..", che ha una probabilità casuale di apparire dopo aver ucciso "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Plasmarocce Gor'ashan")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "L'accesso all'ingresso dell'incursione richiede il completamento della missione |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "La marea volta" or "Quando la marea volta")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Si ottiene dagli "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Elementali di sabbia").." in Normale e Eroico, ma può essere saccheggiato dal "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Concilio degli Anziani").." in LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Si ottiene usando "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Bacchetta dell'ammaliamento Amani]")).." sulle "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Rane delle Foreste")
L["Detailed guides for how to obtain this pet can be found online"] = "Le guide dettagliate su come ottenere questo compagno possono essere trovate online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Questo oggetto è ottenibile anche se non appare nella tabella del bottino dei "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Draghi dell'Incubo")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Questo compagno impiega 3 giorni a schiudersi dopo aver saccheggiato "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Uovo di cobra vitale]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Questo oggetto è ottenibile anche se non appare nella tabella del bottino di "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sire Denathrius")

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "Normale"
L["Heroic"] = "Eroico"
L["Mythic"] = "Mitico"
L["10 player"] = "10 giocatori"
L["10 Player (Heroic)"] = "10 giocatori (Eroico)"
L["25 player"] = "25 giocatori"
L["25 Player (Heroic)"] = "25 giocatori (Eroico)"
L["40 player"] = "40 giocatori"
L["Unknown"] = "Sconosciuto"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "La difficoltà della spedizione è già impostata su"
L["Legacy Raid Difficulty is already set to"] = "La difficoltà dell'incursione eredità è già impostata su"
L["Raid Difficulty is already set to"] = "La difficoltà dell'incursione è già impostata su"
L["Current Instance Difficulties"] = "Difficoltà istanza attuali"
L["Dungeon Difficulty:"] = "Difficoltà spedizione:"
L["Legacy Raid Difficulty:"] = "Difficoltà incursione eredità:"
L["Raid Difficulty:"] = "Difficoltà incursione:"
L["Invalid dungeon difficulty provided."] = "Difficoltà spedizione fornita non valida."
L["Invalid legacy raid difficulty provided."] = "Difficoltà incursione eredità fornita non valida."
L["Invalid raid difficulty provided."] = "Difficoltà incursione fornita non valida."
L["Accepted values:"] = "Valori accettati:"
L["Show/hide the minimap icon"] = "Mostra/nascondi l'icona della minimappa"
L["Updated available mount list"] = "Lista cavalcature disponibili aggiornata" -- Currently unused
L["Map pin set for"] = "Spillo mappa impostato per"
L["Unable to set map pin for"] = "Impossibile impostare lo spillo mappa per"
L["TomTom waypoint set for"] = "Waypoint TomTom impostato per"
L["Unable to set TomTom waypoint for"] = "Impossibile impostare il waypoint TomTom per"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Mostra tutte le difficoltà istanza attuali"
L["Set dungeon difficulty."] = "Imposta difficoltà spedizione."
L["Set legacy raid difficulty."] = "Imposta difficoltà incursione eredità."
L["Set raid difficulty."] = "Imposta difficoltà incursione."

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Traccia cavalcature, giocattoli e compagni disponibili dalle istanze e imposta facilmente la difficoltà istanza richiesta"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Digita \"/ich help\" nella finestra chat per i comandi disponibili"

-- Special Search Terms --
L["dungeon"] = "spedizione"
L["raid"] = "incursione"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Cerca per nome cavalcatura/istanza, tipo istanza, difficoltà o espansione"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Cerca per nome giocattolo/istanza, tipo istanza, difficoltà o espansione"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Cerca per nome compagno/istanza, tipo istanza, difficoltà o espansione"
L["Scale"] = "Scala"
L["Use TomTom waypoints"] = "Usa waypoint TomTom"
L["Show Owned"] = "Mostra posseduti"
L["How To Use:"] = "Come usare:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Trova il collezionabile desiderato nella lista e clicca sul pulsante per la difficoltà scelta"
L["to make sure it is updated."] = "per assicurarti che sia aggiornata."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Quando sei bloccato su una difficoltà particolare, il pulsante per quella difficoltà sarà disabilitato."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Un pulsante sarà disabilitato anche per le incursioni eredità completate in un'altra difficoltà poiché quei blocchi"
L["are shared across difficulties."] = "sono condivisi tra le difficoltà."
L["Search Hints:"] = "Suggerimenti di ricerca:"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"incursione\"").." mostrerà tutti i collezionabili ottenibili da un'incursione"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." mostrerà tutti i collezionabili ottenibili da un'incursione eredità da 10 giocatori (Normale o Eroico)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." mostrerà tutti i collezionabili e le istanze che contengono \"fel\" nel nome"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mitico\"").." mostrerà tutti i collezionabili ottenibili da una spedizione o incursione Mitica"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." mostrerà tutti i collezionabili ottenibili dalle incursioni in difficoltà Cercaincursione (LFR)"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." o "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." mostrerà tutti i collezionabili ottenibili dalle istanze di Wrath of the Lich King"
L["Name"] = "Nome"
L["Instance"] = "Istanza"
L["Available Difficulty(s)"] = "Difficoltà disponibile/i"
L["Shares lockout with:"] = "Condivide blocco con:"
L["View in encounter journal"] = "Visualizza nel diario degli scontri"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Questo pulsante serve solo per tracciare un blocco del Cercaincursione (LFR). La difficoltà dell'incursione non è stata modificata."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Il tracciamento del waypoint sulla minimappa potrebbe non apparire finché non sei in una zona specifica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Per esempio, una freccia che punta verso il "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Regno del Tuono").." apparirà solo quando sei sull'"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Isola del Tuono")
L["Set map pin"] = "Imposta spillo mappa"
L["Set TomTom waypoint"] = "Imposta waypoint di "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom")
L["Coming soon"] = "Prossimamente"

--- About ---
L["About the AddOn"] = "Informazioni sull'AddOn"
L["Created by Pranavius"] = "Creato da Pranavius"
L["Translations:"] = "Traduzioni:"
L["Open ICH"] = "Apri ICH"
L["Close"] = "Chiudi"

--- Timewalking Vendor ---
L["Type"] = "Tipo"
L["Expansion"] = "Espansione"
L["Cost"] = "Costo"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = "Probabilità casuale di ottenere aprendo una "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sacca di Attrezzature da Pesca")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Originariamente assegnato completando il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Ora può essere acquistato da qualsiasi Mercante del Camminacronos"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Originariamente assegnato completando il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Ora può essere acquistato da qualsiasi Mercante del Camminacronos"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Originariamente assegnato completando il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Ora può essere acquistato da qualsiasi Mercante del Camminacronos"
L["Special Thanks"] = "Ringraziamenti speciali"
L["Mount"] = "Cavalcatura"
L["Pet"] = "Compagno"
L["Toy"] = "Giocattolo"
L["Timewalking Vendor"] = "Mercante del Camminacronos"
L["Unable to transfer Timewarped Badges to this character right now."] = "Impossibile trasferire le "..ICH_GetCurrencyName(1166, "Timewarped Badges").." su questo personaggio al momento."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "Impossibile aprire il menu di trasferimento valuta. Aprilo manualmente o riprova."
L["Click to open currency transfer menu"] = "Clicca per aprire il menu di trasferimento valuta"
L["Cannot transfer to this character"] = "Impossibile trasferire a questo personaggio"

--- Legion Remix ---
L["Legion: Remix Vendor"] = "Mercante di Legion: Remix"
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(6, "Cavaliere della Morte"), ICH_GetClassColor("DEATHKNIGHT")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(12, "Cacciatore di Demoni"), ICH_GetClassColor("DEMONHUNTER")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(11, "Druido"), ICH_GetClassColor("DRUID")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(3, "Cacciatore"), ICH_GetClassColor("HUNTER")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(8, "Mago"), ICH_GetClassColor("MAGE")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(10, "Monaco"), ICH_GetClassColor("MONK")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(2, "Paladino"), ICH_GetClassColor("PALADIN")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(5, "Sacerdote"), ICH_GetClassColor("PRIEST")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(4, "Ladro"), ICH_GetClassColor("ROGUE")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(7, "Sciamano"), ICH_GetClassColor("SHAMAN")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(9, "Stregone"), ICH_GetClassColor("WARLOCK")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Ottenibile gratuitamente raggiungendo il livello 80 con un Corritempo "..WrapTextInColor(ICH_GetClassName(1, "Guerriero"), ICH_GetClassColor("WARRIOR")).." e ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "Questo compagno è una ricompensa da una catena di missioni avviata dall'oggetto "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", acquistabile dal mercante."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Contrassegnato come esclusivo dell'evento poiché ottenibile solo durante l'evento pre-patch di Legion."
L["Available In"] = "Disponibile in"
L["Event Exclusive"] = "Esclusivo dell'evento"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Cerca per nome/tipo collezionabile o espansione"
L["Unable to transfer Bronze to this character right now."] = "Impossibile trasferire il "..ICH_GetCurrencyName(3252, "Bronze").." su questo personaggio al momento."
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Si ottiene tramite la catena di missioni avviata da "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]"))..", acquistabile dal mercante."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "È notevolmente più facile da ottenere in Legion: Remix poiché gli oggetti necessari per la catena di missioni vengono consegnati al momento dell'acquisto."

--- Decor ---
L["Decor"] = "Decorazione"
L["Obtainable for free by earning the achievement Broken Isles World Quests V"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42674)) or "Broken Isles World Quests V")
L["Obtainable for free by earning the achievement Legion Remix Raids"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42321)) or "Legion Remix Raids")
L["Obtainable for free by earning the achievement The Armies of Legionfall"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42655)) or "The Armies of Legionfall")
L["Obtainable for free by earning the achievement Argussian Reach"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42627)) or "Argussian Reach")
L["Obtainable for free by earning the achievement Timeworn Keystone Master"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42689)) or "Timeworn Keystone Master")
L["Obtainable for free by earning the achievement Highmountain Tribe"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42547)) or "Highmountain Tribe")
L["Obtainable for free by earning the achievement Defending the Broken Isles III"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42675)) or "Defending the Broken Isles III")
L["Obtainable for free by earning the achievement The Nightfallen"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42628)) or "The Nightfallen")
L["Obtainable for free by earning the achievement Dreamweavers"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42619)) or "Dreamweavers")
L["Obtainable for free by earning the achievement Power of the Obelisks II"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61060)) or "Power of the Obelisks II")
L["Obtainable for free by earning the achievement Broken Isles Dungeoneer"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42692)) or "Broken Isles Dungeoneer")
L["Obtainable for free by earning the achievement Heroic Broken Isles World Quests III"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61054)) or "Heroic Broken Isles World Quests III")
L["Obtainable for free by earning the achievement The Wardens"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61218)) or "The Wardens")
L["Obtainable for free by earning the achievement Court of Farondis"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42318)) or "Court of Farondis")
L["Obtainable for free by earning the achievement Valarjar"] = "Ottenibile gratuitamente ottenendo il traguardo "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42658)) or "Valarjar")
L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"] = "All'ingresso nell'istanza, la difficoltà spedizione verrà automaticamente impostata su Normale"
L["Dropped by Vanessa VanCleef on Heroic difficulty"] = "Ottenuto da "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vanessa VanCleef").." in difficoltà Eroico"
