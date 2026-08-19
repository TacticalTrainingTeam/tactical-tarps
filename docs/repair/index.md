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
