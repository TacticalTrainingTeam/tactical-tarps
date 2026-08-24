[
    QGVAR(addArsenalCategory),
    "CHECKBOX",
    "Add Arsenal Category",
    [ELSTRING(main,Name), "Common"],
    true
] call CBA_fnc_addSetting;

if ("zen_main" call CBA_fnc_isModLoaded) then {
    [
        QGVAR(enableZenContextActions),
        "CHECKBOX",
        [LSTRING(settingEnableZenContextActions_name), LSTRING(settingEnableZenContextActions_description)],
        [ELSTRING(main,Name), "Common"],
        true
    ] call CBA_fnc_addSetting;
};

