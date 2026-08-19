[
    QGVAR(additionalItems),
    "EDITBOX",
    [LSTRING(settingAdditionalItems_name), LSTRING(settingAdditionalItems_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    '["Land_Wrench_F","Land_Pliers_F","Land_Screwdriver_V1_F","Land_Gloves_F"]',
    true
] call CBA_fnc_addSetting;


[
    QGVAR(buildTime),
    "SLIDER",
    [LSTRING(settingBuildTime_name), LSTRING(settingBuildTime_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    [2, 60, 6, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(useAnimation),
    "CHECKBOX",
    [LSTRING(settingUseAnimation_name), LSTRING(settingUseAnimation_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    true,
    true
] call CBA_fnc_addSetting;

[
    QGVAR(buildAnimation),
    "EDITBOX",
    [LSTRING(settingBuildAnimation_name), LSTRING(settingBuildAnimation_description)],
    [ELSTRING(main,Name), LSTRING(SubCategory)],
    "Acts_carFixingWheel",
    true
] call CBA_fnc_addSetting;
