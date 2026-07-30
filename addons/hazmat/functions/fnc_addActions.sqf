#include "..\script_component.hpp"
/*
* Author: EinStein, Andx
*
* Builds the config for, and registers with, the shared TT "deployable
* tarp" framework (see tt_common's deployable* functions).
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
    [QGVAR(tarp_Hazmat), "HazmatBag_01_empty_F"]
];

private _onConstruct = {
    params ["_object", "_caller"];

    _object addEventHandler ["HandleDamage", {0}]; //makes it functionally invulnerable
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
    ["onConstruct", _onConstruct]
];

[_config] call EFUNC(common,deployableAddActions);
