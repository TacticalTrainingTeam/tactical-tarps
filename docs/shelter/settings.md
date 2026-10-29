# Settings

## `tt_shelter_buildTime`

- Type: `SLIDER`
- Range: `2` to `120`
- Default: `20`
- Purpose: deploy/deconstruct duration.

## `tt_shelter_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle build animation usage.

## `tt_shelter_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class while interacting.

## Complete example

``` cpp
// cba_settings.sqf example
force tt_shelter_buildTime = 30; // default: 20
force tt_shelter_useAnimation = false; // default: true
force tt_shelter_buildAnimation = "AinvPknlMstpSnonWnonDnon_medicUp1"; // default: Acts_carFixingWheel
```
