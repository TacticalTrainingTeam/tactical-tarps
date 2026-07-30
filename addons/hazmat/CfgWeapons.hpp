class CfgWeapons {
    class ACE_ItemCore;

    class GVAR(tarp_Hazmat): ACE_ItemCore {
        author = ECSTRING(main,author);
        scope = 2;
        displayName = CSTRING(tarp_hazmat_displayName);
        descriptionShort = CSTRING(tarp_description);
        picture = QPATHTOEF(common,data\tt_tarp_yellow.paa);

        model = "\a3\Props_F_Enoch\Military\Decontamination\HazmatBag_01_roll_F.p3d";
    };
};
