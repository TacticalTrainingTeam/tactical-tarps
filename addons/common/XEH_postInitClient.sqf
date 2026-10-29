#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (GVAR(addArsenalCategory)) then {

    private _items = [];

    {
        _items append getArray (configFile >> "CfgPatches" >> _x >> "weapons");
    } forEach ["tt_medic", "tt_drone", "tt_signal", "tt_hazmat", "tt_repair", "tt_shelter", "tt_shelter_apex"];

    GVAR(arsenalButton) = [
        _items,
        localize ELSTRING(main,Name),
        QPATHTOF(data\tt_icon.paa)
    ] call ace_arsenal_fnc_addRightPanelButton;
};
