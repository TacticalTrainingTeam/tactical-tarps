#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Starts the progress bar for constructing a deployable item once its 3D
 * placement has been confirmed. Part of the TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Caller <OBJECT>
 * 2: Config <HASHMAP>
 * 3: Confirmed placement position (ASL) <ARRAY>
 * 4: Confirmed placement [vectorDir, vectorUp] <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_target", "_caller", "_config", "_posASL", "_vectorDirAndUp"];

if (_config getOrDefault ["useAnimation", true]) then {
    _caller playMove (_config getOrDefault ["animation", "Acts_carFixingWheel"]);
};

[
    _config get "buildTime",
    [_target, _caller, _config, _posASL, _vectorDirAndUp],
    {
        (_this select 0) params ["_target", "_caller", "_config", "_posASL", "_vectorDirAndUp"];
        [_target, _caller, _config, _posASL, _vectorDirAndUp] call FUNC(deployableConstruct);
    },
    {
        (_this select 0) params ["_target", "_caller", "_config"];
        [_target, _caller, _config] call FUNC(deployableCancel);
    },
    _config get "constructText"
] call ace_common_fnc_progressBar;
