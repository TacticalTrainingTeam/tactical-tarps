# Settings

## `tt_drone_buildTime`

- Type: `SLIDER`
- Range: `2` to `60`
- Default: `6`
- Purpose: build time for deploying drone tarp.

## `tt_drone_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle animation during deploy/deconstruct progress bars.

## `tt_drone_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class used while building/packing.

## Complete example

``` cpp
// cba_settings.sqf example
force tt_drone_buildTime = 10; // default: 6
force tt_drone_useAnimation = false; // default: true
force tt_drone_buildAnimation = "Acts_carFixingEngine"; // default: Acts_carFixingWheel
```
