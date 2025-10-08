# Checkbox

## Text


```lua
FontString
```

The text to display alongside the `CheckButton`


---

# CostContainer

## CurrencyButton


```lua
Button
```

If currency is Warband Transferable, this button should open the transfer menu

## Text


```lua
FontString
```

Text to display alongside the currency icon (typically the cost of the collectible)

## currencyID


```lua
integer
```

ID number of the currency required to purchase the collectible


---

# DifficultyButton

## ButtonTint


```lua
Texture
```

A texture applied over the button to recolor it based on instance type

## OnClick


```lua
(method) DifficultyButtonMixin:OnClick()
```

## OnEnter


```lua
(method) DifficultyButtonMixin:OnEnter()
```

## OnLeave


```lua
(method) DifficultyButtonMixin:OnLeave()
```

## TintMask


```lua
MaskTexture
```

A texture mask applied over `ButtonTint` to prevent the color from bleeding past the boundaries of the button art

## difficultyID


```lua
integer
```

ID number for instance, scenario, and raid difficulty (see https://wago.tools/db2/Difficulty)

## sharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>
```

Difficulties that share a lockout with the associated `difficultyID`


---

# DifficultyButtonMixin


```lua
table
```


---

# DifficultyButtonMixin.OnClick


```lua
(method) DifficultyButtonMixin:OnClick()
```


---

# DifficultyButtonMixin.OnEnter


```lua
(method) DifficultyButtonMixin:OnEnter()
```


---

# DifficultyButtonMixin.OnLeave


```lua
(method) DifficultyButtonMixin:OnLeave()
```


---

# DifficultyContainer

## DungDiffHeroicButton


```lua
DifficultyButton
```

Button for setting Dungeon difficulty to Heroic

## DungDiffMythicButton


```lua
DifficultyButton
```

Button for setting Dungeon difficulty to Mythic

## DungDiffNormalButton


```lua
DifficultyButton
```

Button for setting Dungeon difficulty to Normal

## RaidDiff10Button


```lua
DifficultyButton
```

Button for setting Legacy Raid difficulty to 10 player

## RaidDiff10HeroicButton


```lua
DifficultyButton
```

Button for setting Legacy Raid difficulty to 10 player (Heroic)

## RaidDiff25Button


```lua
DifficultyButton
```

Button for setting Legacy Raid difficulty to 25 player

## RaidDiff25HeroicButton


```lua
DifficultyButton
```

Button for setting Legacy Raid difficulty to 25 player (Heroic)

## RaidDiff40Button


```lua
DifficultyButton
```

Button for setting Legacy Raid difficulty to 40 player

## RaidDiffHeroicButton


```lua
DifficultyButton
```

Button for setting Raid difficulty to Heroic

## RaidDiffLFRButton


```lua
DifficultyButton
```

Button for tracking LFR lockout (no action taken when clicked)

## RaidDiffLegacyLFRButton


```lua
DifficultyButton
```

Button for tracking legacy LFR lockout (no action taken when clicked)

## RaidDiffMythicButton


```lua
DifficultyButton
```

Button for setting Raid difficulty to Mythic

## RaidDiffNormalButton


```lua
DifficultyButton
```

Button for setting Raid difficulty to Normal


---

# ExclusiveContainer

## Checkmark


```lua
Texture
```


---

# ExpansionTags

## BattleForAzeroth


```lua
string[]
```

## Cataclysm


```lua
string[]
```

## Classic


```lua
string[]
```

## Dragonflight


```lua
string[]
```

## Legion


```lua
string[]
```

## Midnight


```lua
string[]
```

## MistsOfPandaria


```lua
string[]
```

## Shadowlands


```lua
string[]
```

## TheBurningCrusade


```lua
string[]
```

## TheWarWithin


```lua
string[]
```

## WarlordsOfDraenor


```lua
string[]
```

## WrathOfTheLichKing


```lua
string[]
```


---

# ICHAbout

## Author


```lua
FontString
```

AddOn author

## Bg


```lua
Texture
```

The background texture for the frame

## Close


```lua
Button
```

Closes the About information

## GitHub


```lua
FontString
```

AddOn author's GitHub username

## Name


```lua
FontString
```

AddOn name

## OnLoad


```lua
(method) ICHAboutMixin:OnLoad()
```

## OpenICH


```lua
Button
```

Closes the About information and re-opens the AddOn

## SpecialThanksHeader


```lua
FontString
```

Heading for list of people to give a special thanks to for their contributions to the AddOn

## Translators


```lua
FontString
```

Heading for list of people to thank for providing translations into other languages for the AddOn

## Twitter


```lua
FontString
```

AddOn author's Twitter/X handle


---

# ICHAboutMixin


```lua
ICHAbout
```


---

# ICHAboutMixin.OnLoad


```lua
(method) ICHAboutMixin:OnLoad()
```


---

# ICHFooter

## Bg


```lua
Texture
```

The background texture for the footer

## OwnedContainer


```lua
OwnedContainer
```

## ScaleContainer


```lua
ScaleContainer
```

## TomTomContainer


```lua
TomTomContainer
```


---

# ICHFooterMixin


```lua
table
```


---

# ICHFooterMixin.OnLoad


```lua
(method) ICHFooterMixin:OnLoad()
```


---

# ICHLemixListHeaders

## BorderBottom


```lua
Texture
```

A separator between the list headers and the list items in the AddOn interface

## CostHeader


```lua
FontString
```

## ExclusiveHeader


```lua
FontString
```

## NameHeader


```lua
FontString
```

## OnLoad


```lua
(method) ICHLemixListHeadersMixin:OnLoad()
```

## PhaseHeader


```lua
FontString
```

## TypeHeader


```lua
FontString
```


---

# ICHLemixListHeadersMixin


```lua
ICHLemixListHeaders
```


---

# ICHLemixListHeadersMixin.OnLoad


```lua
(method) ICHLemixListHeadersMixin:OnLoad()
```


---

# ICHLemixListItem

## Bg


```lua
Texture
```

The background texture for unowned list items

## CostContainer


```lua
LemixCostContainer
```

---- ANNOTATIONS -------
------------------------

## ExclusiveContainer


```lua
ExclusiveContainer
```

## NameContainer


```lua
NameContainer
```

---- ANNOTATIONS -------
------------------------

## OnLoad


```lua
(method) ICHLemixListItemMixin:OnLoad()
```

## OtherInfoContainer


```lua
OtherInfoContainer
```

## OwnedBg


```lua
Texture
```

The background texture for owned list items

## PhaseContainer


```lua
PhaseContainer
```

## TypeContainer


```lua
TextContainer
```

## isMount


```lua
boolean
```

Whether or not the list item is for a mount

## relevantID


```lua
number
```

The ID number for the collectible. For mounts, this value is `mountID` and for everything else it is `itemID`


---

# ICHLemixListItemMixin


```lua
ICHLemixListItem
```


---

# ICHLemixListItemMixin.OnLoad


```lua
(method) ICHLemixListItemMixin:OnLoad()
```


---

# ICHListHeaders

## BorderBottom


```lua
Texture
```

A separator between the list headers and the list items in the AddOn interface

## CostHeader


```lua
FontString?
```

Exclusive to `ICHVendorListItemTemplate`

## DiffHeader


```lua
FontString?
```

Exclusive to `ICHListItemTemplate`

## ExpansionHeader


```lua
FontString?
```

Exclusive to `ICHVendorListItemTemplate`

## InstanceHeader


```lua
FontString?
```

Exclusive to `ICHListItemTemplate`

## NameHeader


```lua
FontString
```

## OnLoad


```lua
(method) ICHListHeadersMixin:OnLoad()
```

## TypeHeader


```lua
FontString?
```

Exclusive to `ICHVendorListItemTemplate`


---

# ICHListHeadersMixin


```lua
ICHListHeaders
```


---

# ICHListHeadersMixin.OnLoad


```lua
(method) ICHListHeadersMixin:OnLoad()
```


---

# ICHListItem

## Bg


```lua
Texture
```

The background texture for unowned list items

## CostContainer


```lua
CostContainer?
```

## DifficultyContainer


```lua
DifficultyContainer?
```

Exclusive to `ICHListItemTemplate`

## ExpansionContainer


```lua
TextContainer?
```

Exclusive to `ICHVendorListItemTemplate`

## InstanceContainer


```lua
InstanceContainer?
```

Exclusive to `ICHListItemTemplate`

## NameContainer


```lua
NameContainer
```

---- ANNOTATIONS -------
------------------------

## OnLoad


```lua
(method) ICHListItemMixin:OnLoad()
```

## OtherInfoContainer


```lua
OtherInfoContainer
```

## OwnedBg


```lua
Texture
```

The background texture for owned list items

## TypeContainer


```lua
TextContainer?
```

Exclusive to `ICHVendorListItemTemplate`

## isMount


```lua
boolean
```

Whether or not the list item is for a mount

## relevantID


```lua
number
```

The ID number for the collectible. For mounts, this value is `mountID` and for toys it is `itemID`


---

# ICHListItemMixin


```lua
ICHListItem
```


---

# ICHListItemMixin.OnLoad


```lua
(method) ICHListItemMixin:OnLoad()
```


---

# ICHMain

## InfoButton


```lua
ICHSquareButton
```

## LemixListHeaders


```lua
ICHLemixListHeaders
```

## ListHeaders


```lua
ICHListHeaders
```

## SearchBox


```lua
EditBox
```

An input field that allows users to search for a collectible in the currently viewed list

## Title


```lua
FontString
```

The name of the AddOn

## VendorListHeaders


```lua
ICHListHeaders
```


---

# ICHMainMixin


```lua
table
```


---

# ICHMainMixin.OnDragStart


```lua
(method) ICHMainMixin:OnDragStart()
```


---

# ICHMainMixin.OnDragStop


```lua
(method) ICHMainMixin:OnDragStop()
```


---

# ICHMainMixin.OnLoad


```lua
(method) ICHMainMixin:OnLoad()
```


---

# ICHMainMixin.OnShow


```lua
(method) ICHMainMixin:OnShow()
```


---

# ICHNote

## notes


```lua
string
```

The note(s) to display when hovering over the texture in `ICHNote`


---

# ICHScrollBox

## InitializeScrollView


```lua
(method) ICHScrollBoxMixin:InitializeScrollView()
```


---

# ICHScrollBoxMixin


```lua
unknown
```


---

# ICHScrollBoxMixin.InitializeScrollView


```lua
(method) ICHScrollBoxMixin:InitializeScrollView()
```


---

# ICHSquareButton

## OnEnter


```lua
(method) ICHSquareButtonMixin:OnEnter()
```

## OnLeave


```lua
(method) ICHSquareButtonMixin:OnLeave()
```

## action


```lua
string
```

Describes the funcitonality associated with the button


---

# ICHSquareButtonMixin


```lua
ICHSquareButton
```


---

# ICHSquareButtonMixin.OnEnter


```lua
(method) ICHSquareButtonMixin:OnEnter()
```


---

# ICHSquareButtonMixin.OnLeave


```lua
(method) ICHSquareButtonMixin:OnLeave()
```


---

# ICHWaypointButton

## instanceID


```lua
number?
```

ID number for the instance where the collectible can be obtained

## vendorName


```lua
string?
```

Name of the vendor from whom the collectible can be purcahsed (for vendor items only)


---

# ICH_AddonCompartmentOnClick


```lua
function ICH_AddonCompartmentOnClick()
```


---

# ICH_AddonCompartmentOnEnter


```lua
function ICH_AddonCompartmentOnEnter(_: any, btn: any)
```


---

# ICH_AddonCompartmentOnLeave


```lua
function ICH_AddonCompartmentOnLeave(_: any, btn: any)
```


---

# InstanceCollectionHelper

## AppendMapSearchTags


```lua
function InstanceCollectionHelper.AppendMapSearchTags(data: Mount|Pet|TimewalkingItem|Toy|WowRemixItem)
```

Append a list of map search tags for a collectibleto the existing `SearchTags` list based on the ID of the instance where it is obtained
See:
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)
  * [TimewalkingItem](AddOns/InstanceCollectionHelper/Data/Timewalking.lua#6#10)
  * [WowRemixItem](AddOns/InstanceCollectionHelper/Data/Lemix.lua#12#10)

## ConfigureOnInit


```lua
(method) InstanceCollectionHelper:ConfigureOnInit()
```

## ConfigureWaypointButton


```lua
(method) InstanceCollectionHelper:ConfigureWaypointButton(destinationName: string, frame: ICHLemixListItem|ICHListItem, data: Mount|Pet|TimewalkingItem|Toy|WowRemixItem)
```

Sets up and displays the appropriate waypoint button based on user preferences and **TomTom** being enabled or not

@*param* `destinationName` — The name of the destination to set a waypoint for, such as an NPC or an instance

See:
  * [ICHListItem](AddOns/InstanceCollectionHelper/Templates/ListItemMixin.lua#6#10)
  * [ICHLemixListItem](AddOns/InstanceCollectionHelper/Templates/LemixMixins.lua#15#10)
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)
  * [TimewalkingItem](AddOns/InstanceCollectionHelper/Data/Timewalking.lua#6#10)
  * [WowRemixItem](AddOns/InstanceCollectionHelper/Data/Lemix.lua#12#10)

## CreateLemixCache


```lua
(method) InstanceCollectionHelper:CreateLemixCache()
```

## CreatePetCache


```lua
(method) InstanceCollectionHelper:CreatePetCache()
```

## CreateTab


```lua
(method) InstanceCollectionHelper:CreateTab(tabName: string, enabled?: boolean)
```

Adds a tab to the existing tab system and creates a variable in the AddOn table for easy reference in the future

@*param* `tabName` — The text displayed on the newly created tab

@*param* `enabled` — Whether the tab should be enabled or not (tabs are enabled by default if no value is provided)

## CreateTabSystem


```lua
(method) InstanceCollectionHelper:CreateTabSystem()
```

Initializes the tab system for viewing different types of collectibles available in instances

## CreateTimewalkingCache


```lua
(method) InstanceCollectionHelper:CreateTimewalkingCache()
```

## CreateToyCache


```lua
(method) InstanceCollectionHelper:CreateToyCache()
```

## DatabaseDefaults


```lua
table
```

## DungeonDifficulty


```lua
enum DungeonDifficulty
```

## ExpansionTags


```lua
ExpansionTags
```

A table containing entries for each WoW expansion.<br>
Each table entry consists of a list of strings associated with that expansion to use when searching for a collectible by expansion

## FilterListContentsByQuery


```lua
(method) InstanceCollectionHelper:FilterListContentsByQuery(listData: (Mount|Pet|TimewalkingItem|Toy|WowRemixItem)[])
  -> (Mount|Pet|TimewalkingItem|Toy|WowRemixItem)[]
```

Filters a list of data based on search parameters
See:
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)
  * [TimewalkingItem](AddOns/InstanceCollectionHelper/Data/Timewalking.lua#6#10)
  * [WowRemixItem](AddOns/InstanceCollectionHelper/Data/Lemix.lua#12#10)

## GetDifficultyButtonText


```lua
(method) InstanceCollectionHelper:GetDifficultyButtonText(difficultyID: number)
  -> string
```

@*param* `difficultyID` — ID associated with an instance difficulty

@*return* — The text to be shown on the button that sets the desired instance difficulty

## GetInstanceDifficultyText


```lua
(method) InstanceCollectionHelper:GetInstanceDifficultyText(difficultyID?: number)
  -> string
```

Returns the difficulty text that corresponds to the given `difficultyID`

@*param* `difficultyID` — ID associated with an instance difficulty. Marked optional due to `GetLegacyRaidDifficultyID()` return a `number?` value, but required for this function.

@*return* — The text to be shown when referencing the desired instance difficulty

## HandleSlashCommand


```lua
function InstanceCollectionHelper.HandleSlashCommand(cmd: string, input: string)
```

Handles slash commands in a way that overrides the default behavior of Ace3 slash commands. Executing the command with no arguments
opens the AddOn options window, providing the `help` argument displays a list of available arguments and uses for the slash command,
and all other arguments are handled using Ace3's default behavior.

@*param* `cmd` — The slash command used (should be exactly `ich`)

@*param* `input` — The argument provided to the slash command

## HandleTabSelected


```lua
(method) InstanceCollectionHelper:HandleTabSelected(tabID: number)
```

Callback method that is fired when the active tab is changed

@*param* `tabID` — ID number for the new active tab

## HideAllDifficultyButtons


```lua
function InstanceCollectionHelper.HideAllDifficultyButtons(container: DifficultyContainer)
```

Unsets all difficulty button points and hides them before showing the correct ones based on provided data
See: [DifficultyContainer](AddOns/InstanceCollectionHelper/Templates/ListItemMixin.lua#141#10)

## ICHDataProvider


```lua
unknown
```

## Icon


```lua
unknown
```

## IsEncounterCompleted


```lua
function InstanceCollectionHelper.IsEncounterCompleted(data: Mount|Pet|Toy, difficultyID: any)
  -> boolean
```

@*return* — `true` if an instance encounter has been completed for the current reset period on a given difficulty, `false` otherwise

See:
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)

## IsEncounterCompletedOnSharedDifficulty


```lua
(method) InstanceCollectionHelper:IsEncounterCompletedOnSharedDifficulty(data: Mount|Pet|Toy)
  -> boolean
```

@*return* — `true` if an encounter has been completed for the current reset period on a difficulty that shares a lockout with a mount's displayed difficulty, `false` otherwise

See:
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)

## IsInstanceRaid


```lua
(method) InstanceCollectionHelper:IsInstanceRaid(data: Mount|Pet|Toy)
  -> boolean
```

@*return* — `true` if the instance is a raid, `false` otherwise

See:
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)

## LemixCache


```lua
{ [integer]: LemixCacheData }
```

Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets

## LemixDataProviderInit


```lua
function InstanceCollectionHelper.LemixDataProviderInit(frame: ICHLemixListItem, item: WowRemixItem)
```

## LemixItems


```lua
WowRemixItem[]
```

## LemixPhases


```lua
enum LemixPhase
```

## LemixResourceCache


```lua
{ [integer]: LemixResourceCacheData }
```

## Mounts


```lua
Mount[]
```

List of mounts available from instances

## OnInitialize


```lua
(method) InstanceCollectionHelper:OnInitialize()
```

## PetCache


```lua
{ [number]: PetCacheData }
```

Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets

## PetDataProviderInit


```lua
function InstanceCollectionHelper.PetDataProviderInit(frame: ICHListItem, pet: Pet)
```

Initializes how pet data in the scrollable list should be displayed
See:
  * [ICHListItem](AddOns/InstanceCollectionHelper/Templates/ListItemMixin.lua#6#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)

## Pets


```lua
Pet[]
```

List of pets available from instances

## PrintChatMessage


```lua
(method) InstanceCollectionHelper:PrintChatMessage(...any)
```

Prints a message to the chat window prefixed by the AddOn name

@*param* `...` — Arguments to be printed to the chat window

See: [print](file:///Users/pranavchary/.vscode/extensions/sumneko.lua-3.15.0-darwin-arm64/server/meta/Lua%205.4%20en-us%20utf8/basic.lua#235#9)

## PrintDebugMessage


```lua
(method) InstanceCollectionHelper:PrintDebugMessage(...any)
```

Prints a debugging message to the chat window prefixed by the AddOn name

@*param* `...` — Arguments to be printed as part of the debug message

## RaidDifficulty


```lua
enum RaidDifficulty
```

## SetInstanceDifficulty


```lua
(method) InstanceCollectionHelper:SetInstanceDifficulty(difficultyID: number)
```

Sets instance difficulty based on the provided value (Usable for all instance types)<br>
*Provides a consistent experience when changing difficulties either from the UI or chat command.*

@*param* `difficultyID` — ID associated with an instance difficulty

## SetTruncatedText


```lua
(method) InstanceCollectionHelper:SetTruncatedText(fs: FontString, text: string)
```

 Determines if text length exceeds defined width and truncates with ellipsis when this happens

@*param* `fs` — FontString containing the text

@*param* `text` — The text to check for truncation

## ShowDifficultyButtons


```lua
(method) InstanceCollectionHelper:ShowDifficultyButtons(container: DifficultyContainer, data: Mount|Pet|Toy, isOwned?: boolean)
```

Determines which difficulty button(s) to display based on the provided data

@*param* `isOwned` — Whether or not the collectible is owned by the player. Omitting this argument is equivalent to providing `false`

See:
  * [DifficultyContainer](AddOns/InstanceCollectionHelper/Templates/ListItemMixin.lua#141#10)
  * [Mount](AddOns/InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](AddOns/InstanceCollectionHelper/Data/Pets.lua#9#10)

## SlashOptions


```lua
table
```

## Tabs


```lua
unknown
```

## TimewalkingCache


```lua
{ [number]: TimewalkingCacheData }
```

Stores necessary pet data in a local cache - attempting to reduce the amount of stutter/freezing when viewing pets

## TimewalkingDataProviderInit


```lua
function InstanceCollectionHelper.TimewalkingDataProviderInit(frame: ICHListItem, item: TimewalkingItem)
```

## TimewalkingItems


```lua
TimewalkingItem[]
```

## Title


```lua
string
```

## ToyCache


```lua
{ [number]: ToyCacheData }
```

Stores necessary toy data in a local cache - attempting to reduce the amount of stutter/freezing when viewing toys

## ToyDataProviderInit


```lua
function InstanceCollectionHelper.ToyDataProviderInit(frame: ICHListItem, toy: Toy)
```

Initializes how toy data in the scrollable list should be displayed
See:
  * [ICHListItem](AddOns/InstanceCollectionHelper/Templates/ListItemMixin.lua#6#10)
  * [Toy](AddOns/InstanceCollectionHelper/Data/Toys.lua#9#10)

## UpdateListContents


```lua
(method) InstanceCollectionHelper:UpdateListContents()
```

Update the contents of the list shown in the UI

## db


```lua
unknown
```

 Load database


---

# InstanceContainer

## Text


```lua
FontString
```

Name of an instance

## ViewButton


```lua
Button
```

Button to view the instance in the encounter journal in-game

## encounterID


```lua
number?
```

ID number for the encounter that provides the collectible


---

# LemixCacheData

## collectibleName


```lua
string
```

Localized collectible name

## iconID


```lua
integer
```

ID for the icon associated with the collectible

## itemID


```lua
integer
```

ID number for the item that adds the collectible to the collection

## itemName


```lua
string
```

Localized name for the item that adds the collectible to the collection

## limit


```lua
integer?
```

Maximum number of the pet that can be owned (applies to pets only)

## mountID


```lua
integer?
```

ID number for the mount (applies to mounts only)

## owned


```lua
boolean|integer
```

If the collectible is a pet, this is the number of the pet currently owned. For other collectibles, this is `true` if owned and `false` otherwise

## speciesID


```lua
integer?
```

ID for the pet species (applies to pets only)


---

# LemixCostContainer

## CurrencyButton


```lua
Button
```

If currency is Warband Transferable, this button should open the transfer menu

## Text


```lua
FontString
```

Text to display alongside the currency icon (typically the cost of the collectible)

## currencyID


```lua
integer
```

ID number of the currency required to purchase the collectible

## resourceItemID


```lua
integer
```


---

# LemixResourceCacheData

## iconID


```lua
integer
```

## itemID


```lua
integer
```

## itemName


```lua
string
```


---

# LuaLS


---

# MinimalSliderWithSteppers

## Back


```lua
Button
```

Decrease value by the specified increment

## Forward


```lua
Button
```

Increase value by the specified increment

## Slider


```lua
Slider
```

A Slider bar to quickly change a value within the range of the defined minimum and maximum values


---

# Mount

## AreaPoiID


```lua
number?
```

ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance.

## DifficultyIDs


```lua
(DungeonDifficulty|RaidDifficulty)[]
```

List of IDs for instance difficulty(s) the mount can be obtained in

## EncounterID


```lua
number?
```

ID number for the encounter from which the mount is obtainable

## ID


```lua
number
```

ID number for the mount

## Instance


```lua
string
```

Instance from which the mount can be obtained (for information only, displayed name is in user's locale)

## InstanceID


```lua
number
```

ID number for the instance where the mount can be obtained

## MapID


```lua
number
```

ID number for the map of the instance

## Name


```lua
string
```

Name of the mount (for information only, displayed name is in user's locale)

## Notes


```lua
string?
```

Additional notes about the mount or instance

## SearchTags


```lua
string[]
```

A list of string identifiers to quickly search for a mount. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

## SharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>?
```

Provides associations for difficulties that share a lockout with the listed `DifficultyID`

## Waypoint


```lua
Waypoint?
```

Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.


---

# NameContainer

## Text


```lua
FontString
```

Name of a collectible (can be truncated if length exceeds allocated space)

## ViewButton


```lua
Button
```

Button to view the collectible in the appropriate collection journal in-game


---

# OtherInfoContainer

## ICHNote


```lua
ICHNote
```

## ICHPetCount


```lua
FontString
```

Displays the total number of a pet owned against the maximum number that can be owned (for pets only)

## ICHWaypointButton


```lua
ICHWaypointButton
```


---

# OwnedContainer

## Checkbox


```lua
Checkbox
```


---

# Pet

## AreaPoiID


```lua
number?
```

ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance

## DifficultyIDs


```lua
(DungeonDifficulty|RaidDifficulty)[]
```

List of IDs for instance difficulty(s) the pet can be obtained in

## EncounterID


```lua
number?
```

ID number for the encounter from which the pet is available

## Instance


```lua
string
```

Instance from which the pet can be obtained (for information only, displayed name is in user's locale)

## InstanceID


```lua
number
```

ID number for the instance where the pet can be obtained

## MapID


```lua
number
```

ID number for the map of the instance

## Name


```lua
string
```

Name of the pet (for information only, displayed name is in user's locale)

## Notes


```lua
string?
```

Additional notes about the pet or instance

## PetItemID


```lua
number
```

ID number for item that adds the pet to the collection

## SearchTags


```lua
string[]
```

A list of string identifiers to quickly search for a pet. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

## Waypoint


```lua
Waypoint?
```

Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.


---

# PetCacheData

## iconID


```lua
integer
```

ID for the icon associated with the pet

## itemID


```lua
integer
```

ID for the item that adds the pet to the collection

## itemName


```lua
string
```

Localized name for the item that adds the pet to the collection

## limit


```lua
integer
```

Maximum number of the pet that can be owned

## owned


```lua
integer
```

Number of the pet currently owned

## petName


```lua
string
```

Localized pet name

## speciesID


```lua
integer
```

ID for the pet species


---

# PhaseContainer

## Text


```lua
FontString
```

## fullName


```lua
string
```


---

# ScaleContainer

## Text


```lua
FontString
```

## WindowScale


```lua
MinimalSliderWithSteppers
```

---- ANNOTATIONS -------
------------------------


---

# TextContainer

## Text


```lua
FontString
```

The text to be displayed


---

# TimewalkingCacheData

## collectibleName


```lua
string
```

Localized collectible name

## iconID


```lua
integer
```

ID for the icon associated with the collectible

## itemID


```lua
integer
```

ID number for the item that adds the collectible to the collection

## itemName


```lua
string
```

Localized name for the item that adds the collectible to the collection

## limit


```lua
integer?
```

Maximum number of the pet that can be owned (applies to pets only)

## mountID


```lua
integer?
```

ID number for the mount (applies to mounts only)

## owned


```lua
boolean|integer
```

If the collectible is a pet, this is the number of the pet currently owned. For other collectibles, this is `true` if owned and `false` otherwise

## speciesID


```lua
integer?
```

ID for the pet species (applies to pets only)


---

# TimewalkingItem

## AreaPoiID


```lua
number?
```

ID number for the Point of Interest (POI) marker showing the vendor location on the map. Used to place Blizzard map pins for navigation guidance

## Cost


```lua
number
```

Number of Timewarped badges required to purchase the item

## Expansion


```lua
string
```

Expansion for which the timewalking vendor that the collectible can be purchased from will be available

## ItemID


```lua
number
```

ID number for item that adds the collectible to the collection

## Name


```lua
string
```

Name of the collectible (for information only, displayed name is in user's locale)

## Notes


```lua
string?
```

Additional notes about the collectible

## SearchTags


```lua
string[]
```

A list of string identifiers to quickly search for a collectible. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

## Type


```lua
"Mount"|"Pet"|"Toy"
```

The type of collectible that the item provides (one of "Mount", "Pet", "Toy")

## VendorName


```lua
string?
```

Name of the vendor that sells this collectible (for information only, displayed name is in user's locale)

## Waypoint


```lua
Waypoint?
```

Supplemental information to place a map pin on the entrance to the instance when a POI is not available. Also used for TomTom waypoint integration.


---

# TomTomContainer

## Checkbox


```lua
Checkbox
```


---

# Toy

## AreaPoiID


```lua
number?
```

ID number for the Point of Interest (POI) marker showing the instance entrance on the map. Used to place Blizzard map pins for navigation guidance

## DifficultyIDs


```lua
(DungeonDifficulty|RaidDifficulty)[]
```

List of IDs for instance difficulty(s) the toy can be obtained in

## EncounterID


```lua
number?
```

ID number for the encounter from which the toy is available

## Instance


```lua
string
```

Instance from which the toy can be obtained (for information only, displayed name is in user's locale)

## InstanceID


```lua
number
```

ID number for the instance where the toy can be obtained

## ItemID


```lua
number
```

ID number for item that adds the toy to the collection

## MapID


```lua
number
```

ID number for the map of the instance

## Name


```lua
string
```

Name of the toy (for information only, displayed name is in user's locale)

## Notes


```lua
string?
```

Additional notes about the toy or instance

## SearchTags


```lua
string[]
```

A list of string identifiers to quickly search for a toy. This can include expansion abbreviations, expansion names, zones, continents, etc<br>This field is extended upon AddOn initialization to include zones and only includes expansions by default

## Waypoint


```lua
Waypoint?
```

Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance). Also used for TomTom waypoint integration.


---

# ToyCacheData

## iconID


```lua
integer
```

ID for the icon associated with the toy

## isOwned


```lua
boolean
```

`true` if the toy is owned, `false` otherwise

## itemID


```lua
integer
```

ID for the item that adds the toy to the collection

## itemName


```lua
string
```

Localized name for the item that adds the toy to the collection

## toyName


```lua
string
```

Localized toy name


---

# Translator

## locale


```lua
"deDE"|"enAU"|"enGB"|"enUS"|"esES"...(+9)
```

The locale for which they provided translations

## name


```lua
string
```

The name of the translator


---

# Waypoint

## mapID


```lua
number
```

Identifier for the map on which to place the pin

## x


```lua
number
```

X coordinate of the location on the map

## y


```lua
number
```

Y coordinate of the location on the map
