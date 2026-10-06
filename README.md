# HP Bar Datapack

## Language
- [한국어](./README.ko.md)
- [English](./README.md)

A Minecraft datapack that displays a health bar above mobs.

## Features

- Real-time display of a mob's current and maximum health
- Foreground health bar automatically adjusts based on health percentage
- Yellow absorption bar appears when absorption is present
- Text display for current health and absorption points
- Health bar is automatically removed when health reaches 0 or when detached from the target

## How to Use

1. Place the datapack folder into your world's `datapacks` folder.
2. Run `/reload` in your world.
3. Add the `hp_bar_owner` tag to the mob you want to display a health bar for.

`` `mcfunction
/tag <target> add hp_bar_owner
`` `

Example:

`` `mcfunction
/tag @e[type=zombie,limit=1,sort=nearest] add hp_bar_owner
`` `

The health bar will spawn above the tagged mob and automatically update as its health changes.

## Internal Data

The following data is used internally by the datapack to calculate and update health bars. To prevent conflicts, do not modify or remove these values using other commands or datapacks.

### Scoreboard

All scoreboard objectives starting with `hp_bar_` are for internal use only:

- `hp_bar_old_max_hp`, `hp_bar_abs`, `hp_bar_old_max_abs`, `hp_bar_max_abs`
- `hp_bar_temp`, `hp_bar_old_abs`
- `hp_bar_max_hp`, `hp_bar_hp`, `hp_bar_kill`, `hp_bar_old_hp`

`#abs`, `#max_abs`, `#hp`, `#max_hp`, and `#sum_abs` are fake players used to store intermediate calculation values.

### Storage

The `hp_bar:data` storage is used internally to pass values to macro functions. Do not manually modify the following keys:

- `Scale`, `TransX`: Current health bar size and position
- `AbsScale`, `AbsTransX`: Absorption bar size and position
- `TextTotalHP`, `TextMaxHP`, `TextAbs`: Health text display values

### Tag

- `hp_bar_owner`: The only user-facing tag used to specify targets for health bar display.
- `hp_bar`, `hp_bar_back`, `hp_bar_front`, `hp_bar_abs`, `hp_bar_text`, `hp_bar_ride`, `hp_bar_test`: Tags used internally for health bar entities and state management. Do not manually add or remove these tags.

## Requirements

- Minecraft Java Edition 26.3+ (requires the `/compute` command)
