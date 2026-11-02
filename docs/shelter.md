# Shelter Addon

The `shelter` addon registers a deployable shelter tarp on top of the shared `common` framework.

## What it adds

- Up to four deployable shelter tarp variants, each of which is packed back into the backpack on deconstruct:
    - Green: the base game A-frame tent (`Land_TentA_F`).
    - Green (IR Cover): the infrared-masking cover (`Land_IRMaskingCover_02_F`). It uses the same green icon as the A-frame tarp and takes 10 seconds longer to deploy than the other shelters (stowing scales the same way).
    - Yellow: the open cloth canopy (`Land_ClothShelter_01_F`).
    - Blue: the abandoned boat cover (`Land_Boat_03_abandoned_cover_F`).

!!! info "Apex"
    The IR cover, yellow and blue tarps deploy objects from Arma 3 Apex. They are provided by the optional
    `tt_shelter_apex` sub-addon, which is skipped when Apex is not loaded. The A-frame tent from `tt_shelter`
    is always available.

### Classnames

- `tt_shelter_tarp_Green`
- `tt_shelter_tarp_GreenCover`
- `tt_shelter_tarp_Yellow`
- `tt_shelter_tarp_Blue`

#### Example

``` cpp
player addItemToBackpack "tt_shelter_tarp_Yellow";
```

## Settings

### `tt_shelter_buildTime`

- Type: `SLIDER`
- Range: `2` to `120`
- Default: `20`
- Purpose: deploy/deconstruct duration.

### `tt_shelter_useAnimation`

- Type: `CHECKBOX`
- Default: `true`
- Purpose: toggle build animation usage.

### `tt_shelter_buildAnimation`

- Type: `EDITBOX`
- Default: `Acts_carFixingWheel`
- Purpose: animation class while interacting.

### Complete example

``` cpp
// cba_settings.sqf example
force tt_shelter_buildTime = 30; // default: 20
force tt_shelter_useAnimation = false; // default: true
force tt_shelter_buildAnimation = "AinvPknlMstpSnonWnonDnon_medicUp1"; // default: Acts_carFixingWheel
```
