/* serverSpawnStartingVehicles script
Created: 11/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: spawns all the vehicles that the round starts with. ie, HQs, Ambulances, trucks, etc.
Return: null
*/
diag_log "Attemping to spawn starting vehicles";
private ["_MidPoint", "_MinDistance", "_WestStartPos", "_EastStartPos"];
_MidPoint = [3000,3000,0]; // -- The location where the centre of the map is. For determining spown location. TODO -- make map dependent
_MinDistance = 2000; // -- Minimum distance between team starting positions -- TODO get from parameters

// -- Calc start positions
_WestStartPos = [_MidPoint, _MinDistance, false, [false, 1000]] call MV_Shared_fnc_getRandomPosition;
_EastStartPos = _WestStartPos;
while {(_WestStartPos distance _EastStartPos) < _MinDistance} do // -- Ensure that teams are at least the minimum distance apart.
{
	_EastStartPos = [_MidPoint, _MinDistance, false, [false, 1000]] call MV_Shared_fnc_getRandomPosition;
	diag_log "Searching...";
};
diag_log format ["West: %1 | East: %2.",_WestStartPos,_EastStartPos];
// -- Spawn each side -- TODO optimise this a bit, as it's a bit unmanagable.
{
	private ["_startPos", "_ambo", "_truck","_HQ_Class","_initCode","_lObj"];
	call compile format ["
	_lObj = (call M_S_fnc_GLV);
	_startPos = _%1StartPos;
	diag_log _startPos;
	_HQ_Class = (_lObj getVariable 'MV_Shared_CLASS_%1_HQ') select 0;
	_initCode = (_lObj getVariable 'MV_Shared_CLASS_%1_HQ') select 1;
	
	MV_Shared_%1_HQ = createVehicle [_HQ_Class, _startPos, [], 25, 'NONE'];
	[MV_Shared_%1_HQ,%1, 'HQ'] call MV_Server_fnc_HandleVehicleSpawn;
	MV_Shared_%1_HQ call _initCode;
	publicVariable 'MV_Shared_%1_HQ';
	
	_amboClass = (_lObj getVariable 'MV_Shared_CLASS_%1_AMBO');
	
	_ambo = createVehicle [_amboClass, ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 20] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd), [], 0, 'NONE'];
	[_ambo, %1, 'Ambo'] call MV_Server_fnc_HandleVehicleSpawn;
	_ambo setVectorDir ([getPosATL MV_Shared_%1_HQ, getPosATL _ambo] call BIS_fnc_vectorFromXToY);
	
	_truckClass = (_lObj getVariable 'MV_Shared_CLASS_%1_TRUCK');
	
	_truck = createVehicle [_truckClass, ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 20] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd), [], 50, 'NONE'];
	[_truck, %1, ''] call MV_Server_fnc_HandleVehicleSpawn;
	_truck setVectorDir ([getPosATL MV_Shared_%1_HQ, getPosATL _truck] call BIS_fnc_vectorFromXToY);
	
	
	", _x];
	
	// -- _ambo setPosATL ([([[random 2 - 1, random 2 - 1, 0] call BIS_fnc_unitVector, 50] call BIS_fnc_vectorMultiply), getPosATL MV_Shared_%1_HQ] call BIS_fnc_vectorAdd);
	diag_log format ["%1 Starting vehicles created",_x];
	/*
	_markerName ='Marker_%1_HQ';
	_markerName = createMarker [_markerName,_startPos];
	_markerName setMarkerShape 'ICON';
	_markerName setMarkerType 'mil_dot';
	_markerName setMarkerText _x;
	*/
	//call compile format ["_ambo = createVehicle [MV_Shared_CLASS_%1_AMBO, _startPos, [], 10, 'NONE']", _x];
} foreach ["EAST", "WEST"];