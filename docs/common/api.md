# API Functions

## Public entry point

### `tt_common_fnc_deployableAddActions`

Registers ACE interactions for a deployable tarp implementation - best in `XEH_postInit.sqf`.

``` cpp
[_config] call tt_common_fnc_deployableAddActions;
```

Complete integration example:

``` cpp
private _config = createHashMapFromArray [
	["constructId", "my_addon_construct"],
	["deconstructId", "my_addon_deconstruct"],
	["tarpItems", [
		["my_addon_tarp_Black", "Tarp_01_Large_Black_F"],
		["my_addon_tarp_Green", "Tarp_01_Large_Green_F"]
	]],
	["inUseVar", "my_addon_inUse"],
	["buildTime", 10],
	["constructText", "Deploying tarp..."],
	["deconstructText", "Packing up tarp..."],
	["abortText", "Aborted"],
	["hintErrorNoSpace", "No space available"],
	["hintLoaded", "Tarp has been packed up"],

	// Optional
	["useAnimation", true],
	["animation", "Acts_carFixingWheel"],
	["onConstruct", {
		params ["_object", "_caller", "_config"];
	}],
	["onDeconstruct", {
		params ["_target", "_caller", "_config"];
	}]
];

[_config] call tt_common_fnc_deployableAddActions;
```

Required config keys:

| Key | Type | Description |
| - | - | - |
| `constructId` | `STRING` | Unique ACE action id for construct menu |
| `deconstructId` | `STRING` | Unique ACE action id for deconstruct action |
| `tarpItems` | `ARRAY` | `[[itemClass, objectClass], ...]` mapping |
| `inUseVar` | `STRING` | Object variable used as action lock |
| `buildTime` | `NUMBER` | Construct duration in seconds |
| `constructText` | `STRING` | Progress label for construct |
| `deconstructText` | `STRING` | Progress label for deconstruct |
| `abortText` | `STRING` | Abort hint text |
| `hintErrorNoSpace` | `STRING` | Hint shown if placement fails |
| `hintLoaded` | `STRING` | Hint shown after successful deconstruct |

Optional config keys:

| Key | Type | Description |
| - | - | - |
| `useAnimation` | `BOOLEAN` | Play animation during progress (`true` default) |
| `animation` | `STRING` | Animation class name |
| `onConstruct` | `CODE` | Callback `[_object, _caller, _config]` after spawn |
| `onDeconstruct` | `CODE` | Callback `[_target, _caller, _config]` before deletion |
