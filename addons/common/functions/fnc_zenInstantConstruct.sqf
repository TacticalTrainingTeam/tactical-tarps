#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Zeus Enhanced context menu handler: builds a fully constructed TT
 * "deployable tarp" framework station fresh at the given position, skipping
 * the carry-item/build-time/animation flow. Never acts on an existing object -
 * only ever wired up (see CfgZenContext.hpp) for item/config combinations that
 * are registered with the framework via fnc_deployableAddActions.
 *
 * Arguments:
 * 0: Position to build at (ASL) <ARRAY>
 * 1: Source item classname <STRING>
 * 2: Config <HASHMAP> - see EFUNC(common,deployableConstruct) header for the
 *    full list of supported keys.
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_position", "_itemClassname", "_config"];

private _tarpItems = _config get "tarpItems";
private _index = _tarpItems findIf {_x select 0 == _itemClassname};

if (_index == -1) exitWith {};

(_tarpItems select _index) params ["", "_objectClassname"];

private _object = createVehicle [_objectClassname, [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object setPosASL _position;

private _boundingSphere = boundingBoxReal _object select 2;

private _grassCutter = switch true do {
    case (_boundingSphere < 2): {createVehicle ["Land_ClutterCutter_small_F", getPos _object, [], 0, "CAN_COLLIDE"];};
    case (_boundingSphere < 6): {createVehicle ["Land_ClutterCutter_medium_F", getPos _object, [], 0, "CAN_COLLIDE"];};
    default {createVehicle ["Land_ClutterCutter_large_F", getPos _object, [], 0, "CAN_COLLIDE"];};
};

_object setVariable [(_config get "inUseVar"), false, true];
_object setVariable [QGVAR(sourceItem), _itemClassname, true];
_object setVariable [QGVAR(grassCutter), _grassCutter, true];

private _onConstruct = _config getOrDefault ["onConstruct", {}];
[_object, objNull, _config] call _onConstruct;

{
    _x addCuratorEditableObjects [[_object, _grassCutter], false];
} forEach allCurators;

[QGVAR(tarpConstructed), [_object, objNull, _itemClassname, _config], ACE_player] call CBA_fnc_localEvent;
