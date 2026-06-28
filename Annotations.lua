---@class ExpansionTags
---@field Classic string[]
---@field TheBurningCrusade string[]
---@field WrathOfTheLichKing string[]
---@field Cataclysm string[]
---@field MistsOfPandaria string[]
---@field WarlordsOfDraenor string[]
---@field Legion string[]
---@field BattleForAzeroth string[]
---@field Shadowlands string[]
---@field Dragonflight string[]
---@field TheWarWithin string[]
---@field Midnight string[]

---@class Waypoint
---@field mapID number
---@field x number
---@field y number

---@class InstanceItemBase
---@field Name string
---@field Instance string
---@field InstanceID number
---@field MapID number
---@field AreaPoiID? number
---@field EncounterID? number
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[]
---@field SharedDifficulties? table<RaidDifficulty, RaidDifficulty>
---@field Notes? string
---@field Waypoint? Waypoint
---@field SearchTags string[]

---@class VendorItemBase
---@field Name string
---@field ItemID number
---@field Type "Mount"|"Pet"|"Toy"|"Cosmetic"|"Decor"
---@field VendorName? string
---@field Cost number
---@field AreaPoiID? number
---@field Notes? string
---@field SearchTags string[]

---@class Mount: InstanceItemBase
---@field ID number

---@class Toy: InstanceItemBase
---@field ItemID number

---@class Pet: InstanceItemBase
---@field PetItemID number

---@class TimewalkingItem: VendorItemBase
---@field Expansion string
---@field Waypoint? Waypoint

---@class WowRemixResource
---@field ItemID number
---@field Amount number

---@class WowRemixItem: VendorItemBase
---@field Instance? string
---@field InstanceID? number
---@field EncounterID? number
---@field Phase? string
---@field AdditionalResource? WowRemixResource
---@field IsLemixExclusive boolean

---@class DecorItem: InstanceItemBase
---@field DecorItemID number

---@class CacheDataBase
---@field itemName string
---@field itemID number
---@field iconID number

---@class ToyCacheData: CacheDataBase
---@field toyName string

---@class PetCacheData: CacheDataBase
---@field petName string
---@field speciesID number

---@class TimewalkingCacheData: CacheDataBase
---@field collectibleName string
---@field mountID? number
---@field speciesID? number

---@class LemixCacheData: CacheDataBase
---@field collectibleName string
---@field mountID? number
---@field speciesID? number

---@class LemixResourceCacheData
---@field itemName string
---@field itemID number
---@field iconID number

---@class ICHSquareButton: Button
---@field action string

---@class DifficultyButton: Button
---@field difficultyID number
---@field sharedDifficulties table<RaidDifficulty, RaidDifficulty>
---@field ButtonTint Texture
---@field TintMask MaskTexture

---@class ICHListHeaders: Frame
---@field BorderBottom Texture
---@field NameHeader Button
---@field InstanceHeader? Button
---@field DiffHeader? FontString
---@field TypeHeader? Button
---@field ExpansionHeader? Button
---@field CostHeader? Button

---@class NameContainer: Frame
---@field ViewButton Button
---@field Text FontString

---@class InstanceContainer: Frame
---@field encounterID? number
---@field hasDungeonJournalEntry boolean
---@field Text FontString
---@field ViewButton Button

---@class TextContainer: Frame
---@field Text FontString

---@class CostContainer: Frame
---@field currencyID number
---@field Text FontString
---@field CurrencyButton Button

---@class DifficultyContainer: Frame
---@field RaidDiffLFRButton DifficultyButton
---@field RaidDiffLegacyLFRButton DifficultyButton
---@field RaidDiff40Button DifficultyButton
---@field RaidDiff10Button DifficultyButton
---@field RaidDiff10HeroicButton DifficultyButton
---@field RaidDiff25Button DifficultyButton
---@field RaidDiff25HeroicButton DifficultyButton
---@field RaidDiffNormalButton DifficultyButton
---@field RaidDiffHeroicButton DifficultyButton
---@field RaidDiffMythicButton DifficultyButton
---@field RaidDiffMythicFlexButton DifficultyButton
---@field DungDiffNormalButton DifficultyButton
---@field DungDiffHeroicButton DifficultyButton
---@field DungDiffMythicButton DifficultyButton

---@class ICHNote: Frame
---@field notes string

---@class ICHWaypointButton: Button
---@field instanceID? number
---@field vendorName? string

---@class OtherInfoContainer: Frame
---@field ICHPetCount FontString
---@field ICHNote ICHNote
---@field ICHWaypointButton ICHWaypointButton

---@class FavoriteContainer: Frame
---@field FavoriteButton Button

---@class ICHListItem: Frame
---@field isMount boolean
---@field relevantID number
---@field Bg Texture
---@field OwnedBg Texture
---@field NameContainer NameContainer
---@field InstanceContainer? InstanceContainer
---@field DifficultyContainer? DifficultyContainer
---@field TypeContainer? TextContainer
---@field ExpansionContainer? TextContainer
---@field CostContainer? CostContainer
---@field OtherInfoContainer OtherInfoContainer
---@field FavoriteContainer FavoriteContainer

---@class LemixCostContainer: CostContainer
---@field resourceItemID number

---@class PhaseContainer: Frame
---@field fullName string
---@field Text FontString

---@class ExclusiveContainer: Frame
---@field Checkmark Texture

---@class ICHLemixListHeaders: Frame
---@field BorderBottom Texture
---@field NameHeader FontString
---@field TypeHeader FontString
---@field PhaseHeader FontString
---@field ExclusiveHeader FontString
---@field CostHeader FontString

---@class InstanceListItemConfig
---@field isMount boolean
---@field getInfo fun(data: InstanceItemBase|VendorItemBase, cached: any)
---@field cache? CacheDataBase[]
---@field cacheKey? fun(data: InstanceItemBase|VendorItemBase)
---@field hasPetCount? boolean
---@field onNameClick? fun(frame: ICHListItem, data: InstanceItemBase|VendorItemBase, cached: any)
---@field afterRender? fun(frame: ICHListItem, data: InstanceItemBase|VendorItemBase, cached: any, isOwned: boolean)

---@class ICHLemixListItem: Frame
---@field isMount boolean
---@field relevantID number
---@field Bg Texture
---@field OwnedBg Texture
---@field NameContainer NameContainer
---@field TypeContainer TextContainer
---@field PhaseContainer PhaseContainer
---@field ExclusiveContainer ExclusiveContainer
---@field CostContainer LemixCostContainer
---@field OtherInfoContainer OtherInfoContainer
---@field FavoriteContainer FavoriteContainer

---@class ICHMain: Frame
---@field Title FontString
---@field SearchBox SearchBoxTemplate
---@field AboutButton ICHSquareButton
---@field SettingsButton ICHSquareButton
---@field ListHeaders ICHListHeaders
---@field VendorListHeaders ICHListHeaders
---@field LemixListHeaders ICHLemixListHeaders

---@class MinimalSliderWithSteppers
---@field Slider Slider
---@field Back Button
---@field Forward Button
---@field Init fun(initVal: number, minVal: number, maxVal: number, steps: number)

---@class ScaleContainer: Frame
---@field Text FontString
---@field WindowScale MinimalSliderWithSteppers

---@alias ICHTabSystem Frame & TabSystemTemplate

---@class Checkbox: CheckButton
---@field Text FontString

---@class OwnedContainer: Frame
---@field Checkbox Checkbox

---@class TomTomContainer: Frame
---@field Checkbox Checkbox

---@class ICHFooter
---@field Bg Texture
---@field ScaleContainer ScaleContainer
---@field OwnedContainer OwnedContainer
---@field TomTomContainer TomTomContainer

---@class ICHHelperItem
---@field MountID? number
---@field ItemID? number
---@field IconID number
---@field Hyperlink string
---@field EncounterID? number
---@field Notes? string
---@field CanBeLooted boolean

---@class ICHInstanceHelper: Frame
---@field InstanceName FontString
---@field ItemContainer Frame

---@class ICHAbout: Frame
---@field Bg Texture
---@field Name FontString
---@field Author FontString
---@field Twitter FontString
---@field GitHub FontString
---@field SpecialThanksHeader FontString
---@field Translators FontString
---@field OpenICH Button
---@field Close Button

---@class ICHSettings: Frame
---@field Bg Texture
---@field Title FontString
---@field FavoritesLabel FontString
---@field MinimapCheckbox CheckButton
---@field MiniWindowCheckbox CheckButton
---@field MiniWindowInMythicPlusCheckbox CheckButton
---@field PetOwnedCheckbox CheckButton
---@field Close Button

---@class Translator
---@field name string
---@field locale "enUS"|"enGB"|"enAU"|"esES"|"esMX"|"ptBR"|"ptPT"|"frFR"|"deDE"|"itIT"|"ruRU"|"koKR"|"zhTW"|"zhCN"

---@class SortState
---@field column "Name"|"Instance"|"Type"|"Expansion"|"Cost"
---@field direction "asc"|"desc"

---@class InstanceCollectionHelper: AceAddon, AceConsole-3.0, AceEvent-3.0
---@field db AceDBObject-3.0
---@field sortState? SortState
---@field Container ICHMain
---@field Title string
---@field ICHDataProvider DataProviderMixin
---@field ScrollView ScrollBoxListLinearViewMixin
---@field Tabs ICHTabSystem
---@field About ICHAbout
---@field Settings ICHSettings
---@field Footer ICHFooter

-------- WoW class annotation enhancements to stop LSP from flagging a bunch of things
---@class GameFontHighlightMedium
---@field SetText fun(text: string)

---@class GameFontHighlightSmall
---@field SetText fun(text: string)

---@class GameFontHighlightHuge
---@field SetText fun(text: string)

---@class EncounterJournalEncounterFrameInfo
---@field tab number

---@class Button
---@field Text FontString
