# Events

The `common` addon emits local CBA events on the triggering player's machine.

## `tt_common_tarpConstructed`

Fired after a tarp has been successfully constructed.

```sqf
["tt_common_tarpConstructed", {
    params ["_target", "_caller", "_itemClassname", "_config"];
    // _target: object that triggered the action (usually player)
    // _caller: player that constructed
    // _itemClassname: consumed inventory item class
    // _config: framework config hashmap
}] call CBA_fnc_addEventHandler;
```

## `tt_common_tarpDeconstructed`

Fired after deconstruction is confirmed and before the tarp object is deleted.

```sqf
["tt_common_tarpDeconstructed", {
    params ["_target", "_caller", "_itemClassname", "_config"];
    // _target: deployed tarp object being packed up
    // _caller: player packing up
    // _itemClassname: item class returned to inventory
    // _config: framework config hashmap
}] call CBA_fnc_addEventHandler;
```

## Notes

- These are local events (`CBA_fnc_localEvent`), not global broadcasts.
- Functional addons can also use `onConstruct` and `onDeconstruct` callbacks in their config.
