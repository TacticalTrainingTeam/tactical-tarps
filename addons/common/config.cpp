#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"tt_main", "ace_arsenal", "ace_interaction", "A3_Props_F_Enoch_Military_Decontamination"};
        author = ECSTRING(main,author);
        authors[] = {"Andx", "EinStein", "Freddy Bacon", "Menom"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgZenContext.hpp"
