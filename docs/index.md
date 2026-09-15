# Tactical Tarps

**Tactical Tarps** is a framework for laying out a tarp for various use cases — deploy an item from your inventory into a fully-fledged field station, then pack it up again when you're done, no trace left behind.

The project is entirely open-source and any contributions are welcome — see [Contributing](contributing.md).

!!! info "Requirements"
    Tactical Tarps requires the latest versions of [CBA_A3](https://github.com/CBATeam/CBA_A3/releases/latest) and [ACE3](https://github.com/acemod/ACE3).

## Addons

- [Common](common/index.md) explains the common framework and API used by all other addons — start here if you're a mission maker or scripter
- [Drone](drone/index.md) marks drone landing spots and spawns a helper helipad object
- [Hazmat](hazmat/index.md) provides a contaminated-item drop-off flow with full/empty bag behavior
- [Medic](medic/index.md) creates a mobile treatment point and optional extra spawned assets
- [Repair](repair/index.md) marks a vehicle repair point with decorative tool props (black only)
- [Signal](signal/index.md) provides visual landing zone and range marking tarps

## Optional compatibility

[Common](common/index.md#zeus-enhanced-zen-integration-optional) adds "TT - Construct"/"TT - Remove"
entries to [Zeus Enhanced](https://github.com/zen-mod/ZEN)'s map context menu, letting a curator
build or remove any station instantly. This is fully optional and inert if ZEN isn't loaded.

## Getting started

- [Common](common/index.md) — the shared API, events, and settings used by every addon below
- [Contributing](contributing.md) — set up a dev environment and run the same checks CI does
- [License](license.md) — Tactical Tarps' dual-license structure
