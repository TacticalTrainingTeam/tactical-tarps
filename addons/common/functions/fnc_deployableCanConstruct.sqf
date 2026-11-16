#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Generic ACE interaction condition: can the caller construct their deployable
 * item. Part of the TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Args passed in by ACE's interaction menu <ARRAY> - [target, caller, config]
 *
 * Return Value:
 * Can construct <BOOLEAN>
 *
 * Example:
 * [[player, player, _config]] call tt_common_fnc_deployableCanConstruct
 *
 * Public: No
 */

(_this select 0) params [["_target", objNull, [objNull]], "", ["_config", createHashMap, [createHashMap]]];

private _carriedItems = items _target;

(_config get "tarpItems") findIf {(_x select 0) in _carriedItems} != -1
