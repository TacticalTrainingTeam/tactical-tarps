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

![Image of the ACE Arsenal showing the new Tab on the right side that includes all items of this mod.](https://images.steamusercontent.com/ugc/11644517392562959346/F52807BD292EABD02DF82C6940D2274D5BBE9CD5/?imw=637&imh=358&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=true)
