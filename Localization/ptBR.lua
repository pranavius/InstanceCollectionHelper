local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "ptBR")

if not L then return end

--- Mount Notes ---
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponível na dificuldade de Raide de Legado Normal, mas deve ser configurada para Heróico se "..WrapTextInColor("Aia da Mãe da Vida", DARKYELLOW_FONT_COLOR).." ainda não tiver sido obtida"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Obtido de inimigos menores ao redor do "..WrapTextInColor("Templo de Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["Also obtainable in Timewalking"] = "Também obtido em Caminhada Temporal"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtido na dificuldade Localizador de Raides (LFR) ao matar "..WrapTextInColor("Grã-senhora Jaina Proudmore", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Obtido por personagens da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Obtido por personagens da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Ao entrar na instância, a dificuldade de raide será automaticamente definida como Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Não fale com nenhum dos Guardiões Titânicos, caso contrário esta montaria não cairá"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Exige completar certos objetivos dentro de um tempo determinado, por isso é recomendado procurar um guia online para obter esta montaria antes de tentar"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "A entrada pode estar em "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." ou no "..WrapTextInColor("Vale das Flores Eternas", DARKYELLOW_FONT_COLOR)
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Exige completar a linha de história de Tazavesh para desbloquear o caminho de voo, começando com |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "O gato de Oribos", DARKYELLOW_FONT_COLOR)
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requer completar uma curta linha de missões após saquear "..(select(2, C_Item.GetItemInfo(226683)) or WrapTextInColor("[Traje de Meca Defeituoso]", EPIC_PURPLE_COLOR))

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Obtido de "..WrapTextInColor("Doutor Theolen Krastinov", DARKYELLOW_FONT_COLOR)..", que tem uma chance aleatória de aparecer após matar "..WrapTextInColor("Ossorrange", DARKYELLOW_FONT_COLOR)
L["Dropped by the Rare Elite Vixx the Collector"] = "Obtido do elite raro "..WrapTextInColor("Vixx, o Colecionador", DARKYELLOW_FONT_COLOR)
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Este item é obtido mesmo que não apareça na tabela de saque de "..WrapTextInColor("Gul'dan", DARKYELLOW_FONT_COLOR)
L["Can drop from every boss in the dungeon"] = "Pode cair de todos os chefes da masmorra"
L["Can only be looted and used by a Druid"] = "Só pode ser saqueado e usado por um "..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Também pode ser obtido pescando dentro da masmorra"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requer a conclusão do feito "..WrapTextInColor(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire", DARKYELLOW_FONT_COLOR)
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Isto só é colecionável na versão Clássica de Scolomântia. Se não tiver essa instância desbloqueada, procure um guia online primeiro."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Obtido do chefe oculto "..WrapTextInColor("Engenheiro Omegaplugue", DARKYELLOW_FONT_COLOR)
L["It is highly recommended to attempt this encounter with a full party"] = "Recomenda-se fortemente tentar este encontro com um grupo completo"
L["Can only be looted and used by a Demon Hunter"] = "Só pode ser saqueado e usado por um "..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Cai de "..WrapTextInColor("Dom Ramón", DARKYELLOW_FONT_COLOR).." que patrulha parte do caminho ao sul de Serraria Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Há relatos de que "..WrapTextInColor("Dom Ramón", DARKYELLOW_FONT_COLOR).." desaparece após matar alguns chefes; proceda com cautela"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Cai dos Gastrópode encontrados entre "..WrapTextInColor("Megaira", DARKYELLOW_FONT_COLOR).." e "..WrapTextInColor("Ji-Kun", DARKYELLOW_FONT_COLOR)

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Também pode ser obtido em uma masmorra de seguidores"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..WrapTextInColor("Doura de Ricalhaz Nababa", DARKYELLOW_FONT_COLOR)
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "A entrada da instância fica no topo da torre onde o waypoint está localizado"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Obtido de "..WrapTextInColor("Guardiãos Anormal", DARKYELLOW_FONT_COLOR).." e "..WrapTextInColor("Assoladores Anormal", DARKYELLOW_FONT_COLOR).." por toda a masmorra"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Obtido do elite raro "..WrapTextInColor("Gol'than, o Rançoso", DARKYELLOW_FONT_COLOR)
L["Guides for how to spawn this mob can be found online"] = "Guias sobre como fazer este mob aparecer podem ser encontrados online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Obtido de "..WrapTextInColor("Piratas Défias", DARKYELLOW_FONT_COLOR).." no barco em direção ao final da masmorra"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Obtido de "..WrapTextInColor("A Lantícora", DARKYELLOW_FONT_COLOR)..", que tem uma chance aleatória de aparecer após matar "..WrapTextInColor("Orebender Gor'ashan", DARKYELLOW_FONT_COLOR)
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "O acesso à entrada do raide requer completar a missão |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "Guinada da maré" or "A maré vira", DARKYELLOW_FONT_COLOR)
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Obtido de "..WrapTextInColor("Elemental de Areia", DARKYELLOW_FONT_COLOR).." em Normal e Heróico, mas pode ser saqueado do "..WrapTextInColor("Conselho dos Anciãos", DARKYELLOW_FONT_COLOR).." no LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Obtido ao usar um "..(select(2, C_Item.GetItemInfo(33865)) or WrapTextInColor("[Vareta de Bruxaria Amani]", GREEN_FONT_COLOR)).." em "..WrapTextInColor("Sapos de Floresta", DARKYELLOW_FONT_COLOR)
L["Detailed guides for how to obtain this pet can be found online"] = "Guias detalhados sobre como obter este mascote podem ser encontrados online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..WrapTextInColor("Dragões do Pesadelo", DARKYELLOW_FONT_COLOR)
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Este mascote leva 3 dias para chocar após saquear "..(select(2, C_Item.GetItemInfo(160832)) or WrapTextInColor("[Ovo de Naja Viável]", RARE_BLUE_COLOR))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..WrapTextInColor("Sir Denathrius", DARKYELLOW_FONT_COLOR)

--- Instance Difficulties --
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heróico"
L["Mythic"] = "Mítico"
L["10 player"] = "10 jogadores"
L["10 Player (Heroic)"] = "10 jogadores (Heróico)"
L["25 player"] = "25 jogadores"
L["25 Player (Heroic)"] = "25 jogadores (Heróico)"
L["40 player"] = "40 jogadores"
L["Unknown"] = "Desconhecido"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "A dificuldade da masmorra já está definida como"
L["Legacy Raid Difficulty is already set to"] = "A dificuldade de Raide de Legado já está definida como"
L["Raid Difficulty is already set to"] = "A dificuldade de raide já está definida como"
L["Current Instance Difficulties"] = "Dificuldades atuais da instância"
L["Dungeon Difficulty:"] = "Dificuldade de masmorra:"
L["Legacy Raid Difficulty:"] = "Dificuldade de Raide de Legado:"
L["Raid Difficulty:"] = "Dificuldade de raide:"
L["Invalid dungeon difficulty provided."] = "Dificuldade de masmorra fornecida é inválida."
L["Invalid legacy raid difficulty provided."] = "Dificuldade de Raide de Legado fornecida é inválida."
L["Invalid raid difficulty provided."] = "Dificuldade de raide fornecida é inválida."
L["Accepted values:"] = "Valores aceitos:"
L["Show/hide the minimap icon"] = "Mostrar/ocultar o ícone do minimapa"
L["Updated available mount list"] = "Lista de montarias disponíveis atualizada"
L["Map pin set for"] = "Marcador de mapa definida para"
L["Unable to set map pin for"] = "Não foi possível definir um marcador de mapa para"
L["TomTom waypoint set for"] = "waypoint de TomTom definida para"
L["Unable to set TomTom waypoint for"] = "Não foi possível definir um waypoint de TomTom para"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Exibir todas as dificuldades atuais da instância"
L["Set dungeon difficulty."] = "Definir dificuldade de masmorra."
L["Set legacy raid difficulty."] = "Definir dificuldade de Raide de Legado."
L["Set raid difficulty."] = "Definir dificuldade de raide."
L["Show/hide the minimap icon"] = "Mostrar/ocultar o ícone do minimapa"

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Rastrear montarias, brinquedos, e mascotes disponíveis de instâncias e definir facilmente a dificuldade requerida da instância"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Digite \"/ich help\" na janela de chat para comandos disponíveis"

-- Special Search Terms --
L["dungeon"] = "masmorra"
L["raid"] = "raide"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Pesquisar por nome de montaria/instância, tipo de instância, dificuldade ou expansão"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Pesquisar por nome de brinquedo/instância, tipo de instância, dificuldade ou expansão"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Pesquisar por nome de mascote/instância, tipo de instância, dificuldade ou expansão"
L["Scale"] = "Escala"
L["Use TomTom waypoints"] = "Usar waypoints de TomTom"
L["Show Owned"] = "Mostrar itens possuídos"
L["How To Use:"] = "Como usar:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Encontre a colecionável que deseja coletar na lista e clique no botão da dificuldade em que quer executar"
L["to make sure it is updated."] = "para garantir que esteja atualizada."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Quando você estiver bloqueado em uma dificuldade específica, o botão dessa dificuldade será desativado."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Um botão também será desativado para raides de legado concluídos em outra dificuldade, pois esses bloqueios"
L["are shared across difficulties."] = "são compartilhados entre dificuldades."
L["Search Hints:"] = "Dicas de pesquisa:"
L["\"raid\" will show all collectibles that can be collected from a raid"] = WrapTextInColor("\"raide\"", DARKYELLOW_FONT_COLOR).." mostrará todas as colecionáveis que podem ser coletadas em uma raide"
L["\"10\" will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." mostrará todas as colecionáveis que podem ser coletadas em uma raide de 10 jogadores de legado (Normal ou Heróico)"
L["\"fel\" will show all collectibles and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." mostrará todas as colecionáveis e instâncias que contêm \"fel\" no nome"
L["\"mythic\" will show all collectibles that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mítico\"", DARKYELLOW_FONT_COLOR).." mostrará todas as colecionáveis que podem ser obtidas em um calabouço mítico ou raide"
L["\"lfr\" will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." mostrará todas as colecionáveis que podem ser obtidas em raides na dificuldade Localizador de Raides (LFR)"
L["\"wotlk\" or \"wrath\" will show all collectibles that can be obtained from Wrath of the Lich King instances"] = "\"wotlk\" ou \"wrath\" mostrará todas as colecionáveis que podem ser obtidas nas instâncias de Wrath of the Lich King"
L["Name"] = "Nome"
L["Instance"] = "Instância"
L["Available Difficulty(s)"] = "Dificuldade(s)"
L["Shares lockout with:"] = "Compartilha bloqueio com:"
L["View in encounter journal"] = "Ver no diário de encontros"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Este botão serve apenas para rastrear o bloqueio do Localizador de Raides (LFR). A dificuldade de raide não foi alterada."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "O rastreamento de marcador no minimapa pode não aparecer até você estar em uma zona específica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Por exemplo, uma seta apontando para o "..WrapTextInColor("Trono do Trovão", DARKYELLOW_FONT_COLOR).." só aparecerá quando você estiver na "..WrapTextInColor("Ilha do Trovão", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "Definir marcador no mapa"
L["Set TomTom waypoint"] = "Colocar um waypoint "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR)
L["Coming soon"] = "Em breve"

--- About ---
L["About the AddOn"] = "Sobre o AddOn"
L["Created by Pranavius"] = "Criado por Pranavius"
L["Translations:"] = "Traduções:"
L["Open ICH"] = "Abrir ICH"
L["Close"] = "Fechar"

--- Deprecated: to be removed in future release once it has been confirmed they are not needed or used ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 10 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 25 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 40 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["Search by mount/instance name, instance type, or difficulty"] = "Nome de montaria/instância, tipo de instância, dificuldade"
L["Search by toy/instance name, instance type, or difficulty"] = "Pesquisar por nome do brinquedo/instância, tipo de instância ou dificuldade"
L["Show Owned Mounts"] = "Mostrar montarias possuídas"
L["View in mount journal"] = "Ver no diário de montarias"
L["Track available mounts from instances and easily set required instance difficulty"] = "Rastrear montarias disponíveis de instâncias e definir facilmente a dificuldade requerida da instância"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Encontre a montaria que deseja coletar na lista e clique no botão da dificuldade em que quer executar"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "Quando você estiver bloqueado para uma montaria em uma dificuldade específica, o botão dessa dificuldade será desativado."
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"raide\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser coletadas em uma raide"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser coletadas em uma raide de 10 jogadores de legado (Normal ou Heróico)"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias e instâncias que contêm \"fel\" no nome"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mítico\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser obtidas em um calabouço mítico ou raide"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser obtidas em raides na dificuldade Localizador de Raides (LFR)"
