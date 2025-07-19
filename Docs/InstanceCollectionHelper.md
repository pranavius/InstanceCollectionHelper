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

# ICHListItem

## Bg


```lua
Texture
```

The background texture for unowned list item

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

## Notes


```lua
string?
```


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
  * [ICHListItem](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Modules/DataProvider.lua#39#10)
  * [InstanceMount](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Constants.lua#28#10)

## DatabaseDefaults


```lua
table
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

## IsInstanceRaid


```lua
(method) InstanceCollectionHelper:IsInstanceRaid(data: InstanceMount)
  -> boolean
```

@*return* — `true` if the instance is a raid, `false` otherwise

See: [InstanceMount](file:///Users/pranavchary/Documents/repos/InstanceCollectionHelper/Constants.lua#28#10)

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

## DifficultyIDs


```lua
(DungeonDifficulty|RaidDifficulty)[]
```

A list of IDs associated with the instance difficulty(s) the mount can be obtained in

## EncounterID


```lua
number?
```

The ID number associated with the encounter that needs to be completed to obtain the mount

## Instance


```lua
string
```

The instance from which the mount can be obtained

## InstanceID


```lua
number
```

The ID number for the associated instance

## MapID


```lua
number
```

The ID number of the map of the associated instance

## MountID


```lua
number
```

The ID number associated with the mount

## Name


```lua
string
```

The name of the mount

## Notes


```lua
string?
```

Additional notes about this mount or instance

## SharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>?
```

Provides associations for difficulties that are not listed in `DifficultyIDs` but share a lockout with the listed ID(s)


---

# LuaLS


---

# NameContainer

## Text


```lua
FontString
```

Name of an item

## ViewButton


```lua
Button
```

Button to view the item in the appropriate collection journal in-game


---

# OtherInfoContainer

## ICHNote


```lua
ICHNote
```
