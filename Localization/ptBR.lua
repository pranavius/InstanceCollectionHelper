local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "ptBR")

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
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Disponível na dificuldade de Raide de Legado Normal, mas deve ser configurada para Heróico se "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Aia da Mãe da Vida").." ainda não tiver sido obtida"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Obtido de inimigos menores ao redor do "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Templo de Ahn'Qiraj")
L["Also obtainable in Timewalking"] = "Também obtido em Caminhada Temporal"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Obtido na dificuldade Localizador de Raides (LFR) ao matar "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Grã-senhora Jaina Proudmore")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Obtido por personagens da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Obtido por personagens da "..WrapTextInColor("Horda", PLAYER_FACTION_COLOR_HORDE)..", mas ao obtê-lo também recebe a versão da "..WrapTextInColor("Aliança", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "Ao entrar na instância, a dificuldade de raide será automaticamente definida como Normal"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Não fale com nenhum dos Guardiões Titânicos, caso contrário esta montaria não cairá"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Exige completar certos objetivos dentro de um tempo determinado, por isso é recomendado procurar um guia online para obter esta montaria antes de tentar"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "A entrada pode estar em "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Uldum").." ou no "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vale das Flores Eternas")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Exige completar a linha de história de Tazavesh para desbloquear o caminho de voo, começando com |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "O gato de Oribos")
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Requer completar uma curta linha de missões após saquear "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Traje de Meca Defeituoso]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Requer completar a masmorra após ativar o Modo Difícil. Guias sobre como fazê-lo podem ser encontrados online."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Obtido de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Doutor Theolen Krastinov")..", que tem uma chance aleatória de aparecer após matar "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ossorrange")
L["Dropped by the Rare Elite Vixx the Collector"] = "Obtido do elite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Vixx, o Colecionador")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Este item é obtido mesmo que não apareça na tabela de saque de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gul'dan")
L["Can drop from every boss in the dungeon"] = "Pode cair de todos os chefes da masmorra"
L["Can only be looted and used by a Druid"] = "Só pode ser saqueado e usado por um "..WrapTextInColor(ICH_GetClassName(11, "Druid"), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Também pode ser obtido pescando dentro da masmorra"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Requer a conclusão do feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Isto só é colecionável na versão Clássica de Scolomântia. Se não tiver essa instância desbloqueada, procure um guia online primeiro."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Obtido do chefe oculto "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Engenheiro Omegaplugue")
L["It is highly recommended to attempt this encounter with a full party"] = "Recomenda-se fortemente tentar este encontro com um grupo completo"
L["Can only be looted and used by a Demon Hunter"] = "Só pode ser saqueado e usado por um "..WrapTextInColor(ICH_GetClassName(11, "Demon Hunter"), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Cai de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dom Ramón").." que patrulha parte do caminho ao sul de Serraria Tarren"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Há relatos de que "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dom Ramón").." desaparece após matar alguns chefes; proceda com cautela"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Cai dos Gastrópode encontrados entre "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Megaira").." e "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ji-Kun")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Também pode ser obtido em uma masmorra de seguidores"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Doura de Ricalhaz Nababa")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "A entrada da instância fica no topo da torre onde o waypoint está localizado"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Obtido de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Guardiãos Anormal").." e "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Assoladores Anormal").." por toda a masmorra"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Obtido do elite raro "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Gol'than, o Rançoso")
L["Guides for how to spawn this mob can be found online"] = "Guias sobre como fazer este mob aparecer podem ser encontrados online"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Obtido de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Piratas Défias").." no barco em direção ao final da masmorra"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Obtido de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("A Lantícora")..", que tem uma chance aleatória de aparecer após matar "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Orebender Gor'ashan")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "O acesso à entrada do raide requer completar a missão |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "Guinada da maré" or "A maré vira")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Obtido de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Elemental de Areia").." em Normal e Heróico, mas pode ser saqueado do "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Conselho dos Anciãos").." no LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Obtido ao usar um "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Vareta de Bruxaria Amani]")).." em "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sapos de Floresta")
L["Detailed guides for how to obtain this pet can be found online"] = "Guias detalhados sobre como obter este mascote podem ser encontrados online"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Dragões do Pesadelo")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Este mascote leva 3 dias para chocar após saquear "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Ovo de Naja Viável]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Este item pode ser obtido mesmo que não apareça na tabela de saque de "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Sir Denathrius")

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
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"raide\"").." mostrará todas as colecionáveis que podem ser coletadas em uma raide"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." mostrará todas as colecionáveis que podem ser coletadas em uma raide de 10 jogadores de legado (Normal ou Heróico)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." mostrará todas as colecionáveis e instâncias que contêm \"fel\" no nome"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"mítico\"").." mostrará todas as colecionáveis que podem ser obtidas em um calabouço mítico ou raide"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." mostrará todas as colecionáveis que podem ser obtidas em raides na dificuldade Localizador de Raides (LFR)"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." ou "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." mostrará todas as colecionáveis que podem ser obtidas nas instâncias de Wrath of the Lich King"
L["Name"] = "Nome"
L["Instance"] = "Instância"
L["Available Difficulty(s)"] = "Dificuldade(s)"
L["Shares lockout with:"] = "Compartilha bloqueio com:"
L["View in encounter journal"] = "Ver no diário de encontros"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Este botão serve apenas para rastrear o bloqueio do Localizador de Raides (LFR). A dificuldade de raide não foi alterada."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "O rastreamento de marcador no minimapa pode não aparecer até você estar em uma zona específica."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Por exemplo, uma seta apontando para o "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Trono do Trovão").." só aparecerá quando você estiver na "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ilha do Trovão")
L["Set map pin"] = "Definir marcador no mapa"
L["Set TomTom waypoint"] = "Colocar um waypoint "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom")
L["Coming soon"] = "Em breve"

--- About ---
L["About the AddOn"] = "Sobre o AddOn"
L["Created by Pranavius"] = "Criado por Pranavius"
L["Translations:"] = "Traduções:"
L["Open ICH"] = "Abrir ICH"
L["Close"] = "Fechar"

--- New in v11: To be categorized ---
L["Type"] = "Tipo"
L["Expansion"] = "Expansão"
L["Cost"] = "Custo"
L["Random chance to obtain when opening a  Bag of Fishing Treasures"] = "Chance aleatória de obter ao abrir um "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Agora pode ser comprado com qualquer vendedor de Caminhada Temporal"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Agora pode ser comprado com qualquer vendedor de Caminhada Temporal"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Originalmente recompensado por completar o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Agora pode ser comprado com qualquer vendedor de Caminhada Temporal"
L["Special Thanks"] = "Agradecimentos especiais"
L["Mount"] = "Montaria"
L["Pet"] = "Mascote"
L["Toy"] = "Brinquedo"
L["Timewalking Vendor"] = "Caminhada Temporal"
L["Unable to transfer Timewarped Badges to this character right now."] = "Não é possível transferir "..ICH_GetCurrencyName(1166, "Timewarped Badges").." para este personagem no momento."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "Não foi possível abrir o menu de transferência de moeda. Abra-o manualmente ou tente novamente."
L["Click to open currency transfer menu"] = "Clique para abrir o menu de transferência de moeda"
L["Cannot transfer to this character"] = "Não é possível transferir para este personagem"
L["Legion: Remix Vendor"] = "Vendedor de Legion: Remix"
--- New in v12: To be categorized ---
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Cavaleiro da Morte e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Caçador de Demônios e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Druida e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Caçador e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Mago e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Monge e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Paladino e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Sacerdote e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Ladino e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Xamã e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Bruxo e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Obtido gratuitamente ao alcançar o nível 80 com um Timerunner Guerreiro e ao obter o feito "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "Este mascote é a recompensa de uma cadeia de missões iniciada pelo item "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", o qual pode ser comprado com o vendedor."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Marcada como exclusiva de evento, pois só esteve disponível durante o evento de pré-patch de Legion."
L["Available In"] = "Disponível em"
L["Event Exclusive"] = "Exclusivo de evento"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Pesquisar por nome/tipo do colecionável ou por expansão"
--- New in v12.1: To be categorized ---
L["Unable to transfer Bronze to this character right now."] = "Não é possível transferir "..ICH_GetCurrencyName(3252, "Bronze").." para este personagem no momento."
--- New in v12.2: To be categorized ---
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Obtido através da cadeia de missões iniciada por "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]"))..", a qual pode ser comprada com o vendedor."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "Isto é consideravelmente mais fácil de obter em Legion: Remix, pois os itens necessários para a cadeia de missões são entregues a você ao comprar este item."
