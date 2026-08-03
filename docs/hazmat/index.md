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
