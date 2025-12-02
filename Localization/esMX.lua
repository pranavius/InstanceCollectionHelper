local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "esMX")

if not L then return end
--@retail@
local ICH_GetQuestName = C_QuestLog.GetTitleForQuestID
local ICH_GetClassColor = C_ClassColor.GetClassColor
--@end-retail@
--@version-mists@
local ICH_GetQuestName = C_QuestLog.GetQuestInfo
local ICH_GetClassColor = GetClassColorObj
--@end-version-mists@

--- Mount Notes ---
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponible en la dificultad de banda de legado Normal, pero debe configurarse en Heroico si "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Fámula de la Protectora").." aún no se ha obtenido"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Se obtiene de los esbirros alrededor de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Templo de Ahn'Qiraj")
L["Also obtainable in Timewalking"] = "También obtenible en Cronoviajes"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtenible en la dificultad Buscador de bandas (LFR) al derrotar a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Lady Jaina Valiente")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Se obtiene para personajes de "..WrapTextInColor("Alianza", PLAYER_FACTION_COLOR_ALLIANCE)..", pero al obtenerlo también obtienes la versión de "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Se obtiene para personajes de "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)..", pero al obtenerlo también obtienes la versión de "..WrapTextInColor("Alianza", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Al entrar en la instancia, la dificultad de banda se configurará automáticamente en Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "No hables con ninguno de los Guardianes Titanes, de lo contrario esta montura no aparecerá como botín"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Requiere completar ciertos objetivos dentro de un tiempo determinado, por lo que se recomienda buscar una guía en línea para obtener esta montura antes de intentarlo"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "La entrada puede estar en "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." o en "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Valle de la Flor Eterna")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Requiere completar la historia de Tazavesh para desbloquear la ruta de vuelo, comenzando con |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "El gato cajellero de Oribos") -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requiere completar una breve cadena de misiones después de saquear "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Mecatraje averiado]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Requiere completar el calabozo después de activar el modo difícil. Se pueden encontrar guías en línea sobre cómo hacerlo."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Doctor Theolen Krastinov")..", quien tiene una probabilidad aleatoria de aparecer tras matar a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Traquesangre")
L["Dropped by the Rare Elite Vixx the Collector"] = "Se obtiene del élite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vixx, el coleccionista")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan")
L["Can drop from every boss in the dungeon"] = "Puede caer de todos los jefes dla mazmorra"
L["Can only be looted and used by a Druid"] = "Solo puede ser saqueado y usado por un "..WrapTextInColor(select(1, GetClassInfo(11)), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "También se puede obtener pescando dentro dla mazmorra"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requiere completar el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Reliquias de un imperio caído")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Solo se puede coleccionar en la versión clásica de Scholomance. Si no tienes esta instancia desbloqueada, busca una guía en línea antes de intentarlo."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Se obtiene del jefe oculto "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Endgineer Omegaplugg")
L["It is highly recommended to attempt this encounter with a full party"] = "Se recomienda encarecidamente intentar este encuentro con un grupo completo"
L["Can only be looted and used by a Demon Hunter"] = "Solo puede ser saqueado y usado por un "..WrapTextInColor(select(1, GetClassInfo(12)), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." que patrulla parte del camino al sur de Molino Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Hay informes de que "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Don Carlos").." desaparece tras matar a algunos jefes; proceda con precaución"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Se obtiene de los Gasterópodo que se encuentran entre "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaera").." y "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "También se puede obtener en un mazmorra con seguidores"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Goldie Bonbarón")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "La entrada de la instancia está en la parte más alta de la torre donde se encuentra el waypoint"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Guardián descarriados").." y "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Devastador descarriados").." en todo la mazmorra"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Se obtiene del élite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than el Malioliente")
L["Guides for how to spawn this mob can be found online"] = "Se pueden encontrar guías en línea sobre cómo hacer aparecer a este enemigo"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Pirata Defias").." en el barco hacia el final dla mazmorra"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("La Lanticora")..", que tiene una probabilidad aleatoria de aparecer tras matar a "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Controlador de mena Gor'ashan")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "El acceso a la entrada de la banda requiere completar la misión |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "Cambia la marea" or "Un cambio en la marea")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Se obtiene de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Elementales de arena").." en Normal y Heroico, pero puede saquearse del "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Consejo de Ancianos").." en LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Se obtiene al usar un "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Vara de brujería Amani]")).." en "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ranas camperas")
L["Detailed guides for how to obtain this pet can be found online"] = "Se pueden encontrar guías detalladas en línea sobre cómo obtener esta mascota"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dragones de Pesadilla")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Esta mascota tarda 3 días en eclosionar después de saquear "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Huevo de cobra viable]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sir Denathrius")

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heroico"
L["Mythic"] = "Mítico"
L["10 player"] = "10 jugadores"
L["10 Player (Heroic)"] = "10 jugadores (Heroico)"
L["25 player"] = "25 jugadores"
L["25 Player (Heroic)"] = "25 jugadores (Heroico)"
L["40 player"] = "40 jugadores"
L["Unknown"] = "Desconocido"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "La dificultad de mazmorra ya está configurada en"
L["Legacy Raid Difficulty is already set to"] = "La dificultad de banda de legado ya está configurada en"
L["Raid Difficulty is already set to"] = "La dificultad de banda ya está configurada en"
L["Current Instance Difficulties"] = "Dificultades actuales de la instancia"
L["Dungeon Difficulty:"] = "Dificultad de mazmorra:"
L["Legacy Raid Difficulty:"] = "Dificultad de banda de legado:"
L["Raid Difficulty:"] = "Dificultad de banda:"
L["Invalid dungeon difficulty provided."] = "Se proporcionó una dificultad de mazmorra inválida."
L["Invalid legacy raid difficulty provided."] = "Se proporcionó una dificultad de banda de legado inválida."
L["Invalid raid difficulty provided."] = "Se proporcionó una dificultad de banda inválida."
L["Accepted values:"] = "Valores aceptados:"
L["Show/hide the minimap icon"] = "Mostrar/ocultar el icono del minimapa"
L["Updated available mount list"] = "Lista de monturas disponibles actualizada" -- Currently unused
L["Map pin set for"] = "Un marcador de mapa establecida para"
L["Unable to set map pin for"] = "No se puede establecer un marcador de mapa para"
L["TomTom waypoint set for"] = "Waypoint de TomTom establecida para"
L["Unable to set TomTom waypoint for"] = "No se puede establecer un waypoint de TomTom para"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Mostrar todas las dificultades actuales de la instancia"
L["Set dungeon difficulty."] = "Configurar dificultad de mazmorra."
L["Set legacy raid difficulty."] = "Configurar dificultad de banda de legado."
L["Set raid difficulty."] = "Configurar dificultad de banda."
L["Show/hide the minimap icon"] = "Mostrar/ocultar el icono del minimapa"

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Rastrear monturas, juguetes, y mascotas disponibles de instancias y configurar fácilmente la dificultad requerida de la instancia"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Escribe \"/ich help\" en la ventana de chat para ver los comandos disponibles"

-- Special Search Terms --
L["dungeon"] = "mazmorra"
L["raid"] = "banda"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Buscar por nombre de montura/instancia, tipo de instancia, dificultad o expansión"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Buscar por nombre de juguete/instancia, tipo de instancia, dificultad o expansión"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Buscar por nombre de mascota/instancia, tipo de instancia, dificultad o expansión"
L["Scale"] = "Escala"
L["Use TomTom waypoints"] = "Usar waypoints de TomTom"
L["Show Owned"] = "Mostrar artículos propios"
L["How To Use:"] = "Cómo usar:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Encuentra la coleccionable que deseas coleccionar en la lista y haz clic en el botón de la dificultad en la que quieres jugar"
L["to make sure it is updated."] = "para asegurarte de que esté actualizada."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Cuando estés bloqueado en una dificultad determinada, el botón de esa dificultad se desactivará."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Un botón también se desactivará para bandas clásicas completadas en otra dificultad ya que esos bloqueos"
L["are shared across difficulties."] = "se comparten entre dificultades."
L["Search Hints:"] = "Sugerencias de búsqueda:"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"banda\"").." mostrará todas las coleccionables que se pueden coleccionar en una banda"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." mostrará todas las coleccionables que se pueden coleccionar en una banda de legado de 10 jugadores (Normal o Heroico)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." mostrará todas las coleccionables e instancias que contengan \"fel\" en el nombre"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mítico\"").." mostrará todas las coleccionables que se pueden obtener en una mazmorra o banda Mítica"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." mostrará todas las coleccionables que se pueden obtener en bandas en dificultad Buscador de bandas (LFR)"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." o "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." mostrará todas las coleccionables que se pueden obtener en las instancias de Wrath of the Lich King"
L["Name"] = "Nombre"
L["Instance"] = "Instancia"
L["Available Difficulty(s)"] = "Dificultad(es)"
L["Shares lockout with:"] = "Comparte bloqueo con:"
L["View in encounter journal"] = "Ver en el diario de encuentros"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Este botón solo sirve para rastrear el bloqueo de Buscador de bandas (LFR). La dificultad de banda no ha cambiado."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "El seguimiento de marcador en el minimapa puede no aparecer hasta que estés en una zona específica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Por ejemplo, una flecha apuntando hacia "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Trono del Trueno").." solo aparecerá cuando estés en la "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Isla del Trueno")
L["Set map pin"] = "Colocar marcador en el mapa"
L["Set TomTom waypoint"] = "Colocar un waypoint de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom")
L["Coming soon"] = "Próximamente"

--- About ---
L["About the AddOn"] = "Acerca del AddOn"
L["Created by Pranavius"] = "Creado por Pranavius"
L["Translations:"] = "Traducciones:"
L["Open ICH"] = "Abrir ICH"
L["Close"] = "Cerrar"

--- New in v11: To be categorized ---
L["Type"] = "Tipo"
L["Expansion"] = "Expansión"
L["Cost"] = "Costo"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = "Probabilidad aleatoria de obtenerse al abrir un "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Ahora puede comprarse a cualquier vendedora de Cronaviajes"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Ahora puede comprarse a cualquier vendedora de Cronaviajes"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Ahora puede comprarse a cualquier vendedora de Cronaviajes"
L["Special Thanks"] = "Agradecimientos especiales"
L["Mount"] = "Montura"
L["Pet"] = "Mascota"
L["Toy"] = "Juguete"
L["Timewalking Vendor"] = "Cronoviajes"
L["Unable to transfer Timewarped Badges to this character right now."] = "No se pueden transferir las "..(C_CurrencyInfo.GetCurrencyInfo(1166).name or "Timewarped Badges").." a este personaje en este momento."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "No se pudo abrir el menú de transferencia de divisa. Ábrelo manualmente o inténtalo de nuevo."
L["Click to open currency transfer menu"] = "Haz clic para abrir el menú de transferencia de divisa"
L["Cannot transfer to this character"] = "No se puede transferir a este personaje"
L["Legion: Remix Vendor"] = "Vendedor de Legion: Remix"
--- New in v12: To be categorized ---
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Caballero de la Muerte y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Cazador de demonios y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Druida y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Cazador y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Mago y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Monje y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Paladín y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Sacerdote y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Pícaro y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Chamán y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Brujo y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Obtenible gratis al alcanzar nivel 80 con un Timerunner Guerrero y conseguir el logro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "Esta mascota es la recompensa de una cadena de misiones iniciada por el objeto "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", que se puede comprar al vendedor."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Marcado como exclusivo de evento porque sólo estuvo disponible durante el evento de pre-parche de Legion."
L["Available In"] = "Disponible en"
L["Event Exclusive"] = "Exclusivo de evento"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Buscar por nombre/tipo de coleccionable o por expansión"
--- New in v12.1: To be categorized ---
L["Unable to transfer Bronze to this character right now."] = "No se pueden transferir las "..(C_CurrencyInfo.GetCurrencyInfo(3252).name or "Bronze").." a este personaje en este momento."
--- New in v12.2: To be categorized ---
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Se obtiene a través de la cadena de misiones iniciada por "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]"))..", la cual puede comprarse al vendedor."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "Esto es considerablemente más fácil de obtener en Legion: Remix, ya que los objetos necesarios para la cadena de misiones se te entregan al comprar este objeto."
