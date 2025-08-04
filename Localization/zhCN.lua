local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "zhCN")

if not L then return end

--- Mount Notes ---
L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有10人的难度，因此在进入副本之前可以设置任何团队难度"
L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有25人的难度，因此在进入副本之前可以设置任何团队难度"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "只有普通旧团队副本难度可用，but Heroic should be set if "..WrapTextInColor("生命缚誓者的侍女", DARKYELLOW_FONT_COLOR).." is not obtained yet" -- 注意: "生命守縛者的女僕" -> "生命缚誓者的侍女" (简体官方译名)
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "掉落于小怪围绕于"..WrapTextInColor("安其拉神殿", DARKYELLOW_FONT_COLOR) -- 注意: "安其拉神廟" -> "安其拉神殿" (简体通用译法)
L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有40人的难度，因此在进入副本之前可以设置任何团队难度"
L["Also obtainable in Timewalking"] = "也可以在时光漫游中获得"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "在团队查找器难度(LFR)中获得，须击杀 "..WrapTextInColor("吉安娜·普罗德摩尔女士", DARKYELLOW_FONT_COLOR) -- 注意: "珍娜·普羅德摩爾女士" -> "吉安娜·普罗德摩尔女士" (简体官方译名)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "只对"..WrapTextInColor("联盟", PLAYER_FACTION_COLOR_ALLIANCE).."角色掉落，但取得后也会获得"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."版本"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "只对"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."角色掉落，但取得后也会获得"..WrapTextInColor("联盟", PLAYER_FACTION_COLOR_ALLIANCE).."版本"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "进入副本后，团队难度将自动设定为普通"
L["Requires completing the Tazavesh story line to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "需要完成"..WrapTextInColor("塔扎维什", DARKYELLOW_FONT_COLOR).."的故事线才能解锁飞行路径，先从 |A:QuestNormal:15:15|a"..WrapTextInColor(C_QuestLog.GetTitleForQuestID(63976), DARKYELLOW_FONT_COLOR).." 开始" -- 注意: "塔札維許" -> "塔扎维什" (简体官方译名)

--- Instance Difficulties ---
L["LFR"] = "LFR" -- 通常保留缩写
L["Normal"] = "普通"
L["Heroic"] = "英雄"
L["Mythic"] = "史诗"
L["10 Player"] = "10人"
L["10 Player (Heroic)"] = "10人(英雄)"
L["25 Player"] = "25人"
L["25 Player (Heroic)"] = "25人(英雄)"
L["Unknown"] = "未知"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "地下城难度已经设定为"
L["Legacy Raid Difficulty is already set to"] = "旧团队副本难度已经设定为"
L["Raid Difficulty is already set to"] = "团队副本难度已经设定为"
L["Current Instance Difficulties"] = "当前副本难度"
L["Dungeon Difficulty:"] = "地下城难度:"
L["Legacy Raid Difficulty:"] = "旧团队副本难度:"
L["Raid Difficulty:"] = "团队副本难度:"
L["Invalid dungeon difficulty provided."] = "提供了无效的地下城难度。"
L["Invalid legacy raid difficulty provided."] = "提供了无效的旧团队副本难度。"
L["Invalid raid difficulty provided."] = "提供了无效的团队副本难度。"
L["Accepted values:"] = "接受的值:"
L["Show/hide the minimap icon"] = "显示/隐藏小地图图标"
L["Updated available mount list"] = "更新可用坐骑列表"
L["Map pin set for"] = "设定地图标记点在"
L["Unable to set map pin for"] = "无法设定地图标记点在"
L["TomTom waypoint set for"] = "TomTom路径点设定在"
L["Unable to set TomTom waypoint for"] = "TomTom路径点无法设定在"

--- Slash Commands ---
L["Display all current instance difficulties"] = "显示所有当前副本难度"
L["Set dungeon difficulty."] = "设定地下城难度。"
L["Set legacy raid difficulty."] = "设定旧团队副本难度。"
L["Set raid difficulty."] = "设定团队副本难度。"
L["Show/hide the minimap icon"] = "显示/隐藏小地图图标" -- 重复项，已翻译

--- Icon Tooltip ---
L["Track available mounts from instances and easily set required instance difficulty"] = "跟踪副本可用的坐骑，并易于设定所需的副本难度"
L["Type \"/ich help\" in the chat window for available slash commands"] = "在聊天中输入 \"/ich help\" 来看可用的指令"

-- Special Search Terms --
L["dungeon"] = "地下城"
L["raid"] = "团队"

--- UI ---
L["Search by mount/instance name, instance type, or difficulty"] = "搜索根据坐骑/副本名称，副本类型或难度"
L["Scale"] = "缩放"
L["Use TomTom waypoints"] = "使用TomTom路径点"
L["Show Owned Mounts"] = "显示已拥有的坐骑"
L["How To Use:"] = "如何使用:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "寻找你想要在列表中收集的坐骑，并点击你想要刷的难度按钮。"
L["to make sure it is updated."] = "为确保列表更新。"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "当您的坐骑被锁定在特定难度上时，该难度的按钮将被禁用。"
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "对于那些进度锁定，在另一个难度的旧团队副本的按钮也将禁用。"
L["are shared across difficulties."] = "因为难度是共用的。"
L["Search Hints:"] = "搜索提示:"
L["\"raid\" will show all mounts that can be collected from a raid"] = WrapTextInColor("\"团队\"", DARKYELLOW_FONT_COLOR).." 将显示所有可以从团队中收集的坐骑"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = WrapTextInColor("\"10\"", DARKYELLOW_FONT_COLOR).." 将显示所有可以从旧10人团队(普通或英雄)中收集的坐骑"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = WrapTextInColor("\"fel\"", DARKYELLOW_FONT_COLOR).." 将显示所有坐骑与副本名字中包含 \"fel\" 的"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = WrapTextInColor("\"史诗\"", DARKYELLOW_FONT_COLOR).." 将显示所有可以从史诗地下城或团队副本中获得的坐骑"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = WrapTextInColor("\"lfr\"", DARKYELLOW_FONT_COLOR).." 将显示所有可以从团队查找器难度(LFR)中收集的坐骑" -- 注意: "團隊搜尋器" -> "团队查找器" (简体官方译法)
L["Name"] = "名字"
L["Instance"] = "副本"
L["Available Difficulty(s)"] = "可用难度"
L["Shares lockout with:"] = "共用进度在:"
L["View in mount journal"] = "在坐骑日志中观看"
L["View in encounter journal"] = "在冒险指南中观看" -- 注意: "冒險指南" 是简体中文客户端对冒险指南的称呼
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "此按钮仅用于追踪团队查找器(LFR)进度。团队难度并未改变。" -- 注意: "團隊搜尋器" -> "团队查找器"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "需要在给定的时间内完成某些目标，因此建议搜索指南以在尝试之前在线获取此坐骑"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "不要与任何泰坦守护者交谈，否则该坐骑不会掉落"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一个 "..WrapTextInColor("奥丹姆", DARKYELLOW_FONT_COLOR).." 或 "..WrapTextInColor("永恒之井", DARKYELLOW_FONT_COLOR) -- 注意: "恆春谷" -> "永恒之井" (简体官方译名, 但魔兽中通常译作"锦绣谷"，这里根据上下文判断应为"永恒之井"或"锦绣谷"，但原词是"Vale of Eternal Blossoms"，简体为"锦绣谷")
-- 修正上面一行，Vale of Eternal Blossoms 简体中文是 "锦绣谷"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一个 "..WrapTextInColor("奥丹姆", DARKYELLOW_FONT_COLOR).." 或 "..WrapTextInColor("锦绣谷", DARKYELLOW_FONT_COLOR) -- 修正为"锦绣谷"
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "在您处于特定区域之前，在小地图上的路径点追踪可能并不总是出现。"
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "举例，指向的箭头 "..WrapTextInColor("雷电王座", DARKYELLOW_FONT_COLOR).." 会显示只有当您位于 "..WrapTextInColor("雷神岛", DARKYELLOW_FONT_COLOR) -- 注意: "雷霆王座" -> "雷电王座", "雷王島" -> "雷神岛" (简体官方译名)
L["Set map pin"] = "设定地图标记"
L["Set TomTom waypoint"] = "设定 "..WrapTextInColor("TomTom", DARKYELLOW_FONT_COLOR).." 路径点" -- TomTom 是插件名，保留