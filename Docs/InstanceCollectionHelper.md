# CloseSpecialWindows


```lua
function CloseSpecialWindows()
  -> boolean
```


---

# ColorPickerFrame.cancelFunc


```lua
function ColorPickerFrame.cancelFunc()
```


---

# ColorPickerFrame.func


```lua
function ColorPickerFrame.func()
```


---

# ColorPickerFrame.hasOpacity


```lua
unknown
```


---

# ColorPickerFrame.opacity


```lua
integer
```


---

# ColorPickerFrame.opacityFunc


```lua
function ColorPickerFrame.opacityFunc()
```


---

# DifficultyButton

## difficultyID


```lua
number
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

Button for tracking LFR lockout (no action taken when clicked)


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

## OwnedBg


```lua
Texture
```

The background texture for owned list items


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

Initializes the footer in the AddOn

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

Initializes how data in the scrollable list should be displayed.

@*param* `frame` — See `Templates.xml` for "ICHListItemTemplate"

@*param* `data` — The data to process and display in a list item.

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

Returns the text to be shown on a difficulty button

## GetInstanceDifficultyText


```lua
(method) InstanceCollectionHelper:GetInstanceDifficultyText(difficultyID?: number)
  -> text: string
```

Returns the difficulty text that corresponds to the given `difficultyID`

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

## IsInstanceRaid


```lua
(method) InstanceCollectionHelper:IsInstanceRaid(data: InstanceMount)
  -> boolean
```

@*return* — `true` if the instance is a raid, `false` otherwise

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

## EncounterID


```lua
number?
```

## Instance


```lua
string
```

## InstanceID


```lua
number
```

## MapID


```lua
number
```

## MountID


```lua
number
```

## Name


```lua
string
```

## Notes


```lua
string?
```

Additional notes about this mount or instance

## SharedDifficulties


```lua
table<RaidDifficulty, RaidDifficulty>?
```


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