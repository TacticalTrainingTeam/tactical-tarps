[
    QGVAR(buildTime),
    "SLIDER",
    [ELSTRING(common,settingBuildTime_name), ELSTRING(common,settingBuildTime_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    [2, 60, 6, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(useAnimation),
    "CHECKBOX",
    [ELSTRING(common,settingUseAnimation_name), ELSTRING(common,settingUseAnimation_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(buildAnimation),
    "EDITBOX",
    [ELSTRING(common,settingBuildAnimation_name), ELSTRING(common,settingBuildAnimation_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    "Acts_carFixingWheel",
    true
] call CBA_fnc_addSetting;
