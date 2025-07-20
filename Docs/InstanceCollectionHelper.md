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

# ICH


```lua
table
```


```lua
InstanceCollectionHelper
```


---

# ICHBlizzWaypoint

## instanceID


```lua
number
```

ID number for instance


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


---

# ICHNote

## notes


```lua
string?
```

The note(s) to display when hovering over the texture in `ICHNote`


---

# ICH_LANG


```lua
unknown
```


---

# InstanceCollectionHelper

## Container


```lua
unknown
```

## CreateFooter


```lua
(method) InstanceCollectionHelper:CreateFooter()
```

Initializes the footer in the AddOn that contains some display options for the window

## CreateMainFrame


```lua
(method) InstanceCollectionHelper:CreateMainFrame()
```

Initializes the AddOn window.<br/>
Internally creates a scrollable list of data to display initially as well.

## CreateScrollingView


```lua
(method) InstanceCollectionHelper:CreateScrollingView()
```

Initializes the scrollable list of data to display in the AddOn.<br/>
Currently only displays mount information.

## DataProviderInit


```lua
function InstanceCollectionHelper.DataProviderInit(frame: ICHListItem, data: InstanceMount)
```

Initializes how data in the scrollable list should be displayed
See:
  * [ICHListItem](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Modules/DataProvider.lua#44#10)
  * [InstanceMount](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Constants.lua#33#10)

## DatabaseDefaults


```lua
table
```

## DungeonDifficulty


```lua
enum DungeonDifficulty
```

## FilterListContentsByQuery


```lua
(method) InstanceCollectionHelper:FilterListContentsByQuery(listData: InstanceMount[])
  -> InstanceMount[]
```

Filters a list of data based on search parameters

## GetDifficultyButtonText


```lua
(method) InstanceCollectionHelper:GetDifficultyButtonText(difficultyID: number)
  -> text: string
```

@*param* `difficultyID` — ID associated with an instance difficulty

@*return* `text` — The text to be shown on the button that sets the desired instance difficulty

## GetInstanceDifficultyText


```lua
(method) InstanceCollectionHelper:GetInstanceDifficultyText(difficultyID?: number)
  -> text: string
```

Returns the difficulty text that corresponds to the given `difficultyID`

@*param* `difficultyID` — ID associated with an instance difficulty. Marked optional due to `GetLegacyRaidDifficultyID()` return a `number?` value, but required for this function.

@*return* `text` — The text to be shown when referencing the desired instance difficulty

## HandleSlashCommand


```lua
function InstanceCollectionHelper.HandleSlashCommand(cmd: string, input: string)
```

Handles slash commands in a way that overrides the default behavior of Ace3 slash commands. Executing the command with no arguments
opens the AddOn options window, providing the `help` argument displays a list of available arguments and uses for the slash command,
and all other arguments are handled using Ace3's default behavior.

@*param* `cmd` — The slash command used (should be exactly `/ich`)

@*param* `input` — The argument provided to the slash command

## ICHDataProvider


```lua
unknown
```

## Icon


```lua
unknown
```

## InstanceMounts


```lua
InstanceMount[]
```

List of mounts available from instances

## IsInstanceRaid


```lua
(method) InstanceCollectionHelper:IsInstanceRaid(data: InstanceMount)
  -> boolean
```

@*return* — `true` if the instance is a raid, `false` otherwise

See: [InstanceMount](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Constants.lua#33#10)

## OnInitialize


```lua
(method) InstanceCollectionHelper:OnInitialize()
```

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

Sets instance difficulty based on the provided value (Usable for all instance types)<br/>
*Provides a consistent experience when changing difficulties either from the UI or chat command.*

@*param* `difficultyID` — ID associated with an instance difficulty

## SlashOptions


```lua
table
```

## UpdateListContents


```lua
(method) InstanceCollectionHelper:UpdateListContents(event: string)
```

Update the contents of the list shown in the UI

@*param* `event` — The event that triggered the list update

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


---

# InstanceMount

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

## Instance


```lua
string
```

Instance from which the mount can be obtained (for information only, displayed name is in user's locale)

## InstanceID


```lua
number
```

ID number for the instance

## MapID


```lua
number
```

ID number for the map of the instance

## MountID


```lua
number
```

ID number for the mount

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

## SharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>?
```

Provides associations for difficulties that share a lockout with the listed `DifficultyID`

## Waypoint


```lua
Waypoint?
```

Supplemental information to place a map pin on the entrance to the instance when a POI is not available (ex. Stratholme - Service Entrance)


---

# LuaLS


---

# NameContainer

## Text


```lua
FontString
```

Name of a collectible

## ViewButton


```lua
Button
```

Button to view the collectible in the appropriate collection journal in-game


---

# OtherInfoContainer

## ICHBlizzWaypoint


```lua
ICHBlizzWaypoint
```

## ICHNote


```lua
ICHNote
```


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
