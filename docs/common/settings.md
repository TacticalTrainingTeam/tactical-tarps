# Settings

## `tt_common_addArsenalCategory`

- Type: `CHECKBOX`
- Default: `true`
- Scope: client setting
- Purpose: Adds a Tactical Tarps button/category in ACE Arsenal that groups tarp items.

### Behavior

When enabled during preInit, `common` collects weapon classes from:

- `tt_medic`
- `tt_drone`
- `tt_signal`
- `tt_hazmat`
- `tt_repair`

It then registers an ACE Arsenal right panel button named `Tarps`.

### Image

![Image of the ACE Arsenal showing the new Tab on the right side that includes all items of this mod.](https://images.steamusercontent.com/ugc/12395444052461539974/E530E0CAD17B0DA4A8C3271850BDE280DFACF33E/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false)

## `tt_common_enableZenContextActions`

- Type: `CHECKBOX`
- Default: `false`
- Scope: client setting
- Purpose: Adds "TT - Construct"/"TT - Remove" actions to the [Zeus Enhanced](https://github.com/zen-mod/ZEN)
  context menu for objects belonging to the deployable tarp framework (medic, hazmat, repair,
  signal, drone). Lets a curator build or remove a station instantly, without needing a player to
  carry the item. Requires ZEN to be loaded - if it isn't, this setting has no effect. See
  [Common Addon](index.md#zeus-enhanced-zen-integration-optional) for details.

## Complete example

``` cpp
// cba_settings.sqf example
force tt_common_addArsenalCategory = false; // default: true
force tt_common_enableZenContextActions = true; // default: false
```
