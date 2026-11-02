# Tactical Tarps

**Tactical Tarps** is a framework for laying out a tarp for various use cases — deploy an item from your inventory into a fully-fledged field station, then pack it up again when you're done, no trace left behind.

The project is entirely open-source and any contributions are welcome — see [Contributing](contributing.md).

!!! info "Requirements"
    Tactical Tarps requires the latest versions of [CBA_A3](https://github.com/CBATeam/CBA_A3/releases/latest) and [ACE3](https://github.com/acemod/ACE3).

## Addons

- [Common](common.md) explains the common framework used by all other addons
- [Scripting & API](scripting.md) is the reference for mission makers and scripters: the API function and the events
- [Drone](drone.md) marks drone landing spots and spawns a helper helipad object
- [Hazmat](hazmat.md) provides a contaminated-item drop-off flow with full/empty bag behavior
- [Medic](medic.md) creates a mobile treatment point and optional extra spawned assets
- [Repair](repair.md) marks a vehicle repair point with decorative tool props (black only)
- [Shelter](shelter.md) deploys an A-frame tent as a field shelter (A-frame tent, cloth canopy or boat cover)
- [Signal](signal.md) provides visual landing zone and range marking tarps

## Optional compatibility

[Common](common.md#zeus-enhanced-zen-integration-optional) adds "TT - Construct"/"TT - Remove"
entries to [Zeus Enhanced](https://github.com/zen-mod/ZEN)'s map context menu, letting a curator
build or remove any station instantly. This is fully optional and inert if ZEN isn't loaded.

## Getting started

- [Common](common.md) — the shared framework and settings used by every addon below
- [Scripting & API](scripting.md) — register your own tarp and react to its events
- [Contributing](contributing.md) — set up a dev environment and run the same checks CI does
- [License](license.md) — Tactical Tarps' dual-license structure
