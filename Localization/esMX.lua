local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "esMX")

if not L then return end

--- Mount Notes ---
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponible en la dificultad de banda de legado Normal, pero debe configurarse en Heroico si "..WrapTextInColor("Fámula de la Protectora", DARKYELLOW_FONT_COLOR).." aún no se ha obtenido"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Se obtiene de los esbirros alrededor de "..WrapTextInColor("Templo de Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["Also obtainable in Timewalking"] = "También obtenible en Paseo del Tiempo"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtenible en la dificultad Buscador de bandas (LFR) al derrotar a "..WrapTextInColor("Lady Jaina Valiente", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Se obtiene para personajes de "..WrapTextInColor("Alianza", PLAYER_FACTION_COLOR_ALLIANCE)..", pero al obtenerlo también obtienes la versión de "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Se obtiene para personajes de "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)..", pero al obtenerlo también obtienes la versión de "..WrapTextInColor("Alianza", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Al entrar en la instancia, la dificultad de banda se configurará automáticamente en Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "No hables con ninguno de los Guardianes Titanes, de lo contrario esta montura no aparecerá como botín"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Requiere completar ciertos objetivos dentro de un tiempo determinado, por lo que se recomienda buscar una guía en línea para obtener esta montura antes de intentarlo"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "La entrada puede estar en "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." o en "..WrapTextInColor("Valle de la Flor Eterna", DARKYELLOW_FONT_COLOR)
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Requiere completar la historia de Tazavesh para desbloquear la ruta de vuelo, comenzando con |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "El gato cajellero de Oribos", DARKYELLOW_FONT_COLOR) -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requiere completar una breve cadena de misiones después de saquear "..(select(2, C_Item.GetItemInfo(226683)) or WrapTextInColor("[Mecatraje averiado]", EPIC_PURPLE_COLOR))

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Se obtiene de "..WrapTextInColor("Doctor Theolen Krastinov", DARKYELLOW_FONT_COLOR)..", quien tiene una probabilidad aleatoria de aparecer tras matar a "..WrapTextInColor("Traquesangre", DARKYELLOW_FONT_COLOR)
L["Dropped by the Rare Elite Vixx the Collector"] = "Se obtiene del élite raro "..WrapTextInColor("Vixx, el coleccionista", DARKYELLOW_FONT_COLOR)
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..WrapTextInColor("Gul'dan", DARKYELLOW_FONT_COLOR)
L["Can drop from every boss in the dungeon"] = "Puede caer de todos los jefes dla mazmorra"
L["Can only be looted and used by a Druid"] = "Solo puede ser saqueado y usado por un "..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "También se puede obtener pescando dentro dla mazmorra"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requiere completar el logro "..WrapTextInColor(select(2, GetAchievementInfo(17366)) or "Reliquias de un imperio caído", DARKYELLOW_FONT_COLOR)
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Solo se puede coleccionar en la versión clásica de Scholomance. Si no tienes esta instancia desbloqueada, busca una guía en línea antes de intentarlo."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Se obtiene del jefe oculto "..WrapTextInColor("Endgineer Omegaplugg", DARKYELLOW_FONT_COLOR)
L["It is highly recommended to attempt this encounter with a full party"] = "Se recomienda encarecidamente intentar este encuentro con un grupo completo"
L["Can only be looted and used by a Demon Hunter"] = "Solo puede ser saqueado y usado por un "..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Se obtiene de "..WrapTextInColor("Don Carlos", DARKYELLOW_FONT_COLOR).." que patrulla parte del camino al sur de Molino Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Hay informes de que "..WrapTextInColor("Don Carlos", DARKYELLOW_FONT_COLOR).." desaparece tras matar a algunos jefes; proceda con precaución"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Se obtiene de los Gasterópodo que se encuentran entre "..WrapTextInColor("Megaera", DARKYELLOW_FONT_COLOR).." y "..WrapTextInColor("Ji Kun", DARKYELLOW_FONT_COLOR)

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "También se puede obtener en un mazmorra con seguidores"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..WrapTextInColor("Goldie Bonbarón", DARKYELLOW_FONT_COLOR)
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "La entrada de la instancia está en la parte más alta de la torre donde se encuentra el waypoint"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Se obtiene de "..WrapTextInColor("Guardián descarriados", DARKYELLOW_FONT_COLOR).." y "..WrapTextInColor("Devastador descarriados", DARKYELLOW_FONT_COLOR).." en todo la mazmorra"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Se obtiene del élite raro "..WrapTextInColor("Gol'than el Malioliente", DARKYELLOW_FONT_COLOR)
L["Guides for how to spawn this mob can be found online"] = "Se pueden encontrar guías en línea sobre cómo hacer aparecer a este enemigo"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Se obtiene de "..WrapTextInColor("Pirata Defias", DARKYELLOW_FONT_COLOR).." en el barco hacia el final dla mazmorra"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Se obtiene de "..WrapTextInColor("La Lanticora", DARKYELLOW_FONT_COLOR)..", que tiene una probabilidad aleatoria de aparecer tras matar a "..WrapTextInColor("Controlador de mena Gor'ashan", DARKYELLOW_FONT_COLOR)
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "El acceso a la entrada de la banda requiere completar la misión |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "Cambia la marea" or "Un cambio en la marea", DARKYELLOW_FONT_COLOR)
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Se obtiene de "..WrapTextInColor("Elementales de arena", DARKYELLOW_FONT_COLOR).." en Normal y Heroico, pero puede saquearse del "..WrapTextInColor("Consejo de Ancianos", DARKYELLOW_FONT_COLOR).." en LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Se obtiene al usar un "..(select(2, C_Item.GetItemInfo(33865)) or WrapTextInColor("[Vara de brujería Amani]", GREEN_FONT_COLOR)).." en "..WrapTextInColor("Ranas camperas", DARKYELLOW_FONT_COLOR)
L["Detailed guides for how to obtain this pet can be found online"] = "Se pueden encontrar guías detalladas en línea sobre cómo obtener esta mascota"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..WrapTextInColor("Dragones de Pesadilla", DARKYELLOW_FONT_COLOR)
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Esta mascota tarda 3 días en eclosionar después de saquear "..(select(2, C_Item.GetItemInfo(160832)) or WrapTextInColor("[Huevo de cobra viable]", RARE_BLUE_COLOR))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Este objeto se puede obtener aunque no aparezca en la tabla de botín de "..WrapTextInColor("Sir Denathrius", DARKYELLOW_FONT_COLOR)

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
L["\"raid\" will show all collectibles that can be collected from a raid"] = WrapTextInColor("\"banda\"", DARKYELLOW_FONT_COLOR).." mostrará todas las coleccionables que se pueden coleccionar en una banda"
L["\"10\" will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." mostrará todas las coleccionables que se pueden coleccionar en una banda de legado de 10 jugadores (Normal o Heroico)"
L["\"fel\" will show all collectibles and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." mostrará todas las coleccionables e instancias que contengan \"fel\" en el nombre"
L["\"mythic\" will show all collectibles that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mítico\"", DARKYELLOW_FONT_COLOR).." mostrará todas las coleccionables que se pueden obtener en una mazmorra o banda Mítica"
L["\"lfr\" will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." mostrará todas las coleccionables que se pueden obtener en bandas en dificultad Buscador de bandas (LFR)"
L["\"wotlk\" or \"wrath\" will show all collectibles that can be obtained from Wrath of the Lich King instances"] = "\"wotlk\" o \"wrath\" mostrará todas las coleccionables que se pueden obtener en las instancias de Wrath of the Lich King"
L["Name"] = "Nombre"
L["Instance"] = "Instancia"
L["Available Difficulty(s)"] = "Dificultad(es)"
L["Shares lockout with:"] = "Comparte bloqueo con:"
L["View in encounter journal"] = "Ver en el diario de encuentros"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Este botón solo sirve para rastrear el bloqueo de Buscador de bandas (LFR). La dificultad de banda no ha cambiado."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "El seguimiento de marcador en el minimapa puede no aparecer hasta que estés en una zona específica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Por ejemplo, una flecha apuntando hacia "..WrapTextInColor("Trono del Trueno", DARKYELLOW_FONT_COLOR).." solo aparecerá cuando estés en la "..WrapTextInColor("Isla del Trueno", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "Colocar marcador en el mapa"
L["Set TomTom waypoint"] = "Colocar un waypoint de "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR)
L["Coming soon"] = "Próximamente"

--- About ---
L["About the AddOn"] = "Acerca del AddOn"
L["Created by Pranavius"] = "Creado por Pranavius"
L["Translations:"] = "Traducciones:"
L["Open ICH"] = "Abrir ICH"
L["Close"] = "Cerrar"

--- Deprecated: to be removed in future release once it has been confirmed they are not needed or used ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta incursión solo tiene dificultad de 10 jugadores, así que cualquier dificultad de banda puede configurarse antes de entrar en la instancia"
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta incursión solo tiene dificultad de 25 jugadores, así que cualquier dificultad de banda puede configurarse antes de entrar en la instancia"
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta incursión solo tiene dificultad de 40 jugadores, así que cualquier dificultad de banda puede configurarse antes de entrar en la instancia"
L["Search by mount/instance name, instance type, or difficulty"] = "Buscar por nombre de montura/instancia, tipo de instancia o dificultad"
L["Search by toy/instance name, instance type, or difficulty"] = "Buscar por nombre de juguete/instancia, tipo de instancia o dificultad"
L["Show Owned Mounts"] = "Mostrar monturas poseídas"
L["View in mount journal"] = "Ver en el diario de monturas"
L["Track available mounts from instances and easily set required instance difficulty"] = "Rastrear monturas disponibles de instancias y configurar fácilmente la dificultad requerida de la instancia"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Encuentra la montura que deseas coleccionar en la lista y haz clic en el botón de la dificultad en la que quieres jugar"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "Cuando estés bloqueado para una montura en una dificultad determinada, el botón de esa dificultad se desactivará."
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"banda\"", DARKYELLOW_FONT_COLOR).." mostrará todas las monturas que se pueden coleccionar en una banda"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." mostrará todas las monturas que se pueden coleccionar en una banda de legado de 10 jugadores (Normal o Heroico)"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." mostrará todas las monturas e instancias que contengan \"fel\" en el nombre"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mítico\"", DARKYELLOW_FONT_COLOR).." mostrará todas las monturas que se pueden obtener en una mazmorra o banda Mítica"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." mostrará todas las monturas que se pueden obtener en bandas en dificultad Buscador de bandas (LFR)"
