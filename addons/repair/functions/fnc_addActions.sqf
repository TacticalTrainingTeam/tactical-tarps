#include "..\script_component.hpp"
/*
* Author: Andx
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
* [] call tt_repair_tarp_fnc_addActions;
*
* Public: No
*/

private _tarpItems = [
    [QGVAR(tarp_Black), "Tarp_01_Large_Black_F"]
];

private _onConstruct = {
    params ["_object", "_caller"];

    _object addEventHandler ["HandleDamage", {0}]; //makes it functionally invulnerable

    private _position = getPos _object;

    {
        // decorative only - disable simulation so they behave like cheap simple objects
        (createVehicle [_x, _position, [], 3, "CAN_COLLIDE"]) enableSimulationGlobal false;
    } forEach (parseSimpleArray GVAR(additionalItems));

    private _arrayItems = [_position, 8, 8, 0, true, 0] nearEntities [parseSimpleArray GVAR(additionalItems), false, true, false];

    {
        _x addCuratorEditableObjects [([_object]), false];
    } forEach allCurators;
};

private _onDeconstruct = {
    params ["_object"];

    private _position = getPos _object;
    private _arrayItems = [_position, 8, 8, 0, true, 0] nearEntities [parseSimpleArray GVAR(additionalItems), false, true, false];

    deleteVehicle _arrayItems;
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
