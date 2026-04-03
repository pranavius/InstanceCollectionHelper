local name = ...
local L = LibStub("AceLocale-3.0"):NewLocale(name, "koKR")

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
L["Available in Normal Legacy Raid difficulty, but Heroic should be set if Life-Binder's Handmaiden is not obtained yet"] = "고대 공격대 일반 난이도에서 획득 가능하지만, "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("생명의 어머니의 시녀").."를 아직 획득하지 못한 경우 영웅 난이도로 설정해야 합니다"
L["Drop from trash mobs around Temple of Ahn'Qiraj"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("안퀴라즈 사원").." 주변의 일반 몬스터에게서 획득"
L["Also obtainable in Timewalking"] = "시간여행에서도 획득 가능"
L["Obtainable in Raid Finder (LFR) difficulty by killing Lady Jaina Proudmoore"] = "공격대 찾기(LFR) 난이도에서 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("여군주 제이나 프라우드무어").." 처치 시 획득 가능"
L["Drops for Alliance characters, but obtaining this also gives you the Horde version"] = WrapTextInColor("얼라이언스", PLAYER_FACTION_COLOR_ALLIANCE).." 캐릭터에게 드랍되며, 획득 시 "..WrapTextInColor("호드", PLAYER_FACTION_COLOR_HORDE).." 버전도 함께 획득됩니다"
L["Drops for Horde characters, but obtaining this also gives you the Alliance version"] = WrapTextInColor("호드", PLAYER_FACTION_COLOR_HORDE).." 캐릭터에게 드랍되며, 획득 시 "..WrapTextInColor("얼라이언스", PLAYER_FACTION_COLOR_ALLIANCE).." 버전도 함께 획득됩니다"
L["Upon entering the instance, raid difficulty will automatically be set to Normal"] = "인스턴스에 입장하면 공격대 난이도가 자동으로 일반으로 설정됩니다"
L["Do not talk to any of the Titan Keepers, otherwise this mount will not drop"] = "티탄 수호자에게 말을 걸지 마세요. 그렇지 않으면 이 탈것이 드랍되지 않습니다"
L["Requires completing certain objectives within a given amount of time, so it's recommended to search for a guide to obtain this mount online before attempting"] = "정해진 시간 내에 특정 목표를 완료해야 하므로, 시도하기 전에 온라인에서 이 탈것 획득 가이드를 찾아보는 것을 권장합니다"
L["Entrance can be in either Uldum or Vale of Eternal Blossoms"] = "입구는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("울둠").." 또는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("영원꽃 골짜기").."에 있을 수 있습니다"
L["Requires completing the Tazavesh storyline to unlock flight path, beginning with The Al'ley Cat of Oribos"] = "비행 경로를 잠금 해제하려면 타자베시 스토리라인을 완료해야 하며, |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(63976) or "오리보스의 골목 고양이").."부터 시작합니다" -- Currently unused
L["Requires completing a short questline after looting Malfunctioning Mechsuit"] = (select(2, C_Item.GetItemInfo(226683)) or EPIC_PURPLE_COLOR:WrapTextInColorCode("[Malfunctioning Mechsuit]")).."을(를) 획득한 후 짧은 퀘스트 체인을 완료해야 합니다"
L["Requires completing the dungeon after activating Hard Mode. Guides for how to do so can be found online."] = "하드 모드를 활성화한 후 던전을 완료해야 합니다. 방법에 대한 가이드는 온라인에서 찾을 수 있습니다."
L["Clear the dungeon solo, then return to the area where Domina Venomblade was and interact with the Curious Slime Serpent."] = "혼자서 던전을 클리어한 후 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("도미나 베놈블레이드").."가 있던 지역으로 돌아가 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("호기심 많은 점액 뱀").."과 상호작용하세요."

--- Toy Notes ---
L["Dropped by Doctor Theolen Krastinov, who has a random chance to spawn after killing Rattlegore"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("의사 테올렌 크라스티노브").."에게서 획득. "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("들창엄니").." 처치 후 무작위 확률로 등장합니다"
L["Dropped by the Rare Elite Vixx the Collector"] = "희귀 정예 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("수집가 빅스").."에게서 획득"
L["This item is obtainable even though it does not appear on the loot table for Gul'dan"] = "이 아이템은 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("굴단").."의 전리품 목록에 표시되지 않지만 획득할 수 있습니다"
L["Can drop from every boss in the dungeon"] = "던전의 모든 보스에게서 드랍될 수 있습니다"
L["Can only be looted and used by a Druid"] = WrapTextInColor(ICH_GetClassName(11, "드루이드"), ICH_GetClassColor("DRUID")).."만 획득하고 사용할 수 있습니다"
L["Can also be looting by fishing within the instance"] = "인스턴스 내에서 낚시로도 획득할 수 있습니다"
L["Requires completion of the achievement Relics of a Fallen Empire"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(17366)) or "Relics of a Fallen Empire").." 업적 달성이 필요합니다"
L["This is only collectable in the Classic version of Scholomance. If you do not have this instance unlocked, search for a guide online to do this first."] = "이것은 클래식 버전의 스칼로맨스에서만 수집할 수 있습니다. 이 인스턴스가 잠금 해제되어 있지 않다면 먼저 온라인에서 가이드를 찾아보세요."
L["Dropped by the hidden boss Endgineer Omegaplugg"] = "숨겨진 보스 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("최후의 기술자 오메가플러그").."에게서 획득"
L["It is highly recommended to attempt this encounter with a full party"] = "이 전투는 풀 파티로 시도하는 것을 강력히 권장합니다"
L["Can only be looted and used by a Demon Hunter"] = WrapTextInColor(ICH_GetClassName(12, "악마사냥꾼"), ICH_GetClassColor("DEMONHUNTER")).."만 획득하고 사용할 수 있습니다"
L["Drops from Don Carlos who patrols part of the path south of Tarren Mill"] = "타렌 밀 남쪽 길의 일부를 순찰하는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("돈 카를로스").."에게서 획득"
L["There are some reports of Don Carlos despawning after any bosses are killed, so proceed with caution"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("돈 카를로스").."가 일부 보스를 처치하면 사라진다는 보고가 있으니 주의하세요"
L["Drops from Gastropod mobs found between Megaera and Ji-Kun"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("메가이라").."와 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("지쿤").." 사이에 있는 복족류 몬스터에게서 획득"

--- Pet Notes ---
L["Also obtainable in a Follower dungeon"] = "추종자 던전에서도 획득 가능"
L["This item is obtainable even though it does not appear on the loot table for Goldie Baronbottom"] = "이 아이템은 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("골디 바론바텀").."의 전리품 목록에 표시되지 않지만 획득할 수 있습니다"
L["Instance entrance is at the very top of the tower where the waypoint is located"] = "인스턴스 입구는 경유지가 위치한 탑의 가장 꼭대기에 있습니다"
L["Dropped by Deviate Guardians and Deviate Ravagers throughout the dungeon"] = "던전 전체에 있는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("돌연변이 우두머리랩터").."와 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("돌연변이 약탈자랩터").."에게서 획득"
L["Dropped by the Rare Elite Gol'than the Malodorous"] = "희귀 정예 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("악취가 나는 골탄").."에게서 획득"
L["Guides for how to spawn this mob can be found online"] = "이 몬스터를 스폰하는 방법에 대한 가이드는 온라인에서 찾을 수 있습니다"
L["Dropped by Defias Pirates on the boat towards the end of the dungeon"] = "던전 후반부 배에 있는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("데피아즈단 해적").."에게서 획득"
L["Dropped by The Lanticore, which has a random chance to spawn after killing Orebender Gor'ashan"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("란티코어").."에게서 획득. "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("금속술사 고라샨").." 처치 후 무작위 확률로 등장합니다"
L["Access to the raid entrance requires completing the quest ETERNAL_PALACE_QUEST"] = "공격대 입구에 접근하려면 |A:QuestNormal:15:15|a"..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(ICH_GetQuestName(select(1, UnitFactionGroup("player")) == "Horde" and 55799 or 56325) or select(1, UnitFactionGroup("player")) == "Horde" and "조류의 전환" or "전환점").." 퀘스트를 완료해야 합니다"
L["Dropped by Sand Elementals in Normal and Heroic, but can be looted from Council of Elders in LFR"] = "일반 및 영웅 난이도에서 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("모래 정령").."에게서 획득하거나, LFR에서 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("장로회").."에게서 획득 가능"
L["Obtained by using an Amani Hex Stick on Forest Frogs"] = (select(2, C_Item.GetItemInfo(33865)) or GREEN_FONT_COLOR:WrapTextInColorCode("[Amani Hex Stick]")).."을(를) "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("숲 개구리").."에게 사용하여 획득"
L["Detailed guides for how to obtain this pet can be found online"] = "이 동반자를 획득하는 방법에 대한 자세한 가이드는 온라인에서 찾을 수 있습니다"
L["This item is obtainable even though it does not appear on the loot table for Dragons of Nightmare"] = "이 아이템은 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("악몽의 용").."의 전리품 목록에 표시되지 않지만 획득할 수 있습니다"
L["This pet takes 3 days to hatch after looting Viable Cobra Egg"] = (select(2, C_Item.GetItemInfo(160832)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Viable Cobra Egg]")).."을(를) 획득한 후 이 동반자는 부화하는 데 3일이 걸립니다"
L["This item is obtainable even though it does not appear on the loot table for Sire Denathrius"] = "이 아이템은 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("대영주 데나트리우스").."의 전리품 목록에 표시되지 않지만 획득할 수 있습니다"

--- Instance Difficulties ---
L["LFR"] = "공격대 찾기"
L["Normal"] = "일반"
L["Heroic"] = "영웅"
L["Mythic"] = "신화"
L["10 player"] = "10인"
L["10 Player (Heroic)"] = "10인 (영웅)"
L["25 player"] = "25인"
L["25 Player (Heroic)"] = "25인 (영웅)"
L["40 player"] = "40인"
L["Unknown"] = "알 수 없음"

--- Chat Messages ---
L["Dungeon Difficulty is already set to"] = "던전 난이도가 이미 다음으로 설정되어 있습니다:"
L["Legacy Raid Difficulty is already set to"] = "공격대 찾기 난이도가 이미 다음으로 설정되어 있습니다:"
L["Raid Difficulty is already set to"] = "공격대 난이도가 이미 다음으로 설정되어 있습니다:"
L["Current Instance Difficulties"] = "현재 인스턴스 난이도"
L["Dungeon Difficulty:"] = "던전 난이도:"
L["Legacy Raid Difficulty:"] = "고대 공격대 난이도:"
L["Raid Difficulty:"] = "공격대 난이도:"
L["Invalid dungeon difficulty provided."] = "잘못된 던전 난이도입니다."
L["Invalid legacy raid difficulty provided."] = "잘못된 고대 공격대 난이도입니다."
L["Invalid raid difficulty provided."] = "잘못된 공격대 난이도입니다."
L["Accepted values:"] = "허용 값:"
L["Show/hide the minimap icon"] = "미니맵 아이콘 표시/숨기기"
L["Updated available mount list"] = "사용 가능한 탈것 목록 업데이트됨" -- Currently unused
L["Map pin set for"] = "지도 핀 설정:"
L["Unable to set map pin for"] = "지도 핀을 설정할 수 없습니다:"
L["TomTom waypoint set for"] = "TomTom 경유지 설정:"
L["Unable to set TomTom waypoint for"] = "TomTom 경유지를 설정할 수 없습니다:"

--- Slash Commands ---
L["Display all current instance difficulties"] = "현재 모든 인스턴스 난이도 표시"
L["Set dungeon difficulty."] = "던전 난이도 설정."
L["Set legacy raid difficulty."] = "고대 공격대 난이도 설정."
L["Set raid difficulty."] = "공격대 난이도 설정."

--- Icon Tooltip ---
L["Track available mounts, toys, and pets from instances and easily set required instance difficulty"] = "인스턴스에서 수집 가능한 탈것, 장난감, 동반자를 추적하고 필요한 인스턴스 난이도를 쉽게 설정하세요"
L["Type \"/ich help\" in the chat window for available slash commands"] = "\"/ich help\"를 대화창에 입력하면 사용 가능한 슬래시 명령어를 확인할 수 있습니다"

-- Special Search Terms --
L["dungeon"] = "던전"
L["raid"] = "공격대"

--- UI ---
L["Search by mount/instance name, instance type, difficulty, or expansion"] = "탈것/인스턴스 이름, 인스턴스 유형, 난이도 또는 확장팩으로 검색"
L["Search by toy/instance name, instance type, difficulty, or expansion"] = "장난감/인스턴스 이름, 인스턴스 유형, 난이도 또는 확장팩으로 검색"
L["Search by pet/instance name, instance type, difficulty, or expansion"] = "동반자/인스턴스 이름, 인스턴스 유형, 난이도 또는 확장팩으로 검색"
L["Scale"] = "크기"
L["Use TomTom waypoints"] = "TomTom 경유지 사용"
L["Show Owned"] = "보유 항목 표시"
L["How To Use:"] = "사용 방법:"
L["Find the collectible you want to collect in the list and click the button for the difficulty you want to run on"] = "목록에서 수집하려는 수집품을 찾아 실행할 난이도의 버튼을 클릭하세요"
L["to make sure it is updated."] = "업데이트되었는지 확인하세요."
L["When you are locked out on a particular difficulty, the button for that difficulty will be disabled."] = "특정 난이도에서 잠겨 있으면 해당 난이도의 버튼이 비활성화됩니다."
L["A button will also be disabled for legacy raids completed on another difficulty since those lockouts"] = "다른 난이도에서 완료한 고대 공격대의 버튼도 비활성화됩니다. 해당 잠금은"
L["are shared across difficulties."] = "난이도 간에 공유됩니다."
L["Search Hints:"] = "검색 힌트:"
L["raid will show all collectibles that can be collected from a raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"공격대\"").."은(는) 공격대에서 수집 가능한 모든 수집품 표시"
L["10 will show all collectibles that can be collected from a legacy 10 player raid (Normal or Heroic)"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"10\"").."은(는) 고대 10인 공격대(일반 또는 영웅)에서 수집 가능한 모든 수집품 표시"
L["fel will show all collectibles and instances that contain fel in the name"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"fel\"").."은(는) 이름에 \"fel\"이 포함된 모든 수집품 및 인스턴스 표시"
L["mythic will show all collectibles that can be obtained from a Mythic dungeon or raid"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"신화\"").."은(는) 신화 던전 또는 공격대에서 획득 가능한 모든 수집품 표시"
L["lfr will show all collectibles that can be obtained from Raid Finder (LFR) difficulty raids"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"lfr\"").."은(는) 공격대 찾기(LFR) 난이도 공격대에서 획득 가능한 모든 수집품 표시"
L["wotlk or wrath will show all collectibles that can be obtained from Wrath of the Lich King instances"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wotlk\"").." 또는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("\"wrath\"").."은(는) 리치 왕의 분노 인스턴스에서 획득 가능한 모든 수집품 표시"
L["Name"] = "이름"
L["Instance"] = "인스턴스"
L["Available Difficulty(s)"] = "이용 가능한 난이도"
L["Shares lockout with:"] = "잠금 공유:"
L["View in encounter journal"] = "전투 일지에서 보기"
L["This button is only intended for tracking a Raid Finder (LFR) lockout. Raid difficulty has not been changed."] = "이 버튼은 공격대 찾기(LFR) 잠금을 추적하기 위한 것입니다. 공격대 난이도는 변경되지 않았습니다."
L["Waypoint tracking on the minimap may not always appear until you are in a specific zone."] = "미니맵의 경유지 추적은 특정 지역에 있을 때만 나타날 수 있습니다."
L["For example, an arrow pointing towards Throne of Thunder will only appear when you are on the Isle of Thunder"] = "예를 들어, "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("천둥의 왕좌").."를 향한 화살표는 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("천둥의 섬").."에 있을 때만 나타납니다"
L["Set map pin"] = "지도 핀 설정"
L["Set TomTom waypoint"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("TomTom").." 경유지 설정"
L["Coming soon"] = "곧 출시"

--- About ---
L["About the AddOn"] = "AddOn 정보"
L["Created by Pranavius"] = "제작: Pranavius"
L["Translations:"] = "번역:"
L["Open ICH"] = "ICH 열기"
L["Close"] = "닫기"

--- Timewalking Vendor ---
L["Type"] = "유형"
L["Expansion"] = "확장팩"
L["Cost"] = "비용"
L["Random chance to obtain when opening a Bag of Fishing Treasures"] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("낚아 올린 보물 가방").."을 열 때 무작위 확률로 획득 가능"
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways. Can now be purchased from any Timewalking vendor."] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(19079)) or "Master of the Turbulent Timeways").." 업적을 달성하면 원래 보상으로 받을 수 있었습니다. 현재는 모든 시간여행 판매자에게서 구매할 수 있습니다."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways II. Can now be purchased from any Timewalking vendor."] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41056)) or "Master of the Turbulent Timeways II").." 업적을 달성하면 원래 보상으로 받을 수 있었습니다. 현재는 모든 시간여행 판매자에게서 구매할 수 있습니다."
L["Originally rewarded for completing the achievement Master of the Turbulent Timeways III. Can now be purchased from any Timewalking vendor."] = DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(41779)) or "Master of the Turbulent Timeways III").." 업적을 달성하면 원래 보상으로 받을 수 있었습니다. 현재는 모든 시간여행 판매자에게서 구매할 수 있습니다."
L["Special Thanks"] = "특별 감사"
L["Mount"] = "탈것"
L["Pet"] = "동반자"
L["Toy"] = "장난감"
L["Timewalking Vendor"] = "시간여행 판매자"
L["Unable to transfer Timewarped Badges to this character right now."] = "현재 이 캐릭터에게 "..ICH_GetCurrencyName(1166, "Timewarped Badges").."을(를) 전송할 수 없습니다."
L["Unable to open the currency transfer menu. Please open it manually or try again."] = "화폐 전송 메뉴를 열 수 없습니다. 직접 열거나 다시 시도하세요."
L["Click to open currency transfer menu"] = "클릭하여 화폐 전송 메뉴 열기"
L["Cannot transfer to this character"] = "이 캐릭터에게 전송 불가"

--- Legion Remix ---
L["Legion: Remix Vendor"] = "군단: 리믹스 판매자"
L["Obtainable for free by reaching level 80 with a Death Knight Timerunner and earning the achievement Timerunner: Death Knight"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(6, "죽음의 기사"), ICH_GetClassColor("DEATHKNIGHT")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(6, "죽음의 기사"), ICH_GetClassColor("DEATHKNIGHT")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42685)) or "Timerunner: Death Knight")
L["Obtainable for free by reaching level 80 with a Demon Hunter Timerunner and earning the achievement Timerunner: Demon Hunter"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(12, "악마사냥꾼"), ICH_GetClassColor("DEMONHUNTER")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(12, "악마사냥꾼"), ICH_GetClassColor("DEMONHUNTER")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61087)) or "Timerunner: Demon Hunter")
L["Obtainable for free by reaching level 80 with a Druid Timerunner and earning the achievement Timerunner: Druid"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(11, "드루이드"), ICH_GetClassColor("DRUID")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(11, "드루이드"), ICH_GetClassColor("DRUID")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61086)) or "Timerunner: Druid")
L["Obtainable for free by reaching level 80 with a Hunter Timerunner and earning the achievement Timerunner: Hunter"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(3, "사냥꾼"), ICH_GetClassColor("HUNTER")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(3, "사냥꾼"), ICH_GetClassColor("HUNTER")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42687)) or "Timerunner: Hunter")
L["Obtainable for free by reaching level 80 with a Mage Timerunner and earning the achievement Timerunner: Mage"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(8, "마법사"), ICH_GetClassColor("MAGE")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(8, "마법사"), ICH_GetClassColor("MAGE")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61089)) or "Timerunner: Mage")
L["Obtainable for free by reaching level 80 with a Monk Timerunner and earning the achievement Timerunner: Monk"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(10, "수도사"), ICH_GetClassColor("MONK")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(10, "수도사"), ICH_GetClassColor("MONK")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61085)) or "Timerunner: Monk")
L["Obtainable for free by reaching level 80 with a Paladin Timerunner and earning the achievement Timerunner: Paladin"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(2, "성기사"), ICH_GetClassColor("PALADIN")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(2, "성기사"), ICH_GetClassColor("PALADIN")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42504)) or "Timerunner: Paladin")
L["Obtainable for free by reaching level 80 with a Priest Timerunner and earning the achievement Timerunner: Priest"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(5, "사제"), ICH_GetClassColor("PRIEST")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(5, "사제"), ICH_GetClassColor("PRIEST")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61088)) or "Timerunner: Priest")
L["Obtainable for free by reaching level 80 with a Rogue Timerunner and earning the achievement Timerunner: Rogue"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(4, "도적"), ICH_GetClassColor("ROGUE")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(4, "도적"), ICH_GetClassColor("ROGUE")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61084)) or "Timerunner: Rogue")
L["Obtainable for free by reaching level 80 with a Shaman Timerunner and earning the achievement Timerunner: Shaman"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(7, "주술사"), ICH_GetClassColor("SHAMAN")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(7, "주술사"), ICH_GetClassColor("SHAMAN")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42686)) or "Timerunner: Shaman")
L["Obtainable for free by reaching level 80 with a Warlock Timerunner and earning the achievement Timerunner: Warlock"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(9, "흑마법사"), ICH_GetClassColor("WARLOCK")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(9, "흑마법사"), ICH_GetClassColor("WARLOCK")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61090)) or "Timerunner: Warlock")
L["Obtainable for free by reaching level 80 with a Warrior Timerunner and earning the achievement Timerunner: Warrior"] = "레벨 80의 "..WrapTextInColor(ICH_GetClassName(1, "전사"), ICH_GetClassColor("WARRIOR")).." 타임러너로 타임러너: "..WrapTextInColor(ICH_GetClassName(1, "전사"), ICH_GetClassColor("WARRIOR")).." 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42684)) or "Timerunner: Warrior")
L["This pet is a reward from a quest chain started by the item Strange Humming Crystal, which is purchasable from the vendor."] = "이 동반자는 판매자에게서 구매할 수 있는 아이템 "..WHITE_FONT_COLOR:WrapTextInColorCode(select(2, C_Item.GetItemInfo(141349)) or "[Strange Humming Crystal]").."으로 시작하는 퀘스트 체인의 보상입니다."
L["Marked as event exclusive due to it only having been obtaininable during the Legion Pre-Patch event"] = "군단 사전 패치 이벤트 기간에만 획득 가능했으므로 이벤트 한정으로 표시됩니다."
L["Available In"] = "획득 가능:"
L["Event Exclusive"] = "이벤트 한정"
L["Phase 1: Skies of Fire"] = "Phase 1: Skies of Fire"
L["Phase 2: Rise of the Nightfallen"] = "Phase 2: Rise of the Nightfallen"
L["Phase 3: Legionfall"] = "Phase 3: Legionfall"
L["Phase 4: Argus Eternal"] = "Phase 4: Argus Eternal"
L["Phase 5: Infinite Echoes"] = "Phase 5: Infinite Echoes"
L["Search by collectible name/type or expansion"] = "수집품 이름/유형 또는 확장팩으로 검색"
L["Unable to transfer Bronze to this character right now."] = "현재 이 캐릭터에게 "..ICH_GetCurrencyName(3252, "Bronze").."을(를) 전송할 수 없습니다."
L["Obtained through the quest chain started by Torn Invitation, which is purchasable from the vendor."] = "판매자에게서 구매할 수 있는 "..(select(2, C_Item.GetItemInfo(140495)) or RARE_BLUE_COLOR:WrapTextInColorCode("[Torn Invitation]")).."으로 시작하는 퀘스트 체인을 통해 획득합니다."
L["This is considerably easier to obtain in Legion: Remix as items needed for the quest chain are given to you upon purchasing this item."] = "이 아이템을 구매하면 퀘스트 체인에 필요한 아이템이 제공되므로 군단: 리믹스에서 훨씬 더 쉽게 획득할 수 있습니다."

--- Decor ---
L["Decor"] = "장식"
L["Obtainable for free by earning the achievement Broken Isles World Quests V"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42674)) or "Broken Isles World Quests V")
L["Obtainable for free by earning the achievement Legion Remix Raids"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42321)) or "Legion Remix Raids")
L["Obtainable for free by earning the achievement The Armies of Legionfall"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42655)) or "The Armies of Legionfall")
L["Obtainable for free by earning the achievement Argussian Reach"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42627)) or "Argussian Reach")
L["Obtainable for free by earning the achievement Timeworn Keystone Master"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42689)) or "Timeworn Keystone Master")
L["Obtainable for free by earning the achievement Highmountain Tribe"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42547)) or "Highmountain Tribe")
L["Obtainable for free by earning the achievement Defending the Broken Isles III"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42675)) or "Defending the Broken Isles III")
L["Obtainable for free by earning the achievement The Nightfallen"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42628)) or "The Nightfallen")
L["Obtainable for free by earning the achievement Dreamweavers"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42619)) or "Dreamweavers")
L["Obtainable for free by earning the achievement Power of the Obelisks II"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61060)) or "Power of the Obelisks II")
L["Obtainable for free by earning the achievement Broken Isles Dungeoneer"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42692)) or "Broken Isles Dungeoneer")
L["Obtainable for free by earning the achievement Heroic Broken Isles World Quests III"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61054)) or "Heroic Broken Isles World Quests III")
L["Obtainable for free by earning the achievement The Wardens"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(61218)) or "The Wardens")
L["Obtainable for free by earning the achievement Court of Farondis"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42318)) or "Court of Farondis")
L["Obtainable for free by earning the achievement Valarjar"] = "다음 업적을 달성하면 무료로 획득 가능: "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode(select(2, GetAchievementInfo(42658)) or "Valarjar")
L["Upon entering the instance, dungeon difficulty will automatically be set to Normal"] = "인스턴스에 입장하면 던전 난이도가 자동으로 일반으로 설정됩니다."
L["Dropped by Vanessa VanCleef on Heroic difficulty"] = "영웅 난이도의 "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("바네사 밴클리프").."에게서 획득"
