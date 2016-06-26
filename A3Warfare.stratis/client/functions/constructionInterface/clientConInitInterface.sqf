/* clientConInitInterface script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Puts the player into the construction interface.
1. Validate player being near enough to con vehicle / building
	1.1. Get whether it's an HQ or repair truck etc
2. Spawn the runtime
Parameters: [buildObject (Object)]
Return:
*/

private ['_bObj'];
_bObj = _this select 0;

// -- Validate TODO

// -- Spawn the runtime
[_bObj] spawn MV_Client_fnc_ConInterfaceRuntime;
