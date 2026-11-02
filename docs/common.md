# Common Addon

The `common` addon is the shared deployable framework used by all Tactical Tarps functional addons.

It provides:

- Generic ACE interaction wiring for construct and deconstruct flows.
- 3D placement and progress-bar based construction pipeline.
- Reusable callbacks for addon-specific side effects.
- Shared local CBA events for lifecycle hooks.

## Runtime flow

1. A functional addon builds a config HashMap.
2. The addon calls `tt_common_fnc_deployableAddActions`.
3. `common` registers construct and deconstruct interactions.
4. On successful construct/deconstruct, lifecycle events are emitted.

## Interaction flow

``` text
Player opens ACE self interaction
    └─ [Tarp type] ── [Color A]  ──► Progress bar (buildTime)
                                ├─ [Color B]       └─ Tarp object is spawned
                                └─ ...             └─ Item is removed from inventory
                                                                     └─ Event tt_common_tarpConstructed

Player opens ACE interact-with interaction on the tarp object
    └─ [Pack up tarp]  ──► Progress bar (buildTime × 1.5)
                                                     └─ Tarp object is deleted
                                                     └─ Event tt_common_tarpDeconstructed
                                                     └─ Item is returned to inventory
```

## Object variables

The deployed tarp object stores `tt_common_sourceItem` (type `STRING`) containing
the class name of the inventory item that was consumed during construction.
This value is synchronized globally and used during deconstruction to determine
which item should be returned.

## Zeus Enhanced (ZEN) integration (optional)

`common` optionally extends [Zeus Enhanced](https://github.com/zen-mod/ZEN)'s map context menu
with two curator-only entries. This is entirely optional - if ZEN isn't loaded, this integration
is completely inert and has no effect on the rest of the mod.

- **TT - Construct** - right-click empty ground to build any registered tarp instantly at that
  position, skipping the carry-item/build-time/animation flow. Entries are grouped into a submenu
  per tarp type (alphabetically), with one leaf per colour variant inside (also alphabetical).
  A tarp type with only a single registered colour skips the colour submenu and is offered
  directly.
- **TT - Remove** - right-click an existing deployed tarp to delete it instantly, with no item
  given back (there is no caller to receive it).

Both entries:

- Only appear for objects/positions relevant to this framework - **TT - Construct** never shows
  when right-clicking an existing object, and **TT - Remove** only ever appears for objects
  actually built by this framework (tracked via the `tt_common_sourceItem` object variable above),
  never for unrelated objects that merely share a classname.
- Are gated behind the `tt_common_enableZenContextActions` setting (see [Settings](#settings)).

## Settings

### `tt_common_addArsenalCategory`

- Type: `CHECKBOX`
- Default: `true`
- Scope: client setting
- Purpose: Adds a Tactical Tarps button/category in ACE Arsenal that groups tarp items.

#### Behavior

When enabled during preInit, `common` collects weapon classes from:

- `tt_medic`
- `tt_drone`
- `tt_signal`
- `tt_hazmat`
- `tt_repair`
- `tt_shelter`
- `tt_shelter_apex`

It then registers an ACE Arsenal right panel button named `Tarps`.

#### Image

![Image of the ACE Arsenal showing the new Tab on the right side that includes all items of this mod.](https://images.steamusercontent.com/ugc/12395444052461539974/E530E0CAD17B0DA4A8C3271850BDE280DFACF33E/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false)

### `tt_common_enableZenContextActions`

- Type: `CHECKBOX`
- Default: `false`
- Scope: client setting
- Purpose: Adds "TT - Construct"/"TT - Remove" actions to the [Zeus Enhanced](https://github.com/zen-mod/ZEN)
  context menu for objects belonging to the deployable tarp framework (medic, hazmat, repair, shelter,
  signal, drone). Lets a curator build or remove a station instantly, without needing a player to
  carry the item. Requires ZEN to be loaded - if it isn't, this setting has no effect. See
  [Common Addon](#zeus-enhanced-zen-integration-optional) for details.

### Complete example

``` cpp
// cba_settings.sqf example
force tt_common_addArsenalCategory = false; // default: true
force tt_common_enableZenContextActions = true; // default: false
```
