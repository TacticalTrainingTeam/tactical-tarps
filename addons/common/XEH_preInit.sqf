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
        private _weapons = getArray(configFile >> "CfgPatches" >> _x >> "weapons");;
        _items append _weapons;
    } forEach ["tt_medic", "tt_drone", "tt_signal", "tt_hazmat"];

    GVAR(arsenalButton) = [
        _items,
       ELSTRING(main,Name),
       QPATHTOF(data\tt_icon.paa)
    ] call ace_arsenal_fnc_addRightPanelButton;
};
