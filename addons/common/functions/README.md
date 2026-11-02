# Functions

Generic "deployable tarp" framework shared by the drone, hazmat, medic and signal addons.

## Deploy / placement functions

The 3D ghost placement flow (`fnc_deployablePlace.sqf`, `fnc_deployableStartBuild.sqf`) is adapted from the
approach used by:

- [ACE3 `fortify`](https://github.com/acemod/ACE3/tree/master/addons/fortify) addon, particularly
  `fnc_deployObject.sqf` and `fnc_deployConfirm.sqf` - Licensed under GNU General Public License
- [grad-fortifications](https://github.com/gruppe-adler/grad-fortifications) - Licensed under GNU General Public License

Both place a local-only preview object that follows the caller's view each frame and is confirmed/cancelled
with the mouse, before spawning the real object at the confirmed position/orientation.
