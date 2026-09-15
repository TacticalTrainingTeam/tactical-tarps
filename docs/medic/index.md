# Medic Addon

The `medic` addon registers deployable medical tarps with optional spawned support items.

## What it adds

- Four deployable medical tarp variants.
- `ace_medical_isMedicalFacility` enabled on deployed tarp object.
- Optional spawn and cleanup of additional configured medical objects.

### Classnames

- `tt_medic_tarp_Black`
- `tt_medic_tarp_Red`
- `tt_medic_tarp_Green`
- `tt_medic_tarp_Yellow`

#### Example

``` cpp
player addItemToBackpack "tt_medic_tarp_Red";
player addItemToBackpack "tt_medic_tarp_Yellow";
player addItemToBackpack "tt_medic_tarp_Green";
```
