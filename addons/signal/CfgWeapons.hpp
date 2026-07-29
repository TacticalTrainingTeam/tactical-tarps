class CfgWeapons {
    class ACE_ItemCore;

    class GVAR(tarp_Black): ACE_ItemCore {
        author = ECSTRING(main,author);
        scope = 2;
        displayName = CSTRING(tarp_black_displayName);
        descriptionShort = CSTRING(tarp_description);
        picture = QPATHTOEF(common,data\tt_tarp_black.paa);

        model = "\A3\Structures_F\Civ\Camping\Sleeping_bag_folded_F.p3d";
    };

    class GVAR(tarp_Green): GVAR(tarp_Black) {
        displayName = CSTRING(tarp_green_displayName);
        picture = QPATHTOEF(common,data\tt_tarp_green.paa);
    };

    class GVAR(tarp_Red): GVAR(tarp_Black) {
        displayName = CSTRING(tarp_red_displayName);
        picture = QPATHTOEF(common,data\tt_tarp_red.paa);
    };

    class GVAR(tarp_Yellow): GVAR(tarp_Black) {
        displayName = CSTRING(tarp_yellow_displayName);
        picture = QPATHTOEF(common,data\tt_tarp_yellow.paa);
    };
};
