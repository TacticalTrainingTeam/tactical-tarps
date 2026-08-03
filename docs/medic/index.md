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

## Example

![Example Image of a casualty collection point that utilizes a tarp to provide clean working environment.](https://images.steamusercontent.com/ugc/11250171387506947872/4CFC381B9AF79D048D2293677A76AE6971549F29/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false)
