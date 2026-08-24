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
- Are gated behind the `tt_common_enableZenContextActions` setting (see [Settings](settings.md)).
