/* sharedGetHQ script
Function: MV_Shared_fnc_getHQ
Created: 26/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: Gets the HQ object and returns it.
Params: [side]
Return: HQ object
*/

private ["_side", "_HQ"];

_side = _this select 0;
_HQ = call compile format ["MV_Shared_%1_HQ", str _side];

_HQ