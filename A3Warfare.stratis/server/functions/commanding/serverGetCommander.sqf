/* serverGetCommander script
Function: MV_Server_fnc_GetCommander
Created: 26/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: Gets the current commander of the specified side
Params: [side] call MV_Server_fnc_GetCommander
Return: The current commander's slot name
*/
private ["_sLoc", "_side", "_return"];

// get the _sLoc
_sLoc = (call M_S_fnc_GLV);
// set side
_side = _this select 0;

// get the _sLoc variable for the current side's commander.
switch (_side) do
{
	case west: {
		_return = _sLoc getVariable "MV_Commander_West";
	};
	case east: {
		_return = _sLoc getVariable "MV_Commander_East";
	};
};

diag_log format["The current %1 commander is %2", str _side, _return];

_return