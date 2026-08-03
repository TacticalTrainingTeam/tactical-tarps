# Drone Addon

The `drone` addon registers deployable drone landing tarps by configuring the shared `common` framework.

## What it adds

- Four deployable tarp item variants (black, green, red, yellow).
- A helper `Land_HelipadEmpty_F` object created on deploy to support landing logic.
- Cleanup of the helper helipad on deconstruct.

### Classnames

- `tt_drone_tarp_Black`
- `tt_drone_tarp_Red`
- `tt_drone_tarp_Green`
- `tt_drone_tarp_Yellow`

#### Example

``` cpp
player addItemToBackpack "tt_drone_tarp_Green";
```
