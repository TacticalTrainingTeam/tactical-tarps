#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Entry point for the ACE "construct" action: starts the 3D ghost placement
 * flow for the selected tarp item. The actual build progress bar only begins
 * once that placement has been confirmed (see fnc_deployablePlace.sqf and
 * fnc_deployableStartBuild.sqf). Part of the TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Args passed in by ACE's interaction menu <ARRAY> - [target, caller, config]
 *
 * Return Value:
 * None
 *
 * Public: No
 */

(_this select 0) params ["_target", "_caller", "_config"];

private _classname = ((_config get "tarpItems") select 0) select 1;

[_target, _caller, _config, _classname] call FUNC(deployablePlace);
