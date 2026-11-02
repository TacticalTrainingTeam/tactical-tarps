# Hazmat Addon

The `hazmat` addon registers a deployable hazmat bag/tarp flow on top of the shared `common` framework.

## What it adds

- Deployable hazmat empty bag item.
- Runtime `GroundWeaponHolder_Scripted` for dropped item handling.
- Return-item swap to a full hazmat bag when contaminated items were processed.

### Classnames

- `tt_hazmat_tarp_empty`
- `tt_hazmat_tarp_full` (scope = 1, so not available in Arsenal)

#### Example

``` cpp
player addItemToBackpack "tt_hazmat_tarp_empty";
```

## Settings

### `tt_hazmat_buildTime`

- Type: `SLIDER`
- Range: `2` to `60`
- Default: `6`
- Purpose: deploy/deconstruct duration.

### `tt_hazmat_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle build animation usage.

### `tt_hazmat_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class while interacting.

### Complete example

``` cpp
// cba_settings.sqf example
force tt_hazmat_buildTime = 14; // default: 6
force tt_hazmat_useAnimation = true; // default: true
force tt_hazmat_buildAnimation = "AinvPknlMstpSnonWnonDnon_medicUp1"; // default: Acts_carFixingWheel
```
