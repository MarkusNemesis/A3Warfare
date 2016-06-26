/* sharedInitFunctions script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. They are not restricted and can be called on both server and client.
*/

MV_Shared_fnc_initParams = Compilefinal preprocessFileLineNumbers "shared\functions\sharedInitParams.sqf";
MV_Shared_fnc_GetPlayers = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetPlayers.sqf";
MV_Shared_fnc_SetSuperAI = Compilefinal preprocessFileLineNumbers "shared\functions\sharedSetSuperAI.sqf";
MV_Shared_fnc_GetServerTimeInt = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetServerTimeInt.sqf";
MV_Shared_fnc_SendPublicMessage = Compilefinal preprocessFileLineNumbers "shared\functions\sharedSendPublicMessage.sqf";
MV_Shared_fnc_getRandomPosition = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetRandomPosition.sqf";
MV_Shared_fnc_isPlayerOnFoot = Compilefinal preprocessFileLineNumbers "shared\functions\sharedisPlayerOnFoot.sqf";
MV_Shared_fnc_isHQ = Compilefinal preprocessFileLineNumbers "shared\functions\sharedisHQ.sqf";
MV_Shared_fnc_isHQDeployed = Compilefinal preprocessFileLineNumbers "shared\functions\sharedisHQDeployed.sqf";
MV_Shared_fnc_getHQ = Compilefinal preprocessFileLineNumbers "shared\functions\sharedgetHQ.sqf";

// MV_Shared_fnc_ = Compilefinal preprocessFileLineNumbers "shared\functions\shared.sqf";