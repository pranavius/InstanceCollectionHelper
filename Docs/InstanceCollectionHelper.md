# DifficultyButton

## difficultyID


```lua
number
```

ID number for instance, scenario, and raid difficulty (see https://wago.tools/db2/Difficulty)


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

## sharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>?
```

Difficulties that share a lockout with a difficulty displayed using the appropriate button


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

# ICH


```lua
table
```


```lua
InstanceCollectionHelper
```


---

# ICHListItem

## Bg


```lua
Texture
```

The background texture for unowned list items

## DifficultyContainer


```lua
DifficultyContainer
```

## InstanceContainer


```lua
InstanceContainer
```

## NameContainer


```lua
NameContainer
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

# ICHNote

## notes


```lua
string?
```

The note(s) to display when hovering over the texture in `ICHNote`


---

# ICHWaypointButton

## InstanceID


```lua
number
```

ID number for the instance where the collectible can be obtained


---

# ICH_AVAIL_DIFFS_COL_TITLE


```lua
unknown
```


---

# ICH_INSTANCE_COL_TITLE


```lua
unknown
```


---

# ICH_LANG


```lua
unknown
```


---

# ICH_NAME_COL_TITLE


```lua
unknown
```


---

# InstanceCollectionHelper

## About


```lua
unknown
```

## AppendMapSearchTags


```lua
function InstanceCollectionHelper.AppendMapSearchTags(data: Mount|Pet|Toy)
```

Append a list of map search tags for a collectibleto the existing `SearchTags` list based on the ID of the instance where it is obtained
See:
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## ConfigureWaypointButton


```lua
(method) InstanceCollectionHelper:ConfigureWaypointButton(localizedInstanceName: string, frame: ICHListItem, data: Mount|Pet|Toy)
```

Sets up and displays the appropriate waypoint button based on user preferences and **TomTom** being enabled or not

@*param* `localizedInstanceName` — The localized name of the instance to set a waypoint for

See:
  * [ICHListItem](InstanceCollectionHelper/Modules/MountDataProvider.lua#49#10)
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## Container


```lua
unknown
```

## CreateAboutFrame


```lua
(method) InstanceCollectionHelper:CreateAboutFrame()
```

Initializes the About frame that displays contact info and translation credit for the AddOn

## CreateFooter


```lua
(method) InstanceCollectionHelper:CreateFooter()
```

Initializes the footer in the AddOn that contains some display options for the window

## CreateMainFrame


```lua
(method) InstanceCollectionHelper:CreateMainFrame()
```

Initializes the AddOn window.<br>
Internally creates a scrollable list of data to display initially as well.

## CreateScrollingView


```lua
(method) InstanceCollectionHelper:CreateScrollingView()
```

Initializes the scrollable list of data to display in the AddOn<br>
By default, the list of mounts is shown

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
(method) InstanceCollectionHelper:FilterListContentsByQuery(listData: (Mount|Pet|Toy)[])
  -> (Mount|Pet|Toy)[]
```

Filters a list of data based on search parameters

## Footer


```lua
unknown
```

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

@*param* `cmd` — The slash command used (should be exactly `/ich`)

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
See: [DifficultyContainer](InstanceCollectionHelper/Modules/MountDataProvider.lua#21#10)

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
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## IsEncounterCompletedOnSharedDifficulty


```lua
(method) InstanceCollectionHelper:IsEncounterCompletedOnSharedDifficulty(data: Mount|Pet|Toy)
  -> boolean
```

@*return* — `true` if an encounter has been completed for the current reset period on a difficulty that shares a lockout with a mount's displayed difficulty, `false` otherwise

See:
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## IsInstanceRaid


```lua
(method) InstanceCollectionHelper:IsInstanceRaid(data: Mount|Pet|Toy)
  -> boolean
```

@*return* — `true` if the instance is a raid, `false` otherwise

See:
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## Mounts


```lua
Mount[]
```

List of mounts available from instances

## OnInitialize


```lua
(method) InstanceCollectionHelper:OnInitialize()
```

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

## RaidDifficulty


```lua
enum RaidDifficulty
```

## ScrollBar


```lua
unknown
```

## ScrollBox


```lua
unknown
```

## ScrollView


```lua
unknown
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
  * [DifficultyContainer](InstanceCollectionHelper/Modules/MountDataProvider.lua#21#10)
  * [Mount](InstanceCollectionHelper/Data/Mounts.lua#9#10)
  * [Toy](InstanceCollectionHelper/Data/Toys.lua#9#10)
  * [Pet](InstanceCollectionHelper/Data/Pets.lua#9#10)

## SlashOptions


```lua
table
```

## Tabs


```lua
unknown
```

## Toys


```lua
Toy[]
```

List of toys available from instances

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

# LuaLS


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

## name


```lua
string
```

The full name of the collectible


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

## ICHWaypointButton


```lua
ICHWaypointButton
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

## ItemID


```lua
number
```

ID number for item that adds the pet to the collection

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
string
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
