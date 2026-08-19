#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (GVAR(addArsenalCategory)) then {

    private _items = [];

    {
        private _weapons = getArray(configFile >> "CfgPatches" >> _x >> "weapons");;
        _items append _weapons;
    } forEach ["tt_medic", "tt_drone", "tt_signal", "tt_hazmat", "tt_repair"];

    GVAR(arsenalButton) = [
        _items,
       ELSTRING(main,Name),
       QPATHTOF(data\tt_icon.paa)
    ] call ace_arsenal_fnc_addRightPanelButton;
};
