[
    QGVAR(addArsenalCategory),
    "CHECKBOX",
    [LSTRING(settingAddArsenalCategory_name), LSTRING(settingAddArsenalCategory_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    true
] call CBA_fnc_addSetting;

if ("zen_main" call CBA_fnc_isModLoaded) then {
    [
        QGVAR(enableZenContextActions),
        "CHECKBOX",
        [LSTRING(settingEnableZenContextActions_name), LSTRING(settingEnableZenContextActions_description)],
        [ELSTRING(main,Name), LSTRING(SubCategory)],
        false
    ] call CBA_fnc_addSetting;
};

