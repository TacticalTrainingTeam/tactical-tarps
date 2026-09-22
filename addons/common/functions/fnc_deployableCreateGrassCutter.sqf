#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Spawns an invisible clutter cutter sized to the given object's bounding
 * sphere, so grass doesn't clip through it. Part of the TT "deployable tarp"
 * framework.
 *
 * Arguments:
 * 0: Object to cut clutter around <OBJECT>
 *
 * Return Value:
 * Clutter cutter <OBJECT>
 *
 * Public: No
 */

params ["_object"];

private _boundingSphere = boundingBoxReal _object select 2;

private _class = switch true do {
    case (_boundingSphere < 2): {"Land_ClutterCutter_small_F"};
    case (_boundingSphere < 6): {"Land_ClutterCutter_medium_F"};
    default {"Land_ClutterCutter_large_F"};
};

createVehicle [_class, getPos _object, [], 0, "CAN_COLLIDE"]
