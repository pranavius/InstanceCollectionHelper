local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "ruRU")

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
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "Доступно на обычной сложности устаревшего рейда, но следует выбрать Героический режим, если "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Служанка Хранительницы жизни").." ещё не получена"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "Выпадает с рядовых врагов вокруг "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Храма Ан'Киража")
L["Also obtainable in Timewalking"] = "Также можно получить в режиме Путешествия во времени"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "Можно получить в режиме Поиска рейда (LFR), убив "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Леди Джайну Праудмур")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "Выпадает для персонажей "..WrapTextInColor("Альянса", PLAYER_FACTION_COLOR_ALLIANCE)..", но при получении также открывает версию для "..WrapTextInColor("Орды", PLAYER_FACTION_COLOR_HORDE)
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "Выпадает для персонажей "..WrapTextInColor("Орды", PLAYER_FACTION_COLOR_HORDE)..", но при получении также открывает версию для "..WrapTextInColor("Альянса", PLAYER_FACTION_COLOR_ALLIANCE)
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "При входе в подземелье сложность рейда автоматически установится на Обычную"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "Не разговаривайте ни с одним из Хранителей Титанов, иначе этот маунт не выпадет"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "Требует выполнения определённых задач за отведённое время, поэтому перед попыткой рекомендуется поискать руководство в интернете"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "Вход может находиться в "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ульдуме").." или в "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Вечноцветущем долу")
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "Требует завершения сюжетной линии Тазавеша для разблокировки маршрута полёта, начиная с |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "Уличный кот Орибоса") -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = "Требует завершения короткой цепочки заданий после получения "..(select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Неисправный механический костюм]"))
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "Требует завершения подземелья после активации режима повышенной сложности. Руководства по его прохождению можно найти в интернете."
L["Clear the dungeon solo, then return to the area where Domina Venomblade was and interact with the Curious Slime Serpent."] = "Пройдите подземелье в одиночку, затем вернитесь в место, где находилась "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Домина Отравленный Клинок")..", и взаимодействуйте с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Любопытной слизистой змеёй").."."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Доктора Теолена Крастинова")..", который случайным образом появляется после убийства "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Громоклина")
L["Dropped by the Rare Elite Vixx the Collector"] = "Выпадает с редкого элитного врага "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Собирателя Викса")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "Этот предмет можно получить, несмотря на то что он не отображается в таблице добычи "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Гул'дана")
L["Can drop from every boss in the dungeon"] = "Может выпасть с любого босса в подземелье"
L["Can only be looted and used by a Druid"] = "Может быть подобран и использован только "..WrapTextInColor(ICH_GetClassName(11, "Друид"), ICH_GetClassColor("DRUID"))
L["Can also be looting by fishing within the instance"] = "Также можно получить рыбалкой внутри подземелья"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "Требует выполнения достижения "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Реликвии павшей империи")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "Можно получить только в классической версии Некроситета. Если у вас не разблокировано это подземелье, сначала найдите руководство в интернете."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "Выпадает со скрытого босса "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Инженера Омегаштепселя")
L["It is highly recommended to attempt this encounter with a full party"] = "Настоятельно рекомендуется проходить это столкновение в полной группе"
L["Can only be looted and used by a Demon Hunter"] = "Может быть подобран и использован только "..WrapTextInColor(ICH_GetClassName(12, "Охотник на демонов"), ICH_GetClassColor("DEMONHUNTER"))
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Дона Карлоса")..", патрулирующего часть пути к югу от Тарренской мельницы"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "Есть сведения о том, что "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Дон Карлос").." исчезает после убийства некоторых боссов — действуйте осторожно"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "Выпадает с моллюсков-гастроподов, которые находятся между "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Мегерой").." и "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Цзи-Кунем")

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "Также можно получить в подземелье со спутниками"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "Этот предмет можно получить, несмотря на то что он не отображается в таблице добычи "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Голди Барондон")
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "Вход в подземелье находится на самой вершине башни, где расположена точка маршрута"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("загадочных стражей").." и "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("загадочных опустошителей").." по всему подземелью"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "Выпадает с редкого элитного врага "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Гол'тана Зловонного")
L["Guides for how to spawn this mob can be found online"] = "Руководства по призыву этого противника можно найти в интернете"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("пиратов из братства Справедливости").." на корабле ближе к концу подземелья"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Лантикоры")..", которая случайным образом появляется после убийства "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Владыки руды Гор'ашана")
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "Доступ ко входу в рейд требует выполнения задания |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "Прилив меняется" or "Смена течения")
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Песчаных элементалей").." на Обычной и Героической сложности, но можно получить с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Совета старейшин").." в режиме LFR"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = "Получается при использовании "..(select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Амани-жезл трансформации]")).." на "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("дубравных лягушках")
L["Detailed guides for how to obtain this pet can be found online"] = "Подробные руководства по получению этого питомца можно найти в интернете"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "Этот предмет можно получить, несмотря на то что он не отображается в таблице добычи "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Драконов Кошмара")
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = "Этот питомец вылупляется через 3 дня после получения "..(select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Жизнеспособное яйцо кобры]"))
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "Этот предмет можно получить, несмотря на то что он не отображается в таблице добычи "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Сира Денатрия")

--- Instance Difficulties ---
L["LFR"] = "Поиск рейда"
L["Normal"] = "Обычный"
L["Heroic"] = "Героический"
L["Mythic"] = "Эпохальный"
L["10 player"] = "10 игроков"
L["10 Player (Heroic)"] = "10 игроков (Героический)"
L["25 player"] = "25 игроков"
L["25 Player (Heroic)"] = "25 игроков (Героический)"
L["40 player"] = "40 игроков"
L["Unknown"] = "Неизвестно"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "Сложность подземелья уже установлена на"
L["Legacy Raid Difficulty is already set to"] = "Сложность устаревшего рейда уже установлена на"
L["Raid Difficulty is already set to"] = "Сложность рейда уже установлена на"
L["Current Instance Difficulties"] = "Текущие сложности подземелий"
L["Dungeon Difficulty:"] = "Сложность подземелья:"
L["Legacy Raid Difficulty:"] = "Сложность устаревшего рейда:"
L["Raid Difficulty:"] = "Сложность рейда:"
L["Invalid dungeon difficulty provided."] = "Указана неверная сложность подземелья."
L["Invalid legacy raid difficulty provided."] = "Указана неверная сложность устаревшего рейда."
L["Invalid raid difficulty provided."] = "Указана неверная сложность рейда."
L["Accepted values:"] = "Допустимые значения:"
L["Show/hide the minimap icon"] = "Показать/скрыть значок на миникарте"
L["Updated available mount list"] = "Список доступных маунтов обновлён" -- Currently unused
L["Map pin set for"] = "Метка карты установлена для"
L["Unable to set map pin for"] = "Не удалось установить метку карты для"
L["TomTom waypoint set for"] = "Точка маршрута TomTom установлена для"
L["Unable to set TomTom waypoint for"] = "Не удалось установить точку маршрута TomTom для"

--- Slash Commands ---
L["Display all current instance difficulties"] = "Показать все текущие сложности подземелий"
L["Set dungeon difficulty."] = "Установить сложность подземелья."
L["Set legacy raid difficulty."] = "Установить сложность устаревшего рейда."
L["Set raid difficulty."] = "Установить сложность рейда."

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "Отслеживайте доступные маунты, игрушки и питомцев из подземелий и легко устанавливайте нужную сложность"
L["Type \"/ich help\" in the chat window for available slash commands"] = "Введите \"/ich help\" в окно чата для просмотра доступных команд"

-- Special Search Terms --
L["dungeon"] = "подземелье"
L["raid"] = "рейд"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "Поиск по названию маунта/подземелья, типу подземелья, сложности или дополнению"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "Поиск по названию игрушки/подземелья, типу подземелья, сложности или дополнению"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "Поиск по названию питомца/подземелья, типу подземелья, сложности или дополнению"
L["Scale"] = "Масштаб"
L["Use TomTom waypoints"] = "Использовать точки маршрута TomTom"
L["Show Owned"] = "Показать имеющиеся"
L["How To Use:"] = "Как использовать:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "Найдите нужный предмет коллекции в списке и нажмите кнопку желаемой сложности"
L["to make sure it is updated."] = "чтобы убедиться, что она обновлена."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "Если вы заблокированы на определённой сложности, кнопка для этой сложности будет недоступна."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "Кнопка также будет недоступна для устаревших рейдов, завершённых на другой сложности, поскольку эти блокировки"
L["are shared across difficulties."] = "распределяются по всем сложностям."
L["Search Hints:"] = "Подсказки поиска:"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"рейд\"").." покажет все предметы коллекции из рейдов"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." покажет все предметы коллекции из устаревших рейдов на 10 игроков (Обычный или Героический)"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." покажет все предметы коллекции и подземелья, содержащие \"fel\" в названии"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"эпохальный\"").." покажет все предметы коллекции из эпохальных подземелий или рейдов"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." покажет все предметы коллекции из рейдов в режиме Поиска рейда (LFR)"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." или "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").." покажет все предметы коллекции из подземелий Wrath of the Lich King"
L["Name"] = "Имя"
L["Instance"] = "Подземелье"
L["Available Difficulty(s)"] = "Доступные сложности"
L["Shares lockout with:"] = "Общая блокировка с:"
L["View in encounter journal"] = "Просмотр в журнале подземелий"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "Эта кнопка предназначена только для отслеживания блокировки Поиска рейда (LFR). Сложность рейда не изменена."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "Отслеживание на миникарте может не отображаться, пока вы не окажетесь в определённой зоне."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "Например, стрелка, указывающая на "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Престол Гроз")..", будет отображаться только на "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("острове Грома")
L["Set map pin"] = "Установить метку на карте"
L["Set TomTom waypoint"] = "Установить точку маршрута "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom")
L["Coming soon"] = "Скоро"

--- About ---
L["About the AddOn"] = "Об аддоне"
L["Created by Pranavius"] = "Создано Pranavius"
L["Translations:"] = "Переводы:"
L["Open ICH"] = "Открыть ICH"
L["Close"] = "Закрыть"

--- Timewalking Vendor ---
L["Type"] = "Тип"
L["Expansion"] = "Дополнение"
L["Cost"] = "Стоимость"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = "Случайный шанс получить при открытии "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Мешка рыбацких сокровищ")
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "Изначально выдавалось за выполнение достижения "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways")..". Теперь можно купить у любого торговца путешествием во времени"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "Изначально выдавалось за выполнение достижения "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II")..". Теперь можно купить у любого торговца путешествием во времени"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "Изначально выдавалось за выполнение достижения "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III")..". Теперь можно купить у любого торговца путешествием во времени"
L["Special Thanks"] = "Особая благодарность"
L["Mount"] = "Маунт"
L["Pet"] = "Питомец"
L["Toy"] = "Игрушка"
L["Timewalking Vendor"] = "Торговец путешествием во времени"
L["Unable to transfer Timewarped Badges to this character right now."] = "Сейчас невозможно передать "..ICH_GetCurrencyName(1166, "Timewarped Badges").." этому персонажу."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "Не удалось открыть меню передачи валюты. Откройте его вручную или повторите попытку."
L["Click to open currency transfer menu"] = "Нажмите, чтобы открыть меню передачи валюты"
L["Cannot transfer to this character"] = "Нельзя передать этому персонажу"

--- Legion Remix ---
L["Legion: Remix Vendor"] = "Торговец Legion: Remix"
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(6, "Рыцарь смерти"), ICH_GetClassColor("DEATHKNIGHT")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(12, "Охотник на демонов"), ICH_GetClassColor("DEMONHUNTER")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(11, "Друид"), ICH_GetClassColor("DRUID")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(3, "Охотник"), ICH_GetClassColor("HUNTER")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(8, "Маг"), ICH_GetClassColor("MAGE")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(10, "Монах"), ICH_GetClassColor("MONK")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(2, "Паладин"), ICH_GetClassColor("PALADIN")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(5, "Жрец"), ICH_GetClassColor("PRIEST")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(4, "Разбойник"), ICH_GetClassColor("ROGUE")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(7, "Шаман"), ICH_GetClassColor("SHAMAN")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(9, "Чернокнижник"), ICH_GetClassColor("WARLOCK")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "Можно получить бесплатно, достигнув 80 уровня с Хронобегуном "..WrapTextInColor(ICH_GetClassName(1, "Воин"), ICH_GetClassColor("WARRIOR")).." и получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "Этот питомец является наградой за цепочку заданий, начинающуюся с предмета "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]")..", который можно купить у торговца."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "Помечено как эксклюзив события, так как было доступно только во время события до выхода Legion."
L["Available In"] = "Доступно в"
L["Event Exclusive"] = "Эксклюзив события"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "Поиск по названию/типу предмета коллекции или дополнению"
L["Unable to transfer Bronze to this character right now."] = "Сейчас невозможно передать "..ICH_GetCurrencyName(3252, "Bronze").." этому персонажу."
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "Получается через цепочку заданий, начинающуюся с "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]"))..", которое можно купить у торговца."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "Это значительно проще получить в Legion: Remix, так как необходимые для цепочки заданий предметы выдаются при покупке этого предмета."

--- Decor ---
L["Decor"] = "Декор"
L["Obtainable for free by earning the achievement Broken Isles World Quests V"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42674)) or "Broken Isles World Quests V")
L["Obtainable for free by earning the achievement Legion Remix Raids"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42321)) or "Legion Remix Raids")
L["Obtainable for free by earning the achievement The Armies of Legionfall"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42655)) or "The Armies of Legionfall")
L["Obtainable for free by earning the achievement Argussian Reach"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42627)) or "Argussian Reach")
L["Obtainable for free by earning the achievement Timeworn Keystone Master"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42689)) or "Timeworn Keystone Master")
L["Obtainable for free by earning the achievement Highmountain Tribe"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42547)) or "Highmountain Tribe")
L["Obtainable for free by earning the achievement Defending the Broken Isles III"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42675)) or "Defending the Broken Isles III")
L["Obtainable for free by earning the achievement The Nightfallen"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42628)) or "The Nightfallen")
L["Obtainable for free by earning the achievement Dreamweavers"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42619)) or "Dreamweavers")
L["Obtainable for free by earning the achievement Power of the Obelisks II"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61060)) or "Power of the Obelisks II")
L["Obtainable for free by earning the achievement Broken Isles Dungeoneer"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42692)) or "Broken Isles Dungeoneer")
L["Obtainable for free by earning the achievement Heroic Broken Isles World Quests III"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61054)) or "Heroic Broken Isles World Quests III")
L["Obtainable for free by earning the achievement The Wardens"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61218)) or "The Wardens")
L["Obtainable for free by earning the achievement Court of Farondis"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42318)) or "Court of Farondis")
L["Obtainable for free by earning the achievement Valarjar"] = "Можно получить бесплатно, получив достижение "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42658)) or "Valarjar")
L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"] = "При входе в подземелье сложность автоматически установится на Обычную."
L["Dropped by Vanessa VanCleef on Heroic difficulty"] = "Выпадает с "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Ванессы ван Клиф").." в героическом режиме"
