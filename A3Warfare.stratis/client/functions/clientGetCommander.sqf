/* clientGetCommander script
Function: MV_Client_fnc_GetCommander
Created: 26/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: Gets the commander slot object for the requested side.
Params: [side]
Return: The Commander Slot Object
*/

private ["_side","_commander"];

_side = _this select 0;
_commander = call compile format ["MV_Commander_%1",str _side];

_commander