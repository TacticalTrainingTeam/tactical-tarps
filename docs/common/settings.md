# Settings

## `tt_common_addArsenalCategory`

- Type: `CHECKBOX`
- Default: `true`
- Scope: mission profile setting (`isGlobal = false` in registration)
- Purpose: Adds a Tactical Tarps button/category in ACE Arsenal that groups tarp items.

## Behavior

When enabled during preInit, `common` collects weapon classes from:

- `tt_medic`
- `tt_drone`
- `tt_signal`
- `tt_hazmat`

It then registers an ACE Arsenal right panel button named `Tarps`.

## Complete example

``` cpp
// cba_settings.sqf example
force tt_common_addArsenalCategory = false; // default: true
```

## Image

![Image of the ACE Arsenal showing the new Tab on the right side that includes all items of this mod.](https://images.steamusercontent.com/ugc/12395444052461539974/E530E0CAD17B0DA4A8C3271850BDE280DFACF33E/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false)
