# Shelter Addon

The `shelter` addon registers a deployable shelter tarp on top of the shared `common` framework.

## What it adds

- Four deployable shelter tarp variants, each of which is packed back into the backpack on deconstruct:
    - Green: the base game A-frame tent (`Land_TentA_F`).
    - Green (IR Cover): the infrared-masking cover (`Land_IRMaskingCover_02_F`). It uses the same green icon as the A-frame tarp and takes 10 seconds longer to deploy than the other shelters (stowing scales the same way).
    - Yellow: the open cloth canopy (`Land_ClothShelter_01_F`).
    - Blue: the abandoned boat cover (`Land_Boat_03_abandoned_cover_F`).

!!! info "Apex"
    The IR cover, yellow and blue tarps deploy objects from Arma 3 Apex, so the addon requires Apex to be loaded.

### Classnames

- `tt_shelter_tarp_Green`
- `tt_shelter_tarp_GreenCover`
- `tt_shelter_tarp_Yellow`
- `tt_shelter_tarp_Blue`

#### Example

``` cpp
player addItemToBackpack "tt_shelter_tarp_Yellow";
```
