#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Spawns the deployed object matching whichever tarp item the caller is
 * carrying, at the position/orientation confirmed during the 3D placement
 * step, consumes that item, and flips the relevant state variables. Part of
 * the TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Player <OBJECT>
 * 2: Config <HASHMAP> - supported keys:
 *    "tarpItems"      <ARRAY of [itemClassname, objectClassname]> - maps each
 *                     carryable tarp item to the object it deploys
 *    "inUseVar"       <STRING> - object variable used to lock the item while (de)constructing
 *    "onConstruct"    <CODE> (optional) - called as [_object, _caller, _config], for addon specific side effects
 * 3: Confirmed placement position (ASL) <ARRAY>
 * 4: Confirmed placement [vectorDir, vectorUp] <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_target", "_caller", "_config", "_posASL", "_vectorDirAndUp"];

private _carriedItems = items _target;
private _tarpItems = _config get "tarpItems";
(_tarpItems select (_tarpItems findIf {(_x select 0) in _carriedItems})) params ["_itemClassname", "_classname"];

_target removeItem _itemClassname;

private _object = createVehicle [_classname, [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object setPosASL _posASL;
_object setVectorDirAndUp _vectorDirAndUp;

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
[_object, _target, _config] call _onConstruct;

{
    _x addCuratorEditableObjects [[_object, _grassCutter], false];
} forEach allCurators;

_target switchMove "";

[QGVAR(tarpConstructed), [_target, _caller, _itemClassname, _config], _caller] call CBA_fnc_localEvent;
