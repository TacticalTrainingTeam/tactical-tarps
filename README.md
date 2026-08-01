# Tactical Tarps

[![Tactical Tarps Logo](https://github.com/TacticalTrainingTeam/tactical-tarps/blob/main/img/tt_logo.png?raw=true)](https://github.com/TacticalTrainingTeam/tactical-tarps/blob/main/img/tt_logo.png?raw=true)

[![CI](https://github.com/TacticalTrainingTeam/tactical-tarps/actions/workflows/ci.yml/badge.svg)](https://github.com/TacticalTrainingTeam/tactical-tarps/actions/workflows/ci.yml)

Tactical Tarps is a spin-off from the internal mod of the [Tactical Training Team](https://tacticalteam.de).

## Framework

The `common` addon provides the shared infrastructure for all deployable tarps in the Tactical Tarps mod.
It is used by the following addons:

- Signal Tarp – marking a helicopter landing zone
- Drone Tarp – marking a drone landing spot
- Medical Tarp – mobile medical facility
- Hazmat Tarp - a drop-off point for contaminated items - deletes them when packed up and returns a full bag instead of the tarp

These examples show what is possible with the framework.

## Flow

Each tarp addon registers its actions via `tt_common_fnc_deployableAddActions`.
Every interaction then proceeds as follows:

```
Player opens ACE self interaction
  └─ [Tarp type] ── [Color A]  ──► Progress bar (buildTime)
                ├─ [Color B]       └─ Tarp object is spawned
                └─ ...             └─ Item is removed from inventory
                                   └─ Event ttt_tarps_tarpConstructed

Player opens ACE interact-with interaction on the tarp object
  └─ [Pack up tarp]  ──► Progress bar (buildTime × 1.5)
                           └─ Tarp object is deleted
                           └─ Event ttt_tarps_tarpDeconstructed
                           └─ Item is returned to inventory
```

The object attribute `tt_tarps_sourceItem` (type: STRING) set on the tarp object contains the
class name of the original inventory item and is globally synchronized.

## Public API – `tt_tarps_fnc_deployableAddActions`

Registers all ACE interactions for a new tarp addon.
Typically called once in `XEH_postInit.sqf`.

``` sqf
private _config = createHashMapFromArray [
    // Required fields
    ["constructId",     "my_addon_construct"],          // Unique ACE action ID (construct)
    ["deconstructId",   "my_addon_deconstruct"],         // Unique ACE action ID (deconstruct)
    ["tarpItems", [                                      // Mapping inventory item → tarp object
        ["my_addon_tarp_Black", "Tarp_01_Large_Black_F"],
        ["my_addon_tarp_Green", "Tarp_01_Large_Green_F"]
    ]],
    ["inUseVar",        "my_addon_inUse"],               // Object variable used as a lock flag
    ["buildTime",       10],                             // Build time in seconds; deconstruct time = × 1.5
    ["constructText",   "Deploying tarp..."],              // Progress bar text (construct)
    ["deconstructText", "Packing up tarp..."],             // Progress bar text (deconstruct)
    ["abortText",       "Aborted"],                  // Hint on abort
    ["hintErrorNoSpace","No space available"],          // Hint when there is no space
    ["hintLoaded",      "Tarp has been packed up"],         // Hint after successful deconstruction

    // Optional fields
    ["useAnimation",   true],                            // default: true
    ["animation",      "Acts_carFixingWheel"],            // default: "Acts_carFixingWheel"
    ["onConstruct", {                                    // Callback after construction (local)
        params ["_object", "_caller", "_config"];
        // ...
    }],
    ["onDeconstruct", {                                  // Callback before deletion (local)
        params ["_target", "_caller", "_config"];
        // ...
    }]
];

[_config] call tt_common_fnc_deployableAddActions;
```

### Parameter table

| Key | Type | Required | Description |
| - | - | - | - |
| `constructId` | STRING | ✓ | Unique ID of the ACE construct action |
| `deconstructId` | STRING | ✓ | Unique ID of the ACE deconstruct action |
| `tarpItems` | ARRAY | ✓ | `[[itemClass, objectClass], ...]` – mapping item → tarp object |
| `inUseVar` | STRING | ✓ | Object variable set during an action to lock out simultaneous actions |
| `buildTime` | NUMBER | ✓ | Build time in seconds; deconstruct time is 1.5 times that |
| `constructText` | STRING | ✓ | Progress bar text while constructing |
| `deconstructText` | STRING | ✓ | Progress bar text while deconstructing |
| `abortText` | STRING | ✓ | Hint on abort |
| `hintErrorNoSpace` | STRING | ✓ | Hint when there is no space to deploy |
| `hintLoaded` | STRING | ✓ | Hint after successfully packing up |
| `useAnimation` | BOOLEAN | – | Should the player play an animation? (default: `true`) |
| `animation` | STRING | – | Name of the animation class (default: `"Acts_carFixingWheel"`) |
| `onConstruct` | CODE | – | `[_object, _caller, _config]` – called locally after spawning |
| `onDeconstruct` | CODE | – | `[_target, _caller, _config]` – called locally before deletion; the return value overrides the item that is placed into the inventory |

## Events

Both events are fired as a **local CBA event** on the machine of the triggering player.

### `tt_common_tarpConstructed`

Fired after the tarp has been successfully constructed.

``` sqf
["tt_common_tarpConstructed", {
    params ["_object", "_caller", "_itemClassname", "_config", ];
    // _object  - the constructed tarp object
    // _caller  - the player
    // _itemClassname - class name of the inventory item used
    // _config  - the configuration hash map
}] call CBA_fnc_addEventHandler;
```

### `tt_common_tarpDeconstructed`

Fired after the deconstruction has been confirmed, but **before** the object is deleted.

``` sqf
["tt_common_tarpDeconstructed", {
    params ["_target", "_caller", "_itemClassname", "_config"];
    // _target        - the still-existing tarp object
    // _caller        - the player
    // _itemClassname - class name of the returned inventory item
    // _config        - the configuration hash map
}] call CBA_fnc_addEventHandler;
```

## Maintainer

- Andx
