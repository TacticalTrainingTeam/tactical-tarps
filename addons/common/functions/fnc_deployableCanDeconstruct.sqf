#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Generic ACE interaction condition: can the caller deconstruct/stow the given
 * deployed facility object. Part of the TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Args passed in by ACE's interaction menu <ARRAY> - [target, caller, config]
 *
 * Return Value:
 * Can deconstruct <BOOLEAN>
 *
 * Example:
 * [[_tarp, player, _config]] call tt_common_fnc_deployableCanDeconstruct
 *
 * Public: No
 */

(_this select 0) params [["_target", objNull, [objNull]], ["_caller", objNull, [objNull]], ["_config", createHashMap, [createHashMap]]];

private _itemClassname = _target getVariable [QGVAR(sourceItem), ""];
private _configTarpItems = (_config get "tarpItems") apply {_x select 0};

(_itemClassname in _configTarpItems) &&
{!(_target getVariable [(_config get "inUseVar"), false])} &&
{_caller canAdd [_itemClassname, 1]}
