# Instance Collection Helper

_Track available collectibles from instances and easily set required instance difficulty_

[![Discord](https://img.shields.io/badge/join-5865F2?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/rqXW2cenWg)
[![Patreon](https://img.shields.io/badge/support-F96854?style=for-the-badge&logo=patreon)](https://patreon.com/cw/Pranavius)

**Instance Collection Helper** was released in July 2025 to help players with tracking mounts and setting the correct instance difficulty for the [Collector's Bounty](https://www.wowhead.com/event=1674/collectors-bounty) event. Since then, it has evolved further into a list and tracking system for other collectibles such as toys, pets, and decor.

ICH will be continue to be supported in the **Midnight** expansion and beyond for the foreseeable future. I am looking for translators to help verify AddOn translations in non-English languages. If interested, please contact me via one of the means listed in the [Connect](#connect) section.

## Highlights
- Tabs for mounts, toys, pets, and decor that are available from instances
- Search for a collectible by its name, an instance name or type, a difficulty setting, by expansion, or by the zone or parent zone it can be found in
- Easily keep track of all available collectibles offered by Timewalking vendors along with their costs
- Multi-column scrollable UI with Name, Instance, and Available Difficulty columns
- Links to in-game mount journal (mounts only) as well as instance and encounter journal for each item in the list
- Ability to drop a map pin at the instance entrance to make navigating easier
  - If the **TomTom** AddOn is enabled, an option to use **TomTom** waypoints instead of Blizzard map pins is available
- Buttons to easily set your desired instance difficulty with a single click
- DataBroker integration for quick access to options via minimap button or other DataBroker AddOns
- AddOn Compartment integration to easily open the AddOn when the minimap button is hidden

## Summary
**Instance Collection Helper** is designed to help collectors easily identify and set an appropriate instance difficulty when pursuing a collectible from a dungeon or raid. Available items can be further filtered by name, instance name, instance type (dungeon or raid), instance difficulty, or zone name. When a collectible cannot be obtained on a given difficulty, the button for that difficulty will be disabled. This effectively provides a simple and clean "to-do" list in the AddOn UI so you can decide to attempt to get the item on another difficulty or pivot to hunting for a new one.

Currently, this AddOn supports mount, toy, pet, and decor collections with plans to add other collectibles like Achievements in the future. If you see that any items are missing from this list, please let me know and I'll be happy to add them ASAP.

### Supported Languages
All collectible and instance names will appear in the language that the game is being played in, but other text may appear in English. Currently, the following languages are either supported or in the process of being localized:
- English (`enUS`)
- European Spanish (`esES`) 
- Mexican Spanish (`esMX`)
- French (`frFR`)
- Koran (`koKR`)
- Italian (`itIT`)
- Brazilian Portuguese (`ptBR`)
- Russian (`ruRU`)
- German (`deDE`) _\*credit: Fargoran\*_
- Traditional Chinese (`zhTW`) _\*credit: BNS333\*_
- Simplified Chinese (`zhCN`) _\*credit: 柳心怡\*_

## Usage
Aside from the AddOn UI itself, **Instance Collection Helper** provides a few other utilities via slash commands. A comprehensive list of available commands is shown below:

- `/ich`: Opens the AddOn window
- `/ich help`: List all available slash commands for the AddOn
- `/ich diffs`: Print current difficulty settings for Dungeons, Legacy Raids, and Raids in the chat window
- `/ich dung <difficulty>`: Set Dungeon difficulty to the specified value
- `/ich raid <difficulty>`: Set Raid difficulty to the specified value
- `/ich lraid <difficulty>`: Set Legacy Raid difficulty to the specified value
- `/ich minimap`: Show or hide the minimap icon for the AddOn
- `/ich about`: Opens a window showing information about the addon, authors and contributors, etc.

### Notes
- For both `/ich dung` and `/ich raid`, `<difficulty>` can be one of `norm` (Normal), `hero` (Heroic), or `myth` (Mythic)
- For `/ich lraid`, `<difficulty>` can be one of `10` (10 player), `25` (25 player), `10h` (10 player (Heroic)), `25h` (25 player (Heroic)), or `40` (40 player)

## Planned Updates
- Track Achievements available in instances
- Ability to view lockouts/available attempts of alts
- Allow AddOn properties such as text font to be configurable

## Connect
Feedback on this AddOn or any others that I develop/maintain is always welcome. If you enjoy using any of my AddOns and would like to support future development, it is greatly appreciated.

[![GitHub](https://img.shields.io/badge/github-000000?style=for-the-badge&logo=github)](https://github.com/pranavius)
[![X](https://img.shields.io/badge/@PranaviusWoW-000000?style=for-the-badge&logo=x)](https://x.com/PranaviusWoW)
[![Email](https://img.shields.io/badge/email-ffffff?style=for-the-badge&logo=gmail)](mailto:pranavius1@gmail.com)
