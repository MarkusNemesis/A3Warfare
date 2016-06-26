/* clientSpawnPlayer script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Spawns the player.
*/

private['_spawnPos', '_spawnObj'];

// -- Get available spawn objects -- TODO have a list of structures + the HQ, by order of distance. Select the closest one as respawn point. -- TODO display 'respawn dialog' for selecting respawn location (Would have to be outside of this function, as it'd call this function)

if (isnil 'MV_Netvar_SERVERINITCOMPLETE') exitWith {["MV_Client_fnc_SpawnPlayer", [], 1] call MV_Client_fnc_AddEvent};

switch (Client_PlayerSide) do
{
	case west: {
		_spawnObj = MV_Shared_WEST_HQ; // TODO - Get the HQ object via function that gets the HQ, as the HQ object will change when deployed.
	};
	case east: {
		_spawnObj = MV_Shared_EAST_HQ;
	};
};

if (!isnull _spawnObj) then {
	player setPosATL ([getPosATL _spawnObj, 50, false, [false, 1000]] call MV_Shared_fnc_getRandomPosition);
	//player setPosATL ((getPosATL _spawnObj) findEmptyPosition[50, 100]);
}
else
{
	["MV_Client_fnc_SpawnPlayer", [], 1] call MV_Client_fnc_AddEvent;
};
// Leave last --------- Set player as spawned.
Client_PlayerSpawned = true;