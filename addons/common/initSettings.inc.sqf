[
    QGVAR(addArsenalCategory),
    "CHECKBOX",
    "Add Arsenal Category",
    [ELSTRING(main,Name), "Common"],
    true,
    false,
    {},
    true
] call CBA_fnc_addSetting;

[
    QGVAR(enableZenContextActions),
    "CHECKBOX",
    [LSTRING(settingEnableZenContextActions_name), LSTRING(settingEnableZenContextActions_description)],
    [ELSTRING(main,Name), "Common"],
    true,
    true
] call CBA_fnc_addSetting;
