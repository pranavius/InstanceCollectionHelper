local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "zhTW")

if not L then return end

--- Mount Notes ---
-- L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有10人的難度，因此在進入副本之前可以設置任何團隊難度"
-- L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有25人的難度，因此在進入副本之前可以設置任何團隊難度"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "只有普通舊團隊副本難度可用，but Heroic should be set if "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("生命守縛者的女僕").." is not obtained yet"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "掉落於小怪圍繞於"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("安其拉神廟")
-- L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有40人的難度，因此在進入副本之前可以設置任何團隊難度"
L["Also obtainable in Timewalking"] = "也可以在時光漫遊中獲得"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "在團隊搜尋器難度(LFR)中獲得，須擊殺 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("珍娜·普羅德摩爾女士")
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "只對"..WrapTextInColor("聯盟", PLAYER_FACTION_COLOR_ALLIANCE).."角色掉落，但取得後也會獲得"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."版本"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "只對"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."角色掉落，但取得後也會獲得"..WrapTextInColor("聯盟", PLAYER_FACTION_COLOR_ALLIANCE).."版本"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "進入副本後，團隊難度將自動設定為普通"
L["Requires completing the Tazavesh story line to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "需要完成"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("塔札維許").."的故事線才能解鎖飛行路徑，先從 |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos").." 開始"
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "在啟動困難模式後需要完成此副本。可在線上找到如何進行的指南。"

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "掉落自 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("瑟爾林‧卡斯迪諾夫教授").."，在擊殺 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("血骨傀儡").." 後有機率出現"
L["Dropped by the Rare Elite Vixx the Collector"] = "掉落自稀有精英 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("收藏家』維克斯")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "此物品可獲得，儘管它未出現在 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("古爾丹").." 的掉落表中"
L["Can drop from every boss in the dungeon"] = "可從該副本的每個首領掉落"
L["Can only be looted and used by a Druid"] = "僅限 "..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID")).." 掠取並使用"
L["Can also be looting by fishing within the instance"] = "也可在副本內透過釣魚獲得"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "需要完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "此物僅可在通靈學院（經典版）中取得。如尚未解鎖此副本，請先線上尋找教學。"
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "掉落自隱藏首領 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("終極工程師歐米茄布")
L["It is highly recommended to attempt this encounter with a full party"] = "強烈建議使用完整小隊來嘗試此首領戰"
L["Can only be looted and used by a Demon Hunter"] = "僅限 "..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER")).." 掠取並使用"
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "掉落自 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("卡洛斯大爺").."，他巡邏塔倫米爾以南路徑的一部分"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "有報告指出在擊殺某些首領後 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("卡洛斯大爺").." 會消失；請小心行事"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "掉落自位於 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("梅賈拉").." 與 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("稷坤").." 之間的巨蝸怪物"

--- Instance Difficulties ---
L["LFR"] = "LFR"
L["Normal"] = "普通"
L["Heroic"] = "英雄"
L["Mythic"] = "史詩"
L["10 player"] = "10人"
L["10 Player (Heroic)"] = "10人(英雄)"
L["25 player"] = "25人"
L["25 Player (Heroic)"] = "25人(英雄)"
L["Unknown"] = "未知"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "地下城難度已經設定為"
L["Legacy Raid Difficulty is already set to"] = "舊團隊副本難度已經設定為"
L["Raid Difficulty is already set to"] = "團隊副本難度已經設定為"
L["Current Instance Difficulties"] = "當前副本難度"
L["Dungeon Difficulty:"] = "地下城難度:"
L["Legacy Raid Difficulty:"] = "舊團隊副本難度:"
L["Raid Difficulty:"] = "團隊副本難度:"
L["Invalid dungeon difficulty provided."] = "提供了無效的地下城難度。"
L["Invalid legacy raid difficulty provided."] = "提供了無效的舊團隊副本難度。"
L["Invalid raid difficulty provided."] = "提供了無效的團隊副本難度。"
L["Accepted values:"] = "接受的值:"
L["Show/hide the minimap icon"] = "顯示/隱藏小地圖圖示"
L["Updated available mount list"] = "更新可用坐騎列表"
L["Map pin set for"] = "設定地圖標記點在"
L["Unable to set map pin for"] = "無法設定地圖標記點在"
L["TomTom waypoint set for"] = "TomTom路徑點設定在"
L["Unable to set TomTom waypoint for"] = "TomTom路徑點無法設定在"

--- Slash Commands ---
L["Display all current instance difficulties"] = "顯示所有當前副本難度"
L["Set dungeon difficulty."] = "設定地下城難度。"
L["Set legacy raid difficulty."] = "設定舊團隊副本難度。"
L["Set raid difficulty."] = "設定團隊副本難度。"
L["Show/hide the minimap icon"] = "顯示/隱藏小地圖圖示"

--- Icon Tooltip ---
L["Track available mounts from instances and easily set required instance difficulty"] = "跟踪副本可用的坐騎，並易於設定所需的副本難度"
L["Type \"/ich help\" in the chat window for available slash commands"] = "在聊天中輸入 \"/ich help\" 來看可用的指令"

-- Special Search Terms --
L["dungeon"] = "地下城"
L["raid"] = "團隊"

--- UI ---
L["Search by mount/instance name, instance type, or difficulty"] = "搜尋根據坐騎/副本名稱，副本類型或難度"
L["Search by toy/instance name, instance type, or difficulty"] = "搜尋根據玩具/副本名稱、副本類型或難度"
L["Scale"] = "縮放"
L["Use TomTom waypoints"] = "使用TomTom路徑點"
-- L["Show Owned Mounts"] = "顯示已擁有的坐騎"
L["Show Owned"] = "顯示收集的物品"
L["How To Use:"] = "如何使用:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "尋找你想要在列表中收集的坐騎，並點擊你想要刷的難度按鈕。"
L["to make sure it is updated."] = "為確保列表更新。"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "當您的坐騎被鎖定在特定難度上時，該難度的按鈕將被禁用。"
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "對於那些進度鎖定，在另一個難度的舊團隊副本的按鈕也將禁用。"
L["are shared across difficulties."] = "因為難度是共用的。"
L["Search Hints:"] = "搜尋提示:"
L["\"raid\" will show all mounts that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"團隊\"").." 將顯示所有可以從團隊中收集的坐騎"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." 將顯示所有可以從舊10人團隊(普通或英雄)中收集的坐騎"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." 將顯示所有坐騎與副本名字中包含 \"fel\" 的"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"史詩\"").." 將顯示所有可以從史詩地下城或團隊副本中獲得的坐騎"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." 將顯示所有可以從團隊搜尋器難度(LFR)中收集的坐騎"
L["Name"] = "名字"
L["Instance"] = "副本"
L["Available Difficulty(s)"] = "可用難度"
L["Shares lockout with:"] = "共用進度在:"
-- L["View in mount journal"] = "在坐騎日誌中觀看"
L["View in encounter journal"] = "在冒險指南中觀看"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "此按鈕僅用於追蹤團隊搜尋器(LFR）進度。團隊難度並未改變。"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "需要在給定的時間內完成某些目標，因此建議搜尋指南以在嘗試之前在線上獲取此坐騎"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "不要與任何泰坦守護者交談，否則該坐騎不會掉落"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一個 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("奧丹姆").." 或 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("恆春谷")
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "在您處於特定區域之前，在小地圖上的路徑點追蹤可能並不總是出現。"
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "舉例，指向的箭頭 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("雷霆王座").." 會顯示只有當您位於 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("雷王島")
L["Set map pin"] = "設定地圖標記"
L["Set TomTom waypoint"] = "設定 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom").." 路徑點"
L["Coming soon"] = "即將推出"

--- About ---
L["About the AddOn"] = "關於外掛"               -- note: could also be "關於插件" depending on preference
L["Created by Pranavius"] = "由 Pranavius 製作"
L["Translations:"] = "翻譯："
L["Open ICH"] = "開啟 ICH"
L["Close"] = "關閉"

--- New in v11: To be categorized ---
L["Type"] = "類型"
L["Expansion"] = "資料片"
L["Cost"] = "價格"
L["Random chance to obtain when opening a  Bag of Fishing Treasures"] = "打開一個 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures").." 時有隨機幾率獲得"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "最初作為完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways").." 的獎勵。現在可從任何時光漫遊供應商處購買"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "最初作為完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II").." 的獎勵。現在可從任何時光漫遊供應商處購買"
L["Special Thanks"] = "特別鳴謝"
L["Mount"] = "坐騎"
L["Pet"] = "寵物"
L["Toy"] = "玩具"
L["Timewalking Vendor"] = "时空漫游商人"
L["Unable to transfer Timewarped Badges to this character right now."] = "目前無法將時光扭曲徽章移到此角色。"
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "無法打開貨幣轉移選單。請手動打開或再試一次。"
L["Click to open currency transfer menu"] = "點擊以打開貨幣轉移選單"
L["Cannot transfer to this character"] = "無法轉移給此角色"
L["Legion: Remix Vendor"] = "軍團再臨：Remix 供應商"
--- New in v12: To be categorized ---
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "透過使一名死亡騎士 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "透過使一名惡魔獵人 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "透過使一名德魯伊 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "透過使一名獵人 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "透過使一名法師 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "透過使一名武僧 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "透過使一名聖騎士 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "透過使一名牧師 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "透過使一名盜賊 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "透過使一名薩滿 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "透過使一名術士 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock").." 可免費獲得"
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "透過使一名戰士 Timerunner 達到 80 級並獲得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior").." 可免費獲得"
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "此寵物是由物品"..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]").."啟動的任務鏈的獎勵，可從商人處購買該物品。"
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "標記為活動專屬，因為它僅在《軍團再臨》預熱活動期間可獲得。"
L["Available In"] = "適用於"
L["Event Exclusive"] = "活動專屬"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "依收藏品名稱/類型或資料片搜索"
--- New in v12.1: To be categorized ---
L["Unable to transfer Bronze to this character right now."] = "目前無法將青銅轉移到該角色。"
--- New in v12.2: To be categorized ---
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "透過物品"..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]")).."啟動的任務鏈取得，此物品可從商人處購買。"
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "在《Legion: Remix》中更容易取得，因為購買此物品時會把任務鏈所需的物品一併交給你。"
