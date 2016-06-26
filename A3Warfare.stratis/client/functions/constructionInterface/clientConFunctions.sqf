/* clientConFunctions script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Creates all the key event handlers for the construction interface
Parameters: 
Return:
*/

// ------ Functions
// -- Exit construction menu
MV_Con_fnc_Exit = {
	// -- Tidy up everything to do with the interface.
	player cameraEffect ["terminate","back"]; camDestroy MV_Con_ConCamera;
	// -- Clean variables
	MV_Con_ConCamera = nil; // -- Nil the camera
	MV_Con_SelectedItem = nil; // -- Nil the selected item
	[] call MV_Con_fnc_DeleteDummyObjects; // -- Delete all dummy objects and nil variable
	// -- Remove event handlers
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", MV_Con_KeyDownEH];
};

// -- Create dummy objects
MV_Con_fnc_CreateDummyObjects = {
	private ['_lookPos'];
	_lookpos = _this select 0;
	MV_Con_SelectedItem_DummyObjects = [];
	{
		diag_log _x;
		private ['_tmpObj', '_pososet', '_diroset', '_pos'];
		_pososet = _x select 1;
		_diroset = _x select 2;
		_pos = [];
		{_pos set [_foreachIndex, _x + (_pososet select _foreachIndex)];} foreach _lookpos;
		_tmpObj = (_x select 0) createVehicleLocal _pos; // Create the object.
		_tmpObj setDir (_x select 2); // Set it's direction
		_tmpObj setVectorUp surfaceNormal _pos; // Set to the terrain's contours.
		_tmpObj disableCollisionWith player; // Disable it's collision with the player.
		//_tmpObj setObjectTexture [0,'#(argb,8,8,3)color(0,1,0,0.5)']; // -- Not supported by pretty much EVERYTHING. Thanks BIS
		MV_Con_SelectedItem_DummyObjects set [count MV_Con_SelectedItem_DummyObjects, _tmpObj];
	} foreach MV_Con_SelectedItem;
};

// -- Update Dummy Objects
MV_Con_fnc_UpdateDummyObjects = {
	{
		//diag_log format ["MV: clientConInterfaceRuntime: Updating dummy object position. %1 to lookpos %2" _x, _lookpos];
		private ['_sItemArray', '_pos'];
		_sItemArray = MV_Con_SelectedItem select _foreachIndex;
		_pos = [];
		{_pos set [_foreachIndex, _x + ((_sItemArray select 1) select _foreachIndex)];} foreach _lookpos;
		_x setPosATL _pos;
		_x setVectorUp surfaceNormal _pos;
	} foreach MV_Con_SelectedItem_DummyObjects;
};

// -- Delete Dummy Objects
MV_Con_fnc_DeleteDummyObjects = {
	{deleteVehicle _x;} foreach MV_Con_SelectedItem_DummyObjects; 
	MV_Con_SelectedItem_DummyObjects = nil;
};

// ------ Event handler functions
MV_Con_fnc_KeyDown = {
	private ['_key', '_shift', '_ctrl', '_alt'];
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	
	// -- exit
	//if (_key in actionKeys "MenuBack") then
	if (_key == 1) then
	{
		[] call MV_Con_fnc_Exit;
	};
	
	
};