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

private _onConstruct = {
    params ["_object", "_caller"];

    _object addEventHandler ["HandleDamage", {0}]; //makes it functionally invulnerable
    private _weaponHolder = createVehicle ["GroundWeaponHolder_Scripted", getPos _object, [], 0, "CAN_COLLIDE"];
    _object setVariable [QGVAR(weaponHolder), _weaponHolder];
};

private _onDeconstruct = {
    params ["_object"];

    private _weaponHolder = _object getVariable [QGVAR(weaponHolder), objNull];
    private _arrayItems = itemCargo _weaponHolder;

    deleteVehicle _weaponHolder;

    // Give back the "full" item instead of the plain one if anything was dropped on the tarp
    [QGVAR(tarp_full), ""] select (_arrayItems isEqualTo [])
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
    ["abortText", localize ELSTRING(common,abort)],
    ["hintErrorNoSpace", localize ELSTRING(common,hintErrorNoSpace)],
    ["hintLoaded", localize ELSTRING(common,hintLoaded)],
    ["onConstruct", _onConstruct],
    ["onDeconstruct", _onDeconstruct]
];

[_config] call EFUNC(common,deployableAddActions);
