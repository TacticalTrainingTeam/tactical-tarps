class CfgWeapons {
    class EGVAR(shelter,tarp_Green);

    class EGVAR(shelter,tarp_GreenCover): EGVAR(shelter,tarp_Green) {
        displayName = CSTRING(tarp_greenCover_displayName);
        descriptionShort = CSTRING(tarp_greenCover_description);
    };

    class EGVAR(shelter,tarp_Yellow): EGVAR(shelter,tarp_Green) {
        displayName = CSTRING(tarp_yellow_displayName);
        descriptionShort = CSTRING(tarp_yellow_description);
        picture = QPATHTOEF(common,data\tt_tarp_yellow.paa);
    };

    class EGVAR(shelter,tarp_Blue): EGVAR(shelter,tarp_Green) {
        displayName = CSTRING(tarp_blue_displayName);
        descriptionShort = CSTRING(tarp_blue_description);
        picture = QPATHTOEF(common,data\tt_tarp_blue.paa);
    };
};
