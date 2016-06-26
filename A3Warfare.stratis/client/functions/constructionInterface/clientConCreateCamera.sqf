/* clientConCreateCamera script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Creates the camera for the construction interface.
The buildingObject is the object that has the ability to construct. ie, HQ, repair truck, etc.
Parameters: [buildingObject (object)]
Return: camera object
*/

private ['_camera', '_obj'];
_obj = _this select 0;

_camera = "camconstruct" camCreate [getPosATL player select 0, getPosATL player select 1, 20];
_camera camPrepareFov 0.900;
_camera camPrepareFocus [-1,-1];
_camera cameraEffect ["internal", "back"];
_camera camCommitPrepared 0;
cameraEffectEnableHUD true;
_camera setdir getDir player;
[_camera,-30,0] call BIS_fnc_setPitchBank;
_camera camConstuctionSetParams [getPosATL _obj, 100, 20]; // -- TODO replace 100 with the param value for base radius limit.

_camera