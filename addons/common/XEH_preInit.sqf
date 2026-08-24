#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Registry for the ZEN context menu integration (see fnc_deployableAddActions.sqf) -
// itemClassname -> config, for every tarp item registered by any module
GVAR(zenDeployableConfigs) = createHashMap;

ADDON = true;

