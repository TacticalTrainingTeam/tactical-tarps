#include "..\script_component.hpp"
/*
 * Author: Andx, ACE Team
 *
 * Shows a local-only ghost preview of the deployable object that follows the
 * caller's view and can be rotated with the mouse wheel. Confirming with the
 * default action key (usually left mouse button) hands the confirmed
 * position/orientation off to the construction progress bar; right mouse
 * button cancels the placement instead of raising the weapon. Part of the
 * TT "deployable tarp" framework.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Caller <OBJECT>
 * 2: Config <HASHMAP>
 * 3: Object classname to preview <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_target", "_caller", "_config", "_classname"];

private _ghost = _classname createVehicleLocal [0, 0, 0];
_ghost enableSimulationGlobal false;
_ghost allowDamage false;
_ghost disableCollisionWith _caller;

(boundingBoxReal _ghost) params ["_bbMin", "_bbMax"];
private _distance = (((_bbMax select 0) - (_bbMin select 0)) max ((_bbMax select 1) - (_bbMin select 1))) / 2 + 1.5;

private _updateGhostTransform = {
    private _basePos = (eyePos _caller) vectorAdd ((getCameraViewDirection _caller) vectorMultiply _distance);
    _basePos set [2, getTerrainHeightASL _basePos];

    _ghost setPosASL _basePos;
    _ghost setDir (GVAR(placeRotation) + getDir _caller);
    _ghost setVectorUp (surfaceNormal _basePos);
};

GVAR(placeState) = PLACE_WAITING;
GVAR(placeRotation) = 0;
call _updateGhostTransform;

[localize ELSTRING(main,placeConfirm), localize ELSTRING(main,placeCancel), localize ELSTRING(main,placeRotate)] call ace_interaction_fnc_showMouseHint;

private _confirmId = [_caller, "DefaultAction", {GVAR(placeState) == PLACE_WAITING}, {GVAR(placeState) = PLACE_APPROVE}] call ace_common_fnc_addActionEventHandler;

private _scrollDisplay = findDisplay 46;
private _scrollEventId = _scrollDisplay displayAddEventHandler ["MouseZChanged", {
    params ["", "_delta"];
    GVAR(placeRotation) = GVAR(placeRotation) + (_delta * 15);
    true
}];

// Consume RMB ourselves so it cancels placement instead of raising the weapon
private _cancelEventId = _scrollDisplay displayAddEventHandler ["MouseButtonDown", {
    params ["", "_button"];
    if (_button == 1) then {GVAR(placeState) = PLACE_CANCEL};
    _button == 1
}];

[{
    params ["_args", "_pfID"];
    _args params ["_target", "_caller", "_config", "_ghost", "_confirmId", "_cancelEventId", "_scrollDisplay", "_scrollEventId", "_updateGhostTransform", "_distance"];

    if (_caller != ACE_player || {!alive _caller} || {isNull _ghost}) then {
        GVAR(placeState) = PLACE_CANCEL;
    };

    // Reject an invalid spot but keep the loop running so the caller can try again
    if (GVAR(placeState) == PLACE_APPROVE && {surfaceIsWater getPosASL _ghost}) then {
        [(_config get "hintErrorNoSpace"), true] call ace_common_fnc_displayText;
        GVAR(placeState) = PLACE_WAITING;
    };

    if (GVAR(placeState) != PLACE_WAITING) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;

        call ace_interaction_fnc_hideMouseHint;
        [_caller, "DefaultAction", _confirmId] call ace_common_fnc_removeActionEventHandler;
        _scrollDisplay displayRemoveEventHandler ["MouseZChanged", _scrollEventId];
        _scrollDisplay displayRemoveEventHandler ["MouseButtonDown", _cancelEventId];

        if (GVAR(placeState) == PLACE_APPROVE) then {
            private _posASL = getPosASL _ghost;
            private _vectorDirAndUp = [vectorDir _ghost, vectorUp _ghost];
            deleteVehicle _ghost;
            [_target, _caller, _config, _posASL, _vectorDirAndUp] call FUNC(deployableStartBuild);
        } else {
            deleteVehicle _ghost;
            [_target, _caller, _config] call FUNC(deployableCancel);
        };
    };

    call _updateGhostTransform;
}, 0, [_target, _caller, _config, _ghost, _confirmId, _cancelEventId, _scrollDisplay, _scrollEventId, _updateGhostTransform, _distance]] call CBA_fnc_addPerFrameHandler;
