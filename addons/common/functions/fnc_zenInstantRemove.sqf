#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Zeus Enhanced context menu handler: instantly removes a TT "deployable
 * tarp" framework station without giving any item back (there is no caller
 * to receive it). Only ever wired up (see CfgZenContext.hpp) for objects
 * that actually carry the framework's QGVAR(sourceItem) marker - i.e. were
 * really constructed by this framework, not merely a similar-looking object
 * a curator placed by hand.
 *
 * Arguments:
 * 0: Deployed object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_object"];

private _itemClassname = _object getVariable [QGVAR(sourceItem), ""];

if (isNull _object || {_itemClassname == ""} || {!(_itemClassname in GVAR(zenDeployableConfigs))}) exitWith {};

private _config = GVAR(zenDeployableConfigs) get _itemClassname;

private _onDeconstruct = _config getOrDefault ["onDeconstruct", {}];
[_object, objNull, _config] call _onDeconstruct;

[QGVAR(tarpDeconstructed), [_object, objNull, _itemClassname, _config], ACE_player] call CBA_fnc_localEvent;

private _grassCutter = _object getVariable [QGVAR(grassCutter), objNull];
if !(isNull _grassCutter) then {
    deleteVehicle _grassCutter;
};

deleteVehicle _object;
