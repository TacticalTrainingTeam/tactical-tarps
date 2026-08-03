# Settings

## `tt_hazmat_buildTime`

- Type: `SLIDER`
- Range: `2` to `60`
- Default: `6`
- Purpose: deploy/deconstruct duration.

## `tt_hazmat_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle build animation usage.

## `tt_hazmat_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class while interacting.

## Complete example

``` cpp
// cba_settings.sqf example
force tt_hazmat_buildTime = 14; // default: 6
force tt_hazmat_useAnimation = true; // default: true
force tt_hazmat_buildAnimation = "AinvPknlMstpSnonWnonDnon_medicUp1"; // default: Acts_carFixingWheel
```
