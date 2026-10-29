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
* [] call tt_shelter_fnc_addActions;
*
* Public: No
*/

private _tarpItems = [
    [QGVAR(tarp_Green), "Land_TentA_F"],
    [QGVAR(tarp_GreenCover), "Land_IRMaskingCover_02_F", 10],
    [QGVAR(tarp_Yellow),"Land_ClothShelter_01_F"],
    [QGVAR(tarp_Blue), "Land_Boat_03_abandoned_cover_F"]
];

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
    ["hintLoaded", localize ELSTRING(common,hintLoaded)]
];

[_config] call EFUNC(common,deployableAddActions);
