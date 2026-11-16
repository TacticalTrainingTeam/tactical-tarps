#include "..\script_component.hpp"
/*
 * Author: EinStein
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
 * [] call tt_medic_tarp_fnc_addActions;
 *
 * Public: No
 */

private _tarpItems = [
    [QGVAR(tarp_Black), "Tarp_01_Large_Black_F"],
    [QGVAR(tarp_Green), "Tarp_01_Large_Green_F"],
    [QGVAR(tarp_Red), "Tarp_01_Large_Red_F"],
    [QGVAR(tarp_Yellow), "Tarp_01_Large_Yellow_F"]
];

private _onConstruct = {
    params ["_object", "_caller"];

    _object setVariable ["ace_medical_isMedicalFacility", true, true];
    _object addEventHandler ["HandleDamage", {0}]; //makes it functionally invulnerable

    private _position = getPos _object;

    // Remember the spawned props so stowing removes exactly these and nothing a mission placed nearby
    private _props = (parseSimpleArray GVAR(additionalItems)) apply {
        createVehicle [_x, _position, [], 3, "CAN_COLLIDE"]
    };
    _object setVariable [QGVAR(props), _props, true];

    [QEGVAR(common,addCuratorEditableObjects), [_props]] call CBA_fnc_serverEvent;
};

private _onDeconstruct = {
    params ["_object"];

    deleteVehicle (_object getVariable [QGVAR(props), []]);
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
