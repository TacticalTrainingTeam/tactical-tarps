// Zeus Enhanced (ZEN) context menu integration for the "deployable tarp" framework.
// Reopens ZEN's own zen_context_menu_actions class (zen-mod/ZEN, addons/context_menu) to add
// "Instant Construct"/"Instant Remove" entries. This is entirely inert if ZEN isn't loaded -
// nothing outside of ZEN's own compileActions ever reads this branch of the config.
//
// Both entries are gated behind GVAR(enableZenContextActions) (see initSettings.inc.sqf) and are
// only ever offered for items actually registered with the framework via
// fnc_deployableAddActions (see GVAR(zenDeployableConfigs)), never for unrelated objects that
// merely share a classname with a deployed tarp.
class zen_context_menu_actions {
    // Builds fresh out in the open at the clicked position - never on top of/by promoting an
    // existing object, so it can't be confused for (or misused against) an unrelated object.
    // Hidden entirely when an existing object is right-clicked (see condition below).
    class GVAR(zenInstantConstruct) {
        displayName = CSTRING(zenInstantConstruct);
        icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";
        priority = 45;
        condition = QUOTE(GVAR(enableZenContextActions) && {!(_hoveredEntity isEqualType objNull) || {isNull _hoveredEntity}});
        insertChildren = QUOTE([_position] call FUNC(zenGetConstructActions));
    };
    class GVAR(zenInstantRemove) {
        displayName = CSTRING(zenInstantRemove);
        icon = "\a3\Ui_f\data\IGUI\Cfg\Actions\take_ca.paa";
        priority = 44;
        condition = QUOTE(GVAR(enableZenContextActions) && {_hoveredEntity isEqualType objNull} && {(_hoveredEntity getVariable [ARR_2(QQGVAR(sourceItem),'')]) in GVAR(zenDeployableConfigs)});
        statement = QUOTE([_hoveredEntity] call FUNC(zenInstantRemove));
    };
};
