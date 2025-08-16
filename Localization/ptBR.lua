local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "ptBR")

if not L then return end

--- Mount Notes ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 10 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 25 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponível na dificuldade de Raide de Legado Normal, mas deve ser configurada para Heróico se "..WrapTextInColor("Aia da Mãe da Vida", DARKYELLOW_FONT_COLOR).." ainda não tiver sido obtida"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Obtido de inimigos menores ao redor do "..WrapTextInColor("Templo de Ahn'Qiraj", DARKYELLOW_FONT_COLOR)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "Esta raide só tem dificuldade de 40 jogadores, então qualquer dificuldade de raide pode ser definida antes de entrar na instância"
L["Also obtainable in Timewalking"] = "Também obtido em Caminhada Temporal"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtido na dificuldade Localizador de Raides (LFR) ao matar "..WrapTextInColor("Grã-senhora Jaina Proudmore", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Obtido por personagens da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Obtido por personagens da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Ao entrar na instância, a dificuldade de raide será automaticamente definida como Normal"
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Exige completar a linha de história de Tazavesh para desbloquear o caminho de voo, começando com |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos", DARKYELLOW_FONT_COLOR)


--- Instance Difficulties --
L["LFR"] = "LFR"
L["Normal"] = "Normal"
L["Heroic"] = "Heróico"
L["Mythic"] = "Mítico"
L["10 player"] = "10 jogadores"
L["10 Player (Heroic)"] = "10 jogadores (Heróico)"
L["25 player"] = "25 jogadores"
L["25 Player (Heroic)"] = "25 jogadores (Heróico)"
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
L["Track available mounts from instances and easily set required instance difficulty"] = "Rastrear montarias disponíveis de instâncias e definir facilmente a dificuldade requerida da instância"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Digite \"/ich help\" na janela de chat para comandos disponíveis"

-- Special Search Terms --
L["dungeon"] = "masmorra"
L["raid"] = "raide"

--- UI ---
L["Search by mount/instance name, instance type, or difficulty"] = "Nome de montaria/instância, tipo de instância, dificuldade"
L["Scale"] = "Escala"
L["Use TomTom waypoints"] = "Usar waypoints de TomTom"
L["Show Owned Mounts"] = "Mostrar montarias possuídas"
L["How To Use:"] = "Como usar:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "Encontre a montaria que deseja coletar na lista e clique no botão da dificuldade em que quer executar"
L["to make sure it is updated."] = "para garantir que esteja atualizada."
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "Quando você estiver bloqueado para uma montaria em uma dificuldade específica, o botão dessa dificuldade será desativado."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Um botão também será desativado para raides de legado concluídos em outra dificuldade, pois esses bloqueios"
L["are shared across difficulties."] = "são compartilhados entre dificuldades."
L["Search Hints:"] = "Dicas de pesquisa:"
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"raide\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser coletadas em uma raide"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser coletadas em uma raide de 10 jogadores de legado (Normal ou Heróico)"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias e instâncias que contêm \"fel\" no nome"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"mítico\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser obtidas em um calabouço mítico ou raide"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." mostrará todas as montarias que podem ser obtidas em raides na dificuldade Localizador de Raides (LFR)"
L["Name"] = "Nome"
L["Instance"] = "Instância"
L["Available Difficulty(s)"] = "Dificuldade(s)"
L["Shares lockout with:"] = "Compartilha bloqueio com:"
L["View in mount journal"] = "Ver no diário de montarias"
L["View in encounter journal"] = "Ver no diário de encontros"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Este botão serve apenas para rastrear o bloqueio do Localizador de Raides (LFR). A dificuldade de raide não foi alterada."
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Exige completar certos objetivos dentro de um tempo determinado, por isso é recomendado procurar um guia online para obter esta montaria antes de tentar"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Não fale com nenhum dos Guardiões Titânicos, caso contrário esta montaria não cairá"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "A entrada pode estar em "..WrapTextInColor("Uldum", DARKYELLOW_FONT_COLOR).." ou no "..WrapTextInColor("Vale das Flores Eternas", DARKYELLOW_FONT_COLOR)
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "O rastreamento de marcador no minimapa pode não aparecer até você estar em uma zona específica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Por exemplo, uma seta apontando para o "..WrapTextInColor("Trono do Trovão", DARKYELLOW_FONT_COLOR).." só aparecerá quando você estiver na "..WrapTextInColor("Ilha do Trovão", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "Definir marcador no mapa"
L["Set TomTom waypoint"] = "Colocar um waypoint "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR)

--- About ---
L["About the AddOn"] = "Sobre o AddOn"
L["Created by Pranavius"] = "Criado por Pranavius"
L["Translations:"] = "Traduções:"
L["Open ICH"] = "Abrir ICH"
L["Close"] = "Fechar"