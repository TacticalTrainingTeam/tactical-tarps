#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

ADDON = true;

if (GVAR(addArsenalCategory)) then {

    private _items = [];

    {
        private _weapons = [_x] call FUNC(getAllitems);
        _items append _weapons;
    } forEach ["tt_medical_tarp", "tt_drone_tarp", "tt_signal_tarp"];

    GVAR(arsenalButton) = [
        _items,
       "Tarps",
        "a3\modules_f\data\iconstrategicmapinit_ca.paa"
    ] call ace_arsenal_fnc_addRightPanelButton;
};
