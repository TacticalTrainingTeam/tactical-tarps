# Repair Addon

The `repair` addon registers a deployable vehicle repair tarp on top of the shared `common` framework.

Unlike the other functional addons, the repair tarp is only available in a single color.

## What it adds

- One deployable repair tarp variant (black only).
- Default spawn of decorative tool props (wrench, pliers, screwdriver, gloves) around the tarp on deploy.
- Spawned tool props have simulation disabled, so they behave as cheap, non-interactive clutter.
- Cleanup of the spawned props on deconstruct.

### Classnames

- `tt_repair_tarp_Black`

#### Example

``` cpp
player addItemToBackpack "tt_repair_tarp_Black";
```

## Settings

### `tt_repair_additionalItems`

- Type: `EDITBOX`
- Default: `["Land_Wrench_F","Land_Pliers_F","Land_Screwdriver_V1_F","Land_Gloves_F"]`
- Expected format: SQF array string, for example `["Land_Wrench_F","Land_Pliers_F"]`
- Purpose: classnames to spawn around the deployed tarp. Spawned objects have simulation disabled (decorative only).

### `tt_repair_buildTime`

- Type: `SLIDER`
- Range: `2` to `60`
- Default: `6`
- Purpose: deploy/deconstruct duration.

### `tt_repair_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle build animation usage.

### `tt_repair_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class while interacting.

### Complete example

``` cpp
// cba_settings.sqf example
force tt_repair_additionalItems = '["Land_Wrench_F","Land_Toolbox_F"]'; // default: ["Land_Wrench_F","Land_Pliers_F","Land_Screwdriver_V1_F","Land_Gloves_F"]
force tt_repair_buildTime = 12; // default: 6
force tt_repair_useAnimation = false; // default: true
force tt_repair_buildAnimation = "AinvPknlMstpSnonWnonDnon_medicUp1"; // default: Acts_carFixingWheel
```
