#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (GVAR(addArsenalCategory)) then {

    private _items = [];

    {
        _items append getArray (configFile >> "CfgPatches" >> _x >> "weapons");
    } forEach [
        QUOTE(DOUBLES(PREFIX,medic)),
        QUOTE(DOUBLES(PREFIX,drone)),
        QUOTE(DOUBLES(PREFIX,signal)),
        QUOTE(DOUBLES(PREFIX,hazmat)),
        QUOTE(DOUBLES(PREFIX,repair)),
        QUOTE(DOUBLES(PREFIX,shelter)),
        QUOTE(TRIPLES(PREFIX,shelter,apex))
    ];

    GVAR(arsenalButton) = [
        _items,
        localize ELSTRING(main,Name),
        QPATHTOF(data\tt_icon.paa)
    ] call ace_arsenal_fnc_addRightPanelButton;
};
