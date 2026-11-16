#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Registry for the ZEN context menu integration (see fnc_deployableAddActions.sqf) -
// itemClassname -> config, for every tarp item registered by any module
GVAR(zenDeployableConfigs) = createHashMap;

// Deployed tarp classes that already got their raised ACE main interaction point
// (see fnc_deployableAddActions.sqf)
GVAR(raisedMainActionClasses) = [];

// addCuratorEditableObjects only works on the server, but tarps are built on the deploying player's machine
if (isServer) then {
    [QGVAR(addCuratorEditableObjects), {
        params [["_objects", [], [[]]]];

        {
            _x addCuratorEditableObjects [_objects, false];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;
};
// "deployedClass:deconstructId" pairs whose deconstruct action has been added to the class,
// so re-registration only removes actions that actually exist (see fnc_deployableAddActions.sqf)
GVAR(registeredDeconstructActions) = [];

ADDON = true;

