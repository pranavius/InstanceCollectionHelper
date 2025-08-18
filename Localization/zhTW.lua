local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "zhTW")

if not L then return end

--- Mount Notes ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有10人的難度，因此在進入副本之前可以設置任何團隊難度"
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有25人的難度，因此在進入副本之前可以設置任何團隊難度"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "只有普通舊團隊副本難度可用，but Heroic should be set if "..WrapTextInColor("生命守縛者的女僕", DARKYELLOW_FONT_COLOR).." is not obtained yet"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "掉落於小怪圍繞於"..WrapTextInColor("安其拉神廟", DARKYELLOW_FONT_COLOR)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "此團隊副本只有40人的難度，因此在進入副本之前可以設置任何團隊難度"
L["Also obtainable in Timewalking"] = "也可以在時光漫遊中獲得"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "在團隊搜尋器難度(LFR)中獲得，須擊殺 "..WrapTextInColor("珍娜·普羅德摩爾女士", DARKYELLOW_FONT_COLOR)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "只對"..WrapTextInColor("聯盟", PLAYER_FACTION_COLOR_ALLIANCE).."角色掉落，但取得後也會獲得"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."版本"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "只對"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."角色掉落，但取得後也會獲得"..WrapTextInColor("聯盟", PLAYER_FACTION_COLOR_ALLIANCE).."版本"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "進入副本後，團隊難度將自動設定為普通"
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "需要完成"..WrapTextInColor("塔札維許", DARKYELLOW_FONT_COLOR).."的故事線才能解鎖飛行路徑，先從 |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos", DARKYELLOW_FONT_COLOR).." 開始"

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
L["Scale"] = "縮放"
L["Use TomTom waypoints"] = "使用TomTom路徑點"
L["Show Owned Mounts"] = "顯示已擁有的坐騎"
L["Show Owned"] = "顯示收集的物品"
L["How To Use:"] = "如何使用:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "尋找你想要在列表中收集的坐騎，並點擊你想要刷的難度按鈕。"
L["to make sure it is updated."] = "為確保列表更新。"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "當您的坐騎被鎖定在特定難度上時，該難度的按鈕將被禁用。"
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "對於那些進度鎖定，在另一個難度的舊團隊副本的按鈕也將禁用。"
L["are shared across difficulties."] = "因為難度是共用的。"
L["Search Hints:"] = "搜尋提示:"
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"團隊\"", DARKYELLOW_FONT_COLOR).." 將顯示所有可以從團隊中收集的坐騎"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." 將顯示所有可以從舊10人團隊(普通或英雄)中收集的坐騎"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." 將顯示所有坐騎與副本名字中包含 \"fel\" 的"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"史詩\"", DARKYELLOW_FONT_COLOR).." 將顯示所有可以從史詩地下城或團隊副本中獲得的坐騎"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." 將顯示所有可以從團隊搜尋器難度(LFR)中收集的坐騎"
L["Name"] = "名字"
L["Instance"] = "副本"
L["Available Difficulty(s)"] = "可用難度"
L["Shares lockout with:"] = "共用進度在:"
L["View in mount journal"] = "在坐騎日誌中觀看"
L["View in encounter journal"] = "在冒險指南中觀看"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "此按鈕僅用於追蹤團隊搜尋器(LFR）進度。團隊難度並未改變。"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "需要在給定的時間內完成某些目標，因此建議搜尋指南以在嘗試之前在線上獲取此坐騎"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "不要與任何泰坦守護者交談，否則該坐騎不會掉落"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一個 "..WrapTextInColor("奧丹姆", DARKYELLOW_FONT_COLOR).." 或 "..WrapTextInColor("恆春谷", DARKYELLOW_FONT_COLOR)
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "在您處於特定區域之前，在小地圖上的路徑點追蹤可能並不總是出現。"
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "舉例，指向的箭頭 "..WrapTextInColor("雷霆王座", DARKYELLOW_FONT_COLOR).." 會顯示只有當您位於 "..WrapTextInColor("雷王島", DARKYELLOW_FONT_COLOR)
L["Set map pin"] = "設定地圖標記"
L["Set TomTom waypoint"] = "設定 "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR).." 路徑點"

--- About ---
L["About the AddOn"] = "關於外掛"               -- note: could also be "關於插件" depending on preference
L["Created by Pranavius"] = "由 Pranavius 製作"
L["Translations:"] = "翻譯："
L["Open ICH"] = "開啟 ICH"
L["Close"] = "關閉"