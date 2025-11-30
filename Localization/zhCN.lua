local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "zhCN")

if not L then return end

--- Mount Notes ---
-- L["This raid only has a 10 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有10人的难度，因此在进入副本之前可以设置任何团队难度"
-- L["This raid only has a 25 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有25人的难度，因此在进入副本之前可以设置任何团队难度"
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "只有普通旧团队副本难度可用，but Heroic should be set if "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("生命缚誓者的侍女").." is not obtained yet" -- 注意: "生命守縛者的女僕" -> "生命缚誓者的侍女" (简体官方译名)
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = "掉落于小怪围绕于"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("安其拉神殿") -- 注意: "安其拉神廟" -> "安其拉神殿" (简体通用译法)
-- L["This raid only has a 40 player difficulty, so any raid difficulty can be set before entering the instance"] = "此团队副本只有40人的难度，因此在进入副本之前可以设置任何团队难度"
L["Also obtainable in Timewalking"] = "也可以在时光漫游中获得"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "在团队查找器难度(LFR)中获得，须击杀 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("吉安娜·普罗德摩尔女士") -- 注意: "珍娜·普羅德摩爾女士" -> "吉安娜·普罗德摩尔女士" (简体官方译名)
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = "只对"..WrapTextInColor("联盟", PLAYER_FACTION_COLOR_ALLIANCE).."角色掉落，但取得后也会获得"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."版本"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = "只对"..WrapTextInColor("部落", PLAYER_FACTION_COLOR_HORDE).."角色掉落，但取得后也会获得"..WrapTextInColor("联盟", PLAYER_FACTION_COLOR_ALLIANCE).."版本"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "进入副本后，团队难度将自动设定为普通"
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "需要完成"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("塔扎维什").."的故事线才能解锁飞行路径，先从 |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(C_QuestLog.GetTitleForQuestID(63976) or "The Al'ley Cat of Oribos").." 开始" -- 注意: "塔札維許" -> "塔扎维什" (简体官方译名)
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "在激活困难模式后需要完成该地下城。有关如何进行的指南可在网上找到。"

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = "掉落自"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("瑟尔林·卡斯迪诺夫教授").."，在击杀"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("血骨傀儡").."后有几率出现"
L["Dropped by the Rare Elite Vixx the Collector"] = "掉落自稀有精英"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("收集者维克斯")
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "该物品可获得，尽管它未显示在"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("古尔丹").."的掉落表中"
L["Can drop from every boss in the dungeon"] = "可以从副本中的每个首领处掉落"
L["Can only be looted and used by a Druid"] = "仅限"..WrapTextInColor(select(1, GetClassInfo(11)), C_ClassColor.GetClassColor("DRUID")).."拾取并使用"
L["Can also be looting by fishing within the instance"] = "也可以通过在副本内钓鱼获得"
L["Requires completion of the achievement Relics of a Fallen Empire"] = "需要完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire")
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "此物品仅在通灵学院经典版本中可收集。如果尚未解锁此副本，请先在线查找指南。"
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "掉落自隐藏首领"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("工程师欧米加普格")
L["It is highly recommended to attempt this encounter with a full party"] = "强烈建议以完整小队尝试此首领战"
L["Can only be looted and used by a Demon Hunter"] = "仅限"..WrapTextInColor(select(1, GetClassInfo(12)), C_ClassColor.GetClassColor("DEMONHUNTER")).."拾取并使用"
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "掉落自"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("卡洛斯").."，他在塔倫米爾(塔伦米尔)以南的道路部分巡逻"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = "有报告称在击杀一些首领后"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("卡洛斯").."会消失；请谨慎行事"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = "掉落自位于"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("墨格瑞拉").."与"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("季鹍").."之间的巨型蜗牛怪物"

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
L["Search by toy/instance name, instance type, or difficulty"] = "按玩具/副本名称、副本类型或难度搜索"
L["Scale"] = "缩放"
L["Use TomTom waypoints"] = "使用TomTom路径点"
-- L["Show Owned Mounts"] = "显示已拥有的坐骑"
L["Show Owned"] = "显示收集的物品"
L["How To Use:"] = "如何使用:"
L["Find the mount you want to collect in the list and click the button for the difficulty you want to run on"] = "寻找你想要在列表中收集的坐骑，并点击你想要刷的难度按钮。"
L["to make sure it is updated."] = "为确保列表更新。"
L["When you are locked out for a mount on a particular difficulty, the button for that difficulty will be disabled."] = "当您的坐骑被锁定在特定难度上时，该难度的按钮将被禁用。"
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "对于那些进度锁定，在另一个难度的旧团队副本的按钮也将禁用。"
L["are shared across difficulties."] = "因为难度是共用的。"
L["Search Hints:"] = "搜索提示:"
L["\"raid\" will show all mounts that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"团队\"").." 将显示所有可以从团队中收集的坐骑"
L["\"10\" will show all mounts that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").." 将显示所有可以从旧10人团队(普通或英雄)中收集的坐骑"
L["\"fel\" will show all mounts and instances that contain \"fel\" in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").." 将显示所有坐骑与副本名字中包含 \"fel\" 的"
L["\"mythic\" will show all mounts that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"史诗\"").." 将显示所有可以从史诗地下城或团队副本中获得的坐骑"
L["\"lfr\" will show all mounts that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").." 将显示所有可以从团队查找器难度(LFR)中收集的坐骑" -- 注意: "團隊搜尋器" -> "团队查找器" (简体官方译法)
L["Name"] = "名字"
L["Instance"] = "副本"
L["Available Difficulty(s)"] = "可用难度"
L["Shares lockout with:"] = "共用进度在:"
-- L["View in mount journal"] = "在坐骑日志中观看"
L["View in encounter journal"] = "在冒险指南中观看" -- 注意: "冒險指南" 是简体中文客户端对冒险指南的称呼
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "此按钮仅用于追踪团队查找器(LFR)进度。团队难度并未改变。" -- 注意: "團隊搜尋器" -> "团队查找器"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "需要在给定的时间内完成某些目标，因此建议搜索指南以在尝试之前在线获取此坐骑"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "不要与任何泰坦守护者交谈，否则该坐骑不会掉落"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一个 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("奥丹姆").." 或 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("永恒之井") -- 注意: "恆春谷" -> "永恒之井" (简体官方译名, 但魔兽中通常译作"锦绣谷"，这里根据上下文判断应为"永恒之井"或"锦绣谷"，但原词是"Vale of Eternal Blossoms"，简体为"锦绣谷")
-- 修正上面一行，Vale of Eternal Blossoms 简体中文是 "锦绣谷"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "入口可以在任何一个 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("奥丹姆").." 或 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("锦绣谷") -- 修正为"锦绣谷"
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "在您处于特定区域之前，在小地图上的路径点追踪可能并不总是出现。"
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "举例，指向的箭头 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("雷电王座").." 会显示只有当您位于 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("雷神岛") -- 注意: "雷霆王座" -> "雷电王座", "雷王島" -> "雷神岛" (简体官方译名)
L["Set map pin"] = "设定地图标记"
L["Set TomTom waypoint"] = "设定 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom").." 路径点" -- TomTom 是插件名，保留
L["Coming soon"] = "即将推出"

--- About ---
L["About the AddOn"] = "关于插件"
L["Created by Pranavius"] = "由 Pranavius 创建"
L["Translations:"] = "翻译："
L["Open ICH"] = "打开 ICH"
L["Close"] = "关闭"

--- New in v11: To be categorized ---
L["Type"] = "类型"
L["Expansion"] = "资料片"
L["Cost"] = "价格"
L["Random chance to obtain when opening a  Bag of Fishing Treasures"] = "有几率在打开一个 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Bag of Fishing Treasures").." 时获得"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = "最初作为完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways").." 的奖励。现在可以从任何时光漫游供应商处购买"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = "最初作为完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II").." 的奖励。现在可以从任何时光漫游供应商处购买"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = "最初作为完成成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III").." 的奖励。现在可以从任何时光漫游供应商处购买"
L["Special Thanks"] = "特别感谢"
L["Mount"] = "坐骑"
L["Pet"] = "宠物"
L["Toy"] = "玩具"
L["Timewalking Vendor"] = "时空漫游商人"
L["Unable to transfer Timewarped Badges to this character right now."] = "当前无法将时空扭曲徽章章转移到此角色。"
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "无法打开货币转移菜单。请手动打开或重试。"
L["Click to open currency transfer menu"] = "点击以打开货币转移菜单"
L["Cannot transfer to this character"] = "无法转移到此角色"
L["Legion: Remix Vendor"] = "军团再临：Remix 供应商"
--- New in v12: To be categorized ---
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "通过使一名死亡骑士 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "通过使一名恶魔猎手 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "通过使一名德鲁伊 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "通过使一名猎人 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "通过使一名法师 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "通过使一名武僧 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "通过使一名圣骑士 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "通过使一名牧师 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "通过使一名潜行者 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "通过使一名萨满 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "通过使一名术士 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock").." 可免费获得"
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "通过使一名战士 Timerunner 达到80级并获得成就 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior").." 可免费获得"
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "此宠物是由物品"..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]").."开启的任务链的奖励，该物品可从商贩处购买。"
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "标记为活动限定，因为它只在《军团再临》前置补丁活动期间可获得。"
L["Available In"] = "可用于"
L["Event Exclusive"] = "活动限定"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "按收藏物名称/类型或资料片搜索"
--- New in v12.1: To be categorized ---
L["Unable to transfer Bronze to this character right now."] = "目前无法将青铜转移到该角色。"
--- New in v12.2: To be categorized ---
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "通过物品"..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]")).."开启的任务链获得，该物品可从商人处购买。"
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "在《Legion: Remix》中更容易获得，因为购买此物品时会将任务链所需的物品一并交付给你。"
