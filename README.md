# InstanceCollectionHelper

_Track available mounts from instances and easily set required instance difficulty_

**Important:** I am looking for translators to help bring this AddOn to those who may not understand English. If interested, please contact me via one of the means listed in the [Contact](#contact) section.

## Highlights
- Search for a mount by its name, an instance name or type, as well as a difficulty setting
- Multi-column scrollable UI with Name, Instance, and Available Difficulty columns
- Links to in-game mount journal as well as instance and encounter journal for each list item
- Ability to drop a map pin or **TomTom** waypoint at the dungeon or raid entrance to make navigating to each instance easier
- Simple buttons to set your desired instance difficulty with a single click
- DataBroker integration for quick access to options via minimap icon or other DataBroker AddOns

## Summary
**InstanceCollectionHelper** is designed to help collectors easily identify and set an appropriate instance difficulty when pursuing a mount from a dungeon or raid. Available mounts can be further filtered by mount name, instance name, instance type (dungeon or raid), as well as instance difficulty. When a mount cannot be obtained on a given difficulty, the button for that difficlty will be disabled. This effectively provides a simple and clean "to-do" list in the AddOn UI so you can decide to attempt to get the mount on another difficulty or pivot to hunting for a new one.

Although this AddOn currently only supports mount collection, there are plans to add other collectibles such as Battle Pets in the future. If you see that any mounts are missing from this list, please let me know and I'll be happy to add them ASAP.

### Supported Languages
All mount and instance names will appear in the language that the game is being played in, but other text may appear in English. Currently, the following languages are either supported or in the process of being localized:
- English (`enUS`)
- Spanish (`esMX`)
- Portuguese (`ptBR`)
- German (`deDE`) _\*credit: Fargoran\*_
- Chinese (`zhTW`) _\*credit: BNS333\*_

## Usage
Aside from the AddOn UI itself, **InstanceCollectionHelper** provides a few other utilities via slash commands. A comprehensive list of available commands is shown below:

- `/ich`: Opens the AddOn window
- `/ich help`: List all available slash commands for the AddOn
- `/ich diffs`: Print current difficulty settings for Dungeons, Legacy Raids, and Raids in the chat window
- `/ich dung <difficulty>`: Set Dungeon difficulty to the specified value
- `/ich raid <difficulty>`: Set Raid difficulty to the specified value
- `/ich lraid <difficulty>`: Set Legacy Raid difficulty to the specified value
- `/ich minimap`: Show or hide the minimap icon for the AddOn

### Notes
- For both `/ich dung` and `/ich raid`, `<difficulty>` can be one of `norm` (Normal), `hero` (Heroic), or `myth` (Mythic)
- For `/ich lraid`, `<difficulty>` can be one of `10` (10 player), `25` (25 player), `10h` (10 player (Heroic)), or `25h` (25 player (Heroic))

## Planned Updates
**InstanceCollectionHelper** was released in July 2025 to help players with tracking mounts and setting the correct instance difficulty for the [Collector's Bounty](https://www.wowhead.com/event=1674/collectors-bounty) event. After the event ends and the AddOn continues to exist, there are a number of features and improvements in line to be added:

- Track Battle Pets and Achievements available from instances
- Ability to view lockouts/available attempts of alts
- Allow AddOn properties such as text font to be configurable

## Contact
**Twitter/X**: [PranaviusWoW](https://x.com/pranaviuswow)

**GitHub**: [Pranavius](https://github.com/pranavius)

**Email**: [pranavius1@gmail.com](mailto:pranavius1@gmail.com)