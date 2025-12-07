---A table containing entries for each WoW expansion.<br>
---Each table entry consists of a list of strings associated with that expansion to use when searching for a collectible by expansion
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
---@field mapID number Identifier for the map on which to place the pin
---@field x number X coordinate of the location on the map
---@field y number Y coordinate of the location on the map

---@class Mount
---@field Name string Name of the mount (for information only, displayed name is in user's locale)
---@field ID number ID number for the mount
---@field Instance string Instance from which the mount can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance where the mount can be obtained
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance.
---@field EncounterID? number ID number for the encounter from which the mount is obtainable
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the mount can be obtained in
---@field SharedDifficulties? table<RaidDifficulty, RaidDifficulty> Provides associations for difficulties that share a lockout with the listed `DifficultyID`
---@field Notes? string Additional notes about the mount or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a mount. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@class Toy
---@field Name string Name of the toy (for information only, displayed name is in user's locale)
---@field ItemID number ID number for item that adds the toy to the collection
---@field Instance string Instance from which the toy can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance where the toy can be obtained
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance
---@field EncounterID? number ID number for the encounter from which the toy is available
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the toy can be obtained in
---@field Notes? string Additional notes about the toy or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a toy. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@class Pet
---@field Name string Name of the pet (for information only, displayed name is in user's locale)
---@field PetItemID number ID number for item that adds the pet to the collection
---@field Instance string Instance from which the pet can be obtained (for information only, displayed name is in user's locale)
---@field InstanceID number ID number for the instance where the pet can be obtained
---@field MapID number ID number for the map of the instance
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance
---@field EncounterID? number ID number for the encounter from which the pet is available
---@field DifficultyIDs (DungeonDifficulty|RaidDifficulty)[] List of IDs for instance difficulty(s) the pet can be obtained in
---@field Notes? string Additional notes about the pet or instance
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a pet. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@class TimewalkingItem
---@field Name string Name of the collectible (for information only, displayed name is in user's locale)
---@field ItemID number ID number for item that adds the collectible to the collection
---@field Type "Mount"|"Pet"|"Toy" The type of collectible that the item provides (one of "Mount", "Pet", "Toy")
---@field VendorName? string Name of the vendor that sells this collectible (for information only, displayed name is in user's locale)
---@field Expansion string Expansion for which the timewalking vendor that the collectible can be purchased from will be available
---@field Cost number Number of Timewarped badges required to purchase the item
---@field AreaPoiID? number ID number for the Point of Interest (POI) marker showing the vendor location on the map. Used to place Blizzard map pins for navigation guidance
---@field Notes? string Additional notes about the collectible
---@field Waypoint? Waypoint Supplemental information to place a map pin on the entrance to the instance when a POI is not available. Also used for TomTom waypoint integration.
---@field SearchTags string[] A list of string identifiers to quickly search for a collectible. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

---@class WowRemixResource
---@field ItemID number
---@field Amount number

---@class WowRemixItem
---@field Name string
---@field ItemID number
---@field Type "Mount"|"Pet"|"Toy"|"Cosmetic"|"Decor"
---@field Instance? string
---@field InstanceID? number
---@field EncounterID? number
---@field VendorName string
---@field Cost number
---@field Phase? LemixPhase
---@field AdditionalResource? WowRemixResource
---@field AreaPoiID? number
---@field Notes? string
---@field SearchTags string[]
---@field IsLemixExclusive boolean

---@class DecorItem
---@field Name string
---@field DecorItemID number
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

---@class ToyCacheData
---@field itemName string Localized name for the item that adds the toy to the collection
---@field itemID number ID for the item that adds the toy to the collection
---@field toyName string Localized toy name
---@field iconID number ID for the icon associated with the toy

---@class PetCacheData
---@field itemName string Localized name for the item that adds the pet to the collection
---@field itemID number ID for the item that adds the pet to the collection
---@field petName string Localized pet name
---@field iconID number ID for the icon associated with the pet
---@field speciesID number ID for the pet species

---@class TimewalkingCacheData
---@field itemName string Localized name for the item that adds the collectible to the collection
---@field itemID number ID number for the item that adds the collectible to the collection
---@field collectibleName string Localized collectible name
---@field iconID number ID for the icon associated with the collectible
---@field mountID? number ID number for the mount (applies to mounts only)
---@field speciesID? number ID for the pet species (applies to pets only)

---@class LemixCacheData
---@field itemName string Localized name for the item that adds the collectible to the collection
---@field itemID number ID number for the item that adds the collectible to the collection
---@field collectibleName string Localized collectible name
---@field iconID number ID for the icon associated with the collectible
---@field mountID? number ID number for the mount (applies to mounts only)
---@field speciesID? number ID for the pet species (applies to pets only)

---@class LemixResourceCacheData
---@field itemName string
---@field itemID number
---@field iconID number

---@class ICHSquareButton : Button
---@field action string Describes the funcitonality associated with the button

---@class DifficultyButton: Button
---@field difficultyID number ID number for instance, scenario, and raid difficulty (see https://wago.tools/db2/Difficulty)
---@field sharedDifficulties table<RaidDifficulty, RaidDifficulty> Difficulties that share a lockout with the associated `difficultyID`
---@field ButtonTint Texture A texture applied over the button to recolor it based on instance type
---@field TintMask MaskTexture A texture mask applied over `ButtonTint` to prevent the color from bleeding past the boundaries of the button art

---@class ICHListHeaders : Frame
---@field BorderBottom Texture A separator between the list headers and the list items in the AddOn interface
---@field NameHeader FontString
---@field InstanceHeader? FontString Exclusive to `ICHListItemTemplate`
---@field DiffHeader? FontString Exclusive to `ICHListItemTemplate`
---@field TypeHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field ExpansionHeader? FontString Exclusive to `ICHVendorListItemTemplate`
---@field CostHeader? FontString Exclusive to `ICHVendorListItemTemplate`

---@class NameContainer: Frame
---@field ViewButton Button Button to view the collectible in the appropriate collection journal in-game
---@field Text FontString Name of a collectible (can be truncated if length exceeds allocated space)

---@class InstanceContainer: Frame
---@field encounterID? number ID number for the encounter that provides the collectible
---@field hasDungeonJournalEntry boolean Whether a dungeon journal entry exists for this instance or not (Classic only)
---@field Text FontString Name of an instance
---@field ViewButton Button Button to view the instance in the encounter journal in-game

---@class TextContainer: Frame
---@field Text FontString The text to be displayed

---@class CostContainer: Frame
---@field currencyID number ID number of the currency required to purchase the collectible
---@field Text FontString Text to display alongside the currency icon (typically the cost of the collectible)
---@field CurrencyButton Button If currency is Warband Transferable, this button should open the transfer menu

---@class DifficultyContainer: Frame
---@field RaidDiffLFRButton DifficultyButton Button for tracking LFR lockout (no action taken when clicked)
---@field RaidDiffLegacyLFRButton DifficultyButton Button for tracking legacy LFR lockout (no action taken when clicked)
---@field RaidDiff40Button DifficultyButton Button for setting Legacy Raid difficulty to 40 player
---@field RaidDiff10Button DifficultyButton Button for setting Legacy Raid difficulty to 10 player
---@field RaidDiff10HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 10 player (Heroic)
---@field RaidDiff25Button DifficultyButton Button for setting Legacy Raid difficulty to 25 player
---@field RaidDiff25HeroicButton DifficultyButton Button for setting Legacy Raid difficulty to 25 player (Heroic)
---@field RaidDiffNormalButton DifficultyButton Button for setting Raid difficulty to Normal
---@field RaidDiffHeroicButton DifficultyButton Button for setting Raid difficulty to Heroic
---@field RaidDiffMythicButton DifficultyButton Button for setting Raid difficulty to Mythic
---@field DungDiffNormalButton DifficultyButton Button for setting Dungeon difficulty to Normal
---@field DungDiffHeroicButton DifficultyButton Button for setting Dungeon difficulty to Heroic
---@field DungDiffMythicButton DifficultyButton Button for setting Dungeon difficulty to Mythic

---@class ICHNote: Frame
---@field notes string The note(s) to display when hovering over the texture in `ICHNote`

---@class ICHWaypointButton: Button
---@field instanceID? number ID number for the instance where the collectible can be obtained
---@field vendorName? string Name of the vendor from whom the collectible can be purcahsed (for vendor items only)

---@class OtherInfoContainer: Frame
---@field ICHPetCount FontString Displays the total number of a pet owned against the maximum number that can be owned (for pets only)
---@field ICHNote ICHNote
---@field ICHWaypointButton ICHWaypointButton

---@class ICHListItem: Frame
---@field isMount boolean Whether or not the list item is for a mount
---@field relevantID number The ID number for the collectible. For mounts, this value is `mountID` and for all other collectibles it is `itemID`
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field InstanceContainer? InstanceContainer Exclusive to `ICHListItemTemplate`
---@field DifficultyContainer? DifficultyContainer Exclusive to `ICHListItemTemplate`
---@field TypeContainer? TextContainer Exclusive to `ICHVendorListItemTemplate`
---@field ExpansionContainer? TextContainer Exclusive to `ICHVendorListItemTemplate`
---@field CostContainer? CostContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see InstanceContainer 
---@see DifficultyContainer
---@see TextContainer
---@see CostContainer
---@see OtherInfoContainer

---@class LemixCostContainer : CostContainer
---@field resourceItemID number

---@class PhaseContainer : Frame
---@field fullName string
---@field Text FontString

---@class ExclusiveContainer: Frame
---@field Checkmark Texture

---@class ICHLemixListHeaders : Frame
---@field BorderBottom Texture A separator between the list headers and the list items in the AddOn interface
---@field NameHeader FontString
---@field TypeHeader FontString
---@field PhaseHeader FontString
---@field ExclusiveHeader FontString
---@field CostHeader FontString

---@class ICHLemixListItem : Frame
---@field isMount boolean Whether or not the list item is for a mount
---@field relevantID number The ID number for the collectible. For mounts, this value is `mountID` and for everything else it is `itemID`
---@field Bg Texture The background texture for unowned list items
---@field OwnedBg Texture The background texture for owned list items
---@field NameContainer NameContainer
---@field TypeContainer TextContainer
---@field PhaseContainer PhaseContainer
---@field ExclusiveContainer ExclusiveContainer
---@field CostContainer LemixCostContainer
---@field OtherInfoContainer OtherInfoContainer
---@see NameContainer
---@see TextContainer
---@see LemixCostContainer
---@see OtherInfoContainer

---@class ICHMain : Frame
---@field Title FontString The name of the AddOn
---@field SearchBox EditBox An input field that allows users to search for a collectible in the currently viewed list
---@field InfoButton ICHSquareButton
---@field ListHeaders ICHListHeaders
---@field VendorListHeaders ICHListHeaders
---@field LemixListHeaders ICHLemixListHeaders
---@see ICHSquareButton
---@see ICHListHeaders

---@class MinimalSliderWithSteppers
---@field Slider Slider A Slider bar to quickly change a value within the range of the defined minimum and maximum values
---@field Back Button Decrease value by the specified increment
---@field Forward Button Increase value by the specified increment

---@class ScaleContainer: Frame
---@field Text FontString
---@field WindowScale MinimalSliderWithSteppers
---@see MinimalSliderWithSteppers

---@class Checkbox: CheckButton
---@field Text FontString The text to display alongside the `CheckButton`

---@class OwnedContainer: Frame
---@field Checkbox Checkbox
---@see Checkbox

---@class TomTomContainer: Frame
---@field Checkbox Checkbox
---@see Checkbox

---@class ICHFooter
---@field Bg Texture The background texture for the footer
---@field ScaleContainer ScaleContainer
---@field OwnedContainer OwnedContainer
---@field TomTomContainer TomTomContainer
---@see ScaleContainer
---@see OwnedContainer
---@see TomTomContainer

---@class ICHAbout: Frame
---@field Bg Texture The background texture for the frame
---@field Name FontString AddOn name
---@field Author FontString AddOn author
---@field Twitter FontString AddOn author's Twitter/X handle
---@field GitHub FontString AddOn author's GitHub username
---@field SpecialThanksHeader FontString Heading for list of people to give a special thanks to for their contributions to the AddOn
---@field Translators FontString Heading for list of people to thank for providing translations into other languages for the AddOn
---@field OpenICH Button Closes the About information and re-opens the AddOn
---@field Close Button Closes the About information

---@class Translator An individual who has contributed to the localization of ICH in another language/locale besides English (_enUS_)
---@field name string The name of the translator
---@field locale "enUS"|"enGB"|"enAU"|"esES"|"esMX"|"ptBR"|"ptPT"|"frFR"|"deDE"|"itIT"|"ruRU"|"koKR"|"zhTW"|"zhCN" The locale for which they provided translations