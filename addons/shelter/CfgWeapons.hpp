class CfgWeapons {
    class ACE_ItemCore;

    class GVAR(tarp_Green): ACE_ItemCore {
        author = ECSTRING(main,author);
        scope = 2;
        displayName = CSTRING(tarp_green_displayName);
        descriptionShort = CSTRING(tarp_description);
        picture = QPATHTOEF(common,data\tt_tarp_green.paa);

        model = "\A3\Structures_F\Civ\Camping\Sleeping_bag_folded_F.p3d";
    };

    class GVAR(tarp_GreenCover): GVAR(tarp_Green) {
        displayName = CSTRING(tarp_greenCover_displayName);
        descriptionShort = CSTRING(tarp_greenCover_description);
    };

    class GVAR(tarp_Yellow): GVAR(tarp_Green) {
        displayName = CSTRING(tarp_yellow_displayName);
        descriptionShort = CSTRING(tarp_yellow_description);
        picture = QPATHTOEF(common,data\tt_tarp_yellow.paa);
    };

    class GVAR(tarp_Blue): GVAR(tarp_Green) {
        displayName = CSTRING(tarp_blue_displayName);
        descriptionShort = CSTRING(tarp_blue_description);
        picture = QPATHTOEF(common,data\tt_tarp_blue.paa);
    };
};
