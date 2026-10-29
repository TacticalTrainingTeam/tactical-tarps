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
};
