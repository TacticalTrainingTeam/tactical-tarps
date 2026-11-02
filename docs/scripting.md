# Scripting & API

The `common` framework is what mission makers and addon authors build on: register a deployable tarp with one function call, and react to its lifecycle through CBA events. See [Common](common.md) for how the framework works and for its settings.

## API Functions

### Public entry point

#### `tt_common_fnc_deployableAddActions`

Registers ACE interactions for a deployable tarp implementation - best in `XEH_postInit.sqf`.

``` cpp
[_config] call tt_common_fnc_deployableAddActions;
```

Complete integration example:

``` cpp
private _config = createHashMapFromArray [
    ["constructId", "my_addon_construct"],
    ["deconstructId", "my_addon_deconstruct"],
    ["tarpItems", [
        ["my_addon_tarp_Black", "Tarp_01_Large_Black_F"],
        ["my_addon_tarp_Green", "Tarp_01_Large_Green_F"]
    ]],
    ["inUseVar", "my_addon_inUse"],
    ["buildTime", 10],
    ["constructText", "Deploying tarp..."],
    ["deconstructText", "Packing up tarp..."],
    ["abortText", "Aborted"],
    ["hintErrorNoSpace", "No space available"],
    ["hintLoaded", "Tarp has been packed up"],

    // Optional
    ["useAnimation", true],
    ["animation", "Acts_carFixingWheel"],
    ["onConstruct", {
        params ["_object", "_caller", "_config"];
    }],
    ["onDeconstruct", {
        params ["_target", "_caller", "_config"];
    }]
];

[_config] call tt_common_fnc_deployableAddActions;
```

Required config keys:

| Key | Type | Description |
| - | - | - |
| `constructId` | `STRING` | Unique ACE action id for construct menu |
| `deconstructId` | `STRING` | Unique ACE action id for deconstruct action |
| `tarpItems` | `ARRAY` | `[[itemClass, objectClass, buildTimeOffset], ...]` mapping. `buildTimeOffset` (`NUMBER`, seconds, default `0`) is optional and is added to `buildTime` for that item, for both deploying and stowing |
| `inUseVar` | `STRING` | Object variable used as action lock |
| `buildTime` | `NUMBER` | Construct duration in seconds |
| `constructText` | `STRING` | Progress label for construct |
| `deconstructText` | `STRING` | Progress label for deconstruct |
| `abortText` | `STRING` | Abort hint text |
| `hintErrorNoSpace` | `STRING` | Hint shown if placement fails |
| `hintLoaded` | `STRING` | Hint shown after successful deconstruct |

Optional config keys:

| Key | Type | Description |
| - | - | - |
| `useAnimation` | `BOOLEAN` | Play animation during progress (`true` default) |
| `animation` | `STRING` | Animation class name |
| `onConstruct` | `CODE` | Callback `[_object, _caller, _config]` after spawn |
| `onDeconstruct` | `CODE` | Callback `[_target, _caller, _config]` before deletion |

## Events

The `common` addon emits local CBA events on the triggering player's machine.

### `tt_common_tarpConstructed`

Fired after a tarp has been successfully constructed.

``` cpp
["tt_common_tarpConstructed", {
    params ["_target", "_caller", "_itemClassname", "_config"];
    // _target: object that triggered the action (usually player)
    // _caller: player that constructed
    // _itemClassname: consumed inventory item class
    // _config: framework config hashmap
}] call CBA_fnc_addEventHandler;
```

### `tt_common_tarpDeconstructed`

Fired after deconstruction is confirmed and before the tarp object is deleted.

``` cpp
["tt_common_tarpDeconstructed", {
    params ["_target", "_caller", "_itemClassname", "_config"];
    // _target: deployed tarp object being packed up
    // _caller: player packing up
    // _itemClassname: item class returned to inventory
    // _config: framework config hashmap
}] call CBA_fnc_addEventHandler;
```

### Notes

- These are local events (`CBA_fnc_localEvent`), not global broadcasts.
- Functional addons can also use `onConstruct` and `onDeconstruct` callbacks in their config.
