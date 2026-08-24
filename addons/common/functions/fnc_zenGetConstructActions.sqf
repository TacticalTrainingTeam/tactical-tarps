#include "..\script_component.hpp"
/*
 * Author: Andx
 *
 * Zeus Enhanced context menu insertChildren handler: returns one dynamic
 * "Instant Construct" child action per config registered with the TT
 * deployable tarp framework (see fnc_deployableAddActions.sqf), so a curator
 * can build any station type fresh at the clicked position out in the open -
 * never by acting on an existing object.
 *
 * Station types are grouped into their own submenu (sorted alphabetically),
 * with one leaf action per colour/variant inside (also sorted alphabetically).
 * A type with only a single registered item skips the submenu entirely and
 * is offered as a direct leaf, since there is no colour to choose between.
 *
 * Arguments:
 * 0: Click position (ASL) <ARRAY>
 *
 * Return Value:
 * Actions <ARRAY> - ZEN context menu action entries, see zen_context_menu_fnc_createAction
 *
 * Public: No
 */

params [["_position", [0, 0, 0], [[]]]];

// itemClassname -> [typeText, itemText, constructId] - kept string-only so it can be sorted safely
private _itemRows = (keys GVAR(zenDeployableConfigs)) apply {
    private _itemClassname = _x;
    private _config = GVAR(zenDeployableConfigs) get _itemClassname;
    private _typeText = _config get "constructText";
    private _itemText = getText (configFile >> "CfgWeapons" >> _itemClassname >> "displayName");
    private _constructId = _config get "constructId";

    [_typeText, _itemText, _itemClassname, _constructId]
};

_itemRows sort true;

// constructId -> [typeText, [[itemText, itemClassname], ...]], insertion-ordered by the sort above
private _groups = createHashMap;
{
    _x params ["_typeText", "_itemText", "_itemClassname", "_constructId"];

    private _group = _groups getOrDefault [_constructId, [_typeText, []]];
    (_group select 1) pushBack [_itemText, _itemClassname];
    _groups set [_constructId, _group];
} forEach _itemRows;

(keys _groups) apply {
    private _constructId = _x;
    (_groups get _constructId) params ["_typeText", "_items"];

    // Note: deliberately if/then/else rather than exitWith - exitWith would
    // terminate this whole script on the first single-item group, not just
    // skip to the next iteration of this apply.
    if (count _items == 1) then {
        (_items select 0) params ["", "_itemClassname"];
        private _config = GVAR(zenDeployableConfigs) get _itemClassname;

        private _leafAction = [
            _itemClassname,
            _typeText,
            "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
            {_args call FUNC(zenInstantConstruct)},
            {true},
            [_position, _itemClassname, _config]
        ] call zen_context_menu_fnc_createAction;

        [_leafAction, [], 0]
    } else {
        private _children = _items apply {
            _x params ["_itemText", "_itemClassname"];
            private _config = GVAR(zenDeployableConfigs) get _itemClassname;

            private _leafAction = [
                _itemClassname,
                _itemText,
                "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
                {_args call FUNC(zenInstantConstruct)},
                {true},
                [_position, _itemClassname, _config]
            ] call zen_context_menu_fnc_createAction;

            [_leafAction, [], 0]
        };

        private _typeAction = [
            _constructId,
            _typeText,
            "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa",
            {},
            {true},
            []
        ] call zen_context_menu_fnc_createAction;

        [_typeAction, _children, 0]
    };
};
