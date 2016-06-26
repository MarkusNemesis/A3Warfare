/* serverSetCommander script
Function: MV_Server_fnc_SetCommander
Created: 26/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: Sets the passed side's commander as the passed player
Params: [side, player] call MV_Server_fnc_SetCommander
Return: NULL
*/
private ["_sLoc", "_side", "_player"];

// get the _sLoc
_sLoc = (call M_S_fnc_GLV);

// set side
_side = _this select 0;

// get Player slot name
_player = Call compile (_this select 1);

// Check if player is an actual player
if (!isPlayer _player) exitWith {diag_log format["ERROR: Attempted to set %1 commander to object %2", str _side, _player];};

// Set the _sLoc variable for the current side's commander.
switch (_side) do
{
	case west: {
		_sLoc setVariable ["MV_Commander_West",_player];
		MV_Commander_West = str _player;
		publicVariable "MV_Commander_West";
	};
	case east: {
		_sLoc setVariable ["MV_Commander_East",_player];
		MV_Commander_East = str _player;
		publicVariable "MV_Commander_East";
	};
};