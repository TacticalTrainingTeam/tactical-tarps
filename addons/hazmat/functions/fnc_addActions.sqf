#include "..\script_component.hpp"
/*
* Author: EinStein, Andx
*
* Builds the config for, and registers with, the shared TT "deployable
* tarp" framework (see tt_common's deployable* functions). Also handles
* deleting any items players dropped on the tarp and swapping the item
* given back on pickup to the "full" variant when that happens.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call ttt_hazmat_tarp_fnc_addActions;
*
* Public: No
*/

private _tarpItems = [
    [QGVAR(tarp_empty), "HazmatBag_01_empty_F"]
];

// Items dropped by players within this radius of the tarp count as "on it"
#define ITEM_PICKUP_RADIUS 2

private _onConstruct = {
    params ["_object", "_caller"];

    _object addEventHandler ["HandleDamage", {0}]; //makes it functionally invulnerable
};

private _onDeconstruct = {
    params ["_target"];

    deleteVehicle [_target nearObjects ITEM_PICKUP_RADIUS];

    // Give back the "full" item instead of the plain one if anything was dropped on the tarp
    [QGVAR(tarp_full), ""] select (_droppedItems isEqualTo [])
};

private _config = createHashMapFromArray [
    ["constructId", QGVAR(construct)],
    ["deconstructId", QGVAR(deconstruct)],
    ["tarpItems", _tarpItems],
    ["inUseVar", QGVAR(inUse)],
    ["buildTime", GVAR(buildTime)],
    ["useAnimation", GVAR(useAnimation)],
    ["animation", GVAR(buildAnimation)],
    ["constructText", LLSTRING(actionConstruct)],
    ["deconstructText", LLSTRING(actionDeconstruct)],
    ["abortText", LLSTRING(abort)],
    ["hintErrorNoSpace", LLSTRING(hintErrorNoSpace)],
    ["hintLoaded", LLSTRING(hintLoaded)],
    ["onConstruct", _onConstruct],
    ["onDeconstruct", _onDeconstruct]
];

[_config] call EFUNC(common,deployableAddActions);
