local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "frFR")

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
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponible en difficulté de raid héritage Normal, mais doit être défini sur Héroïque si "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Suivante de la Lieuse-de-Vie").." n'a pas encore été obtenu"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Obtenu des trash mobs autour du "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Temple d'Ahn'Qiraj")
L["Also obtainable in Timewalking"] = "Également obtenable en Voyage dans le temps"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtenable en difficulté Groupe de raid (LFR) en tuant "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dame Jaina Portvaillant")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Obtenu pour les personnages de "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE)..", mais l'obtenir vous donne également la version "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Obtenu pour les personnages de "..WrapTextInColor("Horde", PLAYER_FACTION_COLOR_HORDE)..", mais l'obtenir vous donne également la version "..WrapTextInColor("Alliance", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "En entrant dans l'instance, la difficulté du raid sera automatiquement définie sur Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Ne parlez à aucun des Gardiens Titans, sinon cette monture n'apparaîtra pas dans le butin"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Nécessite de compléter certains objectifs dans un temps imparti, il est donc recommandé de rechercher un guide en ligne pour obtenir cette monture avant de tenter l'aventure"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "L'entrée peut se trouver dans "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." ou dans le "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Val de l'Éternel printemps")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Nécessite de compléter l'histoire de Tazavesh pour déverrouiller la route de vol, en commençant par |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "Le chat de gouttière d'Oribos") -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Nécessite de compléter une courte chaîne de quêtes après avoir pillé "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Combinaison mécanique défaillante]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Nécessite de compléter le donjon après avoir activé le mode difficile. Des guides expliquant comment procéder peuvent être trouvés en ligne."
L["Clear the dungeon solo, then return to the area where Domina Venomblade was and interact with the Curious Slime Serpent."] = "Terminez le donjon en solo, puis retournez à l'endroit où se trouvait "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Domina Lamevenin").." et interagissez avec le "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Curieux serpent visqueux").."."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Obtenu du "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Docteur Theolen Krastinov")..", qui a une chance aléatoire d'apparaître après avoir tué "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Cliquettripes")
L["Dropped by the Rare Elite Vixx the Collector"] = "Obtenu de l'élite rare "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vixx le Collectionneur")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Cet objet est obtenable même s'il n'apparaît pas dans la table de butin de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan")
L["Can drop from every boss in the dungeon"] = "Peut tomber de n'importe quel boss du donjon"
L["Can only be looted and used by a Druid"] = "Ne peut être pillé et utilisé que par un "..WrapTextInColor(ICH_GetClassName(11, "Druide"), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Peut également être obtenu en pêchant dans l'instance"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Nécessite de compléter l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Ce jouet ne peut être collecté que dans la version classique de Scholomance. Si vous n'avez pas cette instance déverrouillée, cherchez d'abord un guide en ligne."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Obtenu du boss caché "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Fingénieur Plomboméga")
L["It is highly recommended to attempt this encounter with a full party"] = "Il est fortement recommandé d'affronter ce boss avec un groupe complet"
L["Can only be looted and used by a Demon Hunter"] = "Ne peut être pillé et utilisé que par un "..WrapTextInColor(ICH_GetClassName(12, "Chasseur de démons"), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Obtenu de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." qui patrouille une partie du chemin au sud du Moulin de Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Des rapports indiquent que "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." disparaît après la mort de certains boss ; procédez avec prudence"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Obtenu des mobs Gastéropodes trouvés entre "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaera").." et "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Également obtenable dans un donjon avec des suivants"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Cet objet est obtenable même s'il n'apparaît pas dans la table de butin de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Goldie Baronnie")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "L'entrée de l'instance se trouve tout en haut de la tour où se trouve le point de passage"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Obtenu des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gardiens déviants").." et des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ravageurs déviants").." dans tout le donjon"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Obtenu de l'élite rare "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than le Malodorant")
L["Guides for how to spawn this mob can be found online"] = "Des guides expliquant comment faire apparaître ce mob peuvent être trouvés en ligne"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Obtenu des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Pirates défias").." sur le bateau vers la fin du donjon"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Obtenu de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("La Lanticore")..", qui a une chance aléatoire d'apparaître après avoir tué "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Tord-minerai Gor'ashan")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "L'accès à l'entrée du raid nécessite de compléter la quête |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "La marée tourne" or "Le tournant de la marée")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Obtenu des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Élémentaires de sable").." en Normal et Héroïque, mais peut être pillé du "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Conseil des anciens").." en LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Obtenu en utilisant un "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Bâton hexensort Amani]")).." sur des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("grenouilles forestières")
L["Detailed guides for how to obtain this pet can be found online"] = "Des guides détaillés expliquant comment obtenir cette mascotte peuvent être trouvés en ligne"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Cet objet est obtenable même s'il n'apparaît pas dans la table de butin des "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dragons du Cauchemar")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Cette mascotte prend 3 jours à éclore après avoir pillé "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Œuf de cobra viable]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Cet objet est obtenable même s'il n'apparaît pas dans la table de butin de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sire Denathrius")

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Héroïque"
L["Mythic"] = "Mythique"
L["10 player"] = "10 joueurs"
L["10 Player (Heroic)"] = "10 joueurs (Héroïque)"
L["25 player"] = "25 joueurs"
L["25 Player (Heroic)"] = "25 joueurs (Héroïque)"
L["40 player"] = "40 joueurs"
L["Unknown"] = "Inconnu"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "La difficulté du donjon est déjà définie sur"
L["Legacy Raid Difficulty is already set to"] = "La difficulté du raid héritage est déjà définie sur"
L["Raid Difficulty is already set to"] = "La difficulté du raid est déjà définie sur"
L["Current Instance Difficulties"] = "Difficultés d'instance actuelles"
L["Dungeon Difficulty:"] = "Difficulté du donjon :"
L["Legacy Raid Difficulty:"] = "Difficulté du raid héritage :"
L["Raid Difficulty:"] = "Difficulté du raid :"
L["Invalid dungeon difficulty provided."] = "Difficulté de donjon fournie invalide."
L["Invalid legacy raid difficulty provided."] = "Difficulté de raid héritage fournie invalide."
L["Invalid raid difficulty provided."] = "Difficulté de raid fournie invalide."
L["Accepted values:"] = "Valeurs acceptées :"
L["Show/hide the minimap icon"] = "Afficher/masquer l'icône de la minicarte"
L["Updated available mount list"] = "Liste des montures disponibles mise à jour" -- Currently unused
L["Map pin set for"] = "Repère de carte défini pour"
L["Unable to set map pin for"] = "Impossible de définir un repère de carte pour"
L["TomTom waypoint set for"] = "Point de passage TomTom défini pour"
L["Unable to set TomTom waypoint for"] = "Impossible de définir un point de passage TomTom pour"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Afficher toutes les difficultés d'instance actuelles"
L["Set dungeon difficulty."] = "Définir la difficulté du donjon."
L["Set legacy raid difficulty."] = "Définir la difficulté du raid héritage."
L["Set raid difficulty."] = "Définir la difficulté du raid."

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Suivez les montures, jouets et mascottes disponibles dans les instances et définissez facilement la difficulté d'instance requise"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Tapez \"/ich help\" dans la fenêtre de discussion pour les commandes disponibles"

-- Special Search Terms --
L["dungeon"] = "donjon"
L["raid"] = "raid"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Rechercher par nom de monture/instance, type d'instance, difficulté ou extension"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Rechercher par nom de jouet/instance, type d'instance, difficulté ou extension"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Rechercher par nom de mascotte/instance, type d'instance, difficulté ou extension"
L["Scale"] = "Échelle"
L["Use TomTom waypoints"] = "Utiliser les points de passage TomTom"
L["Show Owned"] = "Afficher possédés"
L["How To Use:"] = "Comment utiliser :"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Trouvez le collectionnable souhaité dans la liste et cliquez sur le bouton de la difficulté souhaitée"
L["to make sure it is updated."] = "pour vous assurer qu'elle est mise à jour."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Lorsque vous êtes verrouillé sur une difficulté particulière, le bouton de cette difficulté sera désactivé."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Un bouton sera également désactivé pour les raids héritage effectués en d'autre difficulté car ces verrouillages"
L["are shared across difficulties."] = "sont partagés entre les difficultés."
L["Search Hints:"] = "Conseils de recherche :"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"raid\"").." montrera tous les collectionnables obtenables dans un raid"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." montrera tous les collectionnables obtenables dans un raid héritage 10 joueurs (Normal ou Héroïque)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." montrera tous les collectionnables et instances contenant \"fel\" dans le nom"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mythique\"").." montrera tous les collectionnables obtenables dans un donjon ou raid Mythique"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." montrera tous les collectionnables obtenables dans les raids en difficulté Groupe de raid (LFR)"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." ou "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." montrera tous les collectionnables obtenables dans les instances de Wrath of the Lich King"
L["Name"] = "Nom"
L["Instance"] = "Instance"
L["Available Difficulty(s)"] = "Difficulté(s) disponible(s)"
L["Shares lockout with:"] = "Partage le verrouillage avec :"
L["View in encounter journal"] = "Voir dans le journal des rencontres"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Ce bouton sert uniquement au suivi d'un verrouillage de Groupe de raid (LFR). La difficulté du raid n'a pas été modifiée."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Le suivi de point de passage sur la minicarte peut ne pas s'afficher tant que vous n'êtes pas dans une zone spécifique."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Par exemple, une flèche pointant vers le "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Trône du tonnerre").." n'apparaîtra que lorsque vous vous trouvez sur l'"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Île du Tonnerre")
L["Set map pin"] = "Définir un repère sur la carte"
L["Set TomTom waypoint"] = "Définir un point de passage "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom")
L["Coming soon"] = "Bientôt disponible"

--- About ---
L["About the AddOn"] = "À propos de l'AddOn"
L["Created by Pranavius"] = "Créé par Pranavius"
L["Translations:"] = "Traductions :"
L["Open ICH"] = "Ouvrir ICH"
L["Close"] = "Fermer"

--- Timewalking Vendor ---
L["Type"] = "Type"
L["Expansion"] = "Extension"
L["Cost"] = "Coût"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = "Chance aléatoire d'être obtenu en ouvrant un "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sac de trésors de pêche")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Récompense initiale de l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Peut désormais être acheté auprès de n'importe quel marchand de Voyage dans le temps."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Récompense initiale de l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Peut désormais être acheté auprès de n'importe quel marchand de Voyage dans le temps."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Récompense initiale de l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Peut désormais être acheté auprès de n'importe quel marchand de Voyage dans le temps."
L["Special Thanks"] = "Remerciements spéciaux"
L["Mount"] = "Monture"
L["Pet"] = "Mascotte"
L["Toy"] = "Jouet"
L["Timewalking Vendor"] = "Marchand de Voyage dans le temps"
L["Unable to transfer Timewarped Badges to this character right now."] = "Impossible de transférer les "..ICH_GetCurrencyName(1166, "Timewarped Badges").." sur ce personnage pour l'instant."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "Impossible d'ouvrir le menu de transfert de monnaie. Veuillez l'ouvrir manuellement ou réessayer."
L["Click to open currency transfer menu"] = "Cliquer pour ouvrir le menu de transfert de monnaie"
L["Cannot transfer to this character"] = "Impossible de transférer vers ce personnage"

--- Legion Remix ---
L["Legion: Remix Vendor"] = "Marchand de Legion : Remix"
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(6, "Chevalier de la mort"), ICH_GetClassColor("DEATHKNIGHT")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(12, "Chasseur de démons"), ICH_GetClassColor("DEMONHUNTER")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(11, "Druide"), ICH_GetClassColor("DRUID")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(3, "Chasseur"), ICH_GetClassColor("HUNTER")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(8, "Mage"), ICH_GetClassColor("MAGE")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(10, "Moine"), ICH_GetClassColor("MONK")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(2, "Paladin"), ICH_GetClassColor("PALADIN")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(5, "Prêtre"), ICH_GetClassColor("PRIEST")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(4, "Voleur"), ICH_GetClassColor("ROGUE")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(7, "Chaman"), ICH_GetClassColor("SHAMAN")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(9, "Démoniste"), ICH_GetClassColor("WARLOCK")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Obtenable gratuitement en atteignant le niveau 80 avec un Chronocoureur "..WrapTextInColor(ICH_GetClassName(1, "Guerrier"), ICH_GetClassColor("WARRIOR")).." et en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "Cette mascotte est une récompense d'une chaîne de quêtes initiée par l'objet "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", achetable auprès du marchand."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Marqué comme exclusif d'événement car uniquement disponible pendant l'événement de pré-patch de Legion."
L["Available In"] = "Disponible dans"
L["Event Exclusive"] = "Exclusif d'événement"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Rechercher par nom/type de collectionnable ou extension"
L["Unable to transfer Bronze to this character right now."] = "Impossible de transférer les "..ICH_GetCurrencyName(3252, "Bronze").." sur ce personnage pour l'instant."
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Obtenu via la chaîne de quêtes initiée par "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Invitation déchirée]"))..", achetable auprès du marchand."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "C'est considérablement plus facile à obtenir dans Legion : Remix car les objets nécessaires à la chaîne de quêtes vous sont donnés lors de l'achat de cet objet."

--- Decor ---
L["Decor"] = "Décoration"
L["Obtainable for free by earning the achievement Broken Isles World Quests V"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42674)) or "Broken Isles World Quests V")
L["Obtainable for free by earning the achievement Legion Remix Raids"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42321)) or "Legion Remix Raids")
L["Obtainable for free by earning the achievement The Armies of Legionfall"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42655)) or "The Armies of Legionfall")
L["Obtainable for free by earning the achievement Argussian Reach"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42627)) or "Argussian Reach")
L["Obtainable for free by earning the achievement Timeworn Keystone Master"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42689)) or "Timeworn Keystone Master")
L["Obtainable for free by earning the achievement Highmountain Tribe"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42547)) or "Highmountain Tribe")
L["Obtainable for free by earning the achievement Defending the Broken Isles III"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42675)) or "Defending the Broken Isles III")
L["Obtainable for free by earning the achievement The Nightfallen"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42628)) or "The Nightfallen")
L["Obtainable for free by earning the achievement Dreamweavers"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42619)) or "Dreamweavers")
L["Obtainable for free by earning the achievement Power of the Obelisks II"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61060)) or "Power of the Obelisks II")
L["Obtainable for free by earning the achievement Broken Isles Dungeoneer"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42692)) or "Broken Isles Dungeoneer")
L["Obtainable for free by earning the achievement Heroic Broken Isles World Quests III"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61054)) or "Heroic Broken Isles World Quests III")
L["Obtainable for free by earning the achievement The Wardens"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61218)) or "The Wardens")
L["Obtainable for free by earning the achievement Court of Farondis"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42318)) or "Court of Farondis")
L["Obtainable for free by earning the achievement Valarjar"] = "Obtenable gratuitement en obtenant l'accomplissement "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42658)) or "Valarjar")
L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"] = "En entrant dans l'instance, la difficulté du donjon sera automatiquement définie sur Normal"
L["Dropped by Vanessa VanCleef on Heroic difficulty"] = "Obtenu de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vanessa VanCleef").." en difficulté Héroïque"
