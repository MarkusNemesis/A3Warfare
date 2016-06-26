/* sharedInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises variables that are shared between the client and server namespaces.
Stored in Client_LocObj/Server_LocObj to allow them to be write protected.
Get these variables via (_lObj getVariable "VarNameHere")
*/

private ["_runTime", "_i", '_lObj'];
_runTime =+ time;

if (isServer) then 
{
	_lObj = (call M_S_fnc_GLV);
} else {
	_lObj = (call M_C_fnc_GLV);
};

// Constants
_lObj setVariable ["PRIOR_RANGE", 8];

// Commanders
_lObj setVariable ["MV_Commander_West",objNull];
_lObj setVariable ["MV_Commander_East",objNull];
MV_Commander_West = objNull;
MV_Commander_East = objNull;

// Player slots
_lObj setVariable ["MV_Shared_PLAYERS_BLU", []];
_lObj setVariable ["MV_Shared_PLAYERS_OP", []];
_lObj setVariable ["MV_Shared_PLAYERS_IND", []];
_lObj setVariable ["MV_Shared_PLAYERS_CIV", []];

// -- player slots per side
_lObj setVariable ["BLU_PLAYERCOUNT", 10];
_lObj setVariable ["OP_PLAYERCOUNT", 0];
_lObj setVariable ["IND_PLAYERCOUNT", 0];
_lObj setVariable ["CIV_PLAYERCOUNT", 35];

// -- Define the HQ vehicles - [Class name,{initcode};]
_lObj setVariable ["MV_Shared_CLASS_EAST_HQ", ["B_APC_Tracked_01_CRV_F",{_this setObjectTextureGlobal[0,'A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_01_hexarid_co.paa'];_this setObjectTextureGlobal[1,'A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_01_hexarid_co.paa'];_this setObjectTextureGlobal[2,'A3\Armor_F_Beta\APC_Tracked_02\Data\apc_tracked_02_ext_01_hexarid_co.paa'];}]]; // 
_lObj setVariable ["MV_Shared_CLASS_WEST_HQ", ["B_APC_Tracked_01_CRV_F",{}]];

// -- Transport Trucks -- TODO convert these into arrays, and have the starting vehicles defined in another array. Reform 'spawn starting vehicles' script appropriately. ie all ambos is one array, all starting vehicles in another array, as class names.
_lObj setVariable ["MV_Shared_CLASS_WEST_TRUCK", "B_Truck_01_transport_F"];
_lObj setVariable ["MV_Shared_CLASS_EAST_TRUCK", "O_Truck_02_transport_F"];

// -- Ambulances
_lObj setVariable ["MV_Shared_CLASS_WEST_AMBO","B_Truck_01_medical_F"];
_lObj setVariable ["MV_Shared_CLASS_EAST_AMBO","O_Truck_02_medical_F"];

// _lObj setVariable ["",];

// leave last
_runTime = time - _runTime;
diag_log format ["MV: sharedConstants INIT: FINISHED, Time taken: %1", _runTime];