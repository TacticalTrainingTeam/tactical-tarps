#include "script_component.hpp"

class CfgPatches {
    class SUBADDON {
        // Use meta information from specified addon. Used to avoid repeated declarations.
        addonRootClass = QUOTE(ADDON);

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game. Note: was disabled on purpose some time late into Arma 2: OA.
        requiredVersion = REQUIRED_VERSION;
        // Required addons, used for setting load order. (CfgPatches classname NOT PBO filename!)
        // When any of the addons are missing, a pop-up warning will appear when launching the game.
        requiredAddons[] = {"tt_common", "A3_Structures_F_Exp_Commercial_Market", "A3_Props_F_Exp_Naval_Boats", "A3_Props_F_Exp_Military_Camps"};
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups) unlocking.
        units[] = {};
        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {
            QEGVAR(shelter,tarp_GreenCover),
            QEGVAR(shelter,tarp_Yellow),
            QEGVAR(shelter,tarp_Blue)
        };

        // If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt), so the shelter addon keeps working without Apex (Since Arma 3 2.14)
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
