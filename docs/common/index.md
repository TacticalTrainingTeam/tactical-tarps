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

Use the pages in this site for events, settings, API details, and integration examples.
