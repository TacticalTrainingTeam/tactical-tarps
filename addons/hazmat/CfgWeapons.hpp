class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(tarp_empty): ACE_ItemCore {
        author = ECSTRING(main,author);
        scope = 2;
        displayName = CSTRING(tarp_empty_displayName);
        descriptionShort = CSTRING(tarp_empty_description);
        picture = QPATHTOEF(common,data\tt_tarp_yellow.paa);

        model = "\a3\Props_F_Enoch\Military\Decontamination\HazmatBag_01_roll_F.p3d";
    };
    class GVAR(tarp_full): GVAR(tarp_empty) {
        scope = 1;
        displayName = CSTRING(tarp_full_displayName);
        descriptionShort = CSTRING(tarp_full_description);

        model = "\a3\Props_F_Enoch\Military\Decontamination\HazmatBag_01_F.p3d";
        picture = QUOTE(\A3\EditorPreviews_F_Enoch\Data\CfgVehicles\HazmatBag_01_F.jpg);

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 12;
        };
    };
};
