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
	MV_Con_SelectedItemType = nil;
	MV_Con_SelectedItemRotation = nil;
	[] call MV_Con_fnc_DeleteDummyObjects; // -- Delete all dummy objects and nil variable
	// -- Remove event handlers
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", MV_Con_KeyDownEH];
};

// -- Create dummy objects
MV_Con_fnc_CreateDummyObjects = {
	private ['_lookPos', '_dummyRootClass'];
	_lookpos = _this select 0;
	MV_Con_SelectedItemRotation = 0;
	// If the selected item is a building, create the dummy root and the eventhandler to draw the lines
	if (MV_Con_SelectedItemType == 'BUILDING') then {
		MV_Con_SelectedItem_DummyRoot = createVehicle["Helper_Base_F",_lookpos,[],0,"CAN_COLLIDE"];
		// Define the 3D box size (10m would be a good start)
		// Create the onEachFrame eventhandler
		//	 Call the "Drawbox" function
		
	};
	
	// If it's anything else, the Dummy Root object is the selected object class itself
	if (MV_Con_SelectedItemType != 'BUILDING') then {
		_dummyRootClass = MV_Con_SelectedItem select 0;
		MV_Con_SelectedItem_DummyRoot = createVehicle[_dummyRootClass,_lookpos,[],0,"CAN_COLLIDE"];

	};
};

// -- Update Dummy Objects
MV_Con_fnc_UpdateDummyObjects = {
	private ["_lookpos"];
	_lookpos = _this select 0;
	MV_Con_SelectedItem_DummyRoot setPosATL _lookpos;
	MV_Con_SelectedItem_DummyRoot setDir MV_Con_SelectedItemRotation;
};

// -- Delete Dummy Objects
MV_Con_fnc_DeleteDummyObjects = {
	deleteVehicle MV_Con_SelectedItem_DummyRoot;
	// The Drawbox event handler will also need to be removed.
};

// -- Tests if the lookpos is a valid location of a structure.
// Params: [_lookpos, _bObj]
MV_Con_fnc_ValidLocation = {
	private ["_lookpos","_bObj","_size"];
	_lookpos = _this select 0;
	_bObj = _this select 1;
	
	// Check if the lookpos is within the base radius
	if ((_lookpos distance _bObj) > MV_Shared_Base_Radius_Limit) exitwith {
		_lookpos = [0,0,0]; // Make the build object "disappear" because it is out of bounds
	};
	
	// Check to see if the area is flat enough and not too steep for placement
	// Set the box size. TODO - Expand this out to a constant when it's a building?
	// TODO create a variable to set independent gradient maxes between BUILDINGs and OTHERs
	if (MV_Con_SelectedItemType == 'BUILDING') then {_size = 10;} else {_size = sizeof MV_Con_SelectedItem_DummyRoot;};
	_isFlat = _lookpos isFlatEmpty [
		_size / 8, 									//--- Minimal distance from another object
		0, 											//--- If 0, just check position. If >0, select new one
		4, 											//--- Max gradient
		_size, 										//--- Gradient area
		0, 											//--- 0 for restricted water, 2 for required water,
		false, 										//--- True if some water can be in 25m radius
		MV_Con_SelectedItem_DummyRoot 				//--- Ignored object
	];
	
};

// ------ Event handler functions
MV_Con_fnc_KeyDown = {
	private ['_key', '_shift', '_ctrl', '_alt'];
	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	diag_log _key;
	// -- exit
	if (_key == 1) then
	{
		[] call MV_Con_fnc_Exit;
	};
	// -- Rotate Minus 74
	if (_key == 74 && !isNil "MV_Con_SelectedItemRotation") then
	{
		private ["_dVal"];
		_dVal = 1;
		if {_shift} then {_dVal = 5};
		MV_Con_SelectedItemRotation = MV_Con_SelectedItemRotation - _dVal;
	};
	
	// -- Rotate Plus 78
	if (_key == 78 && !isNil "MV_Con_SelectedItemRotation") then
	{
		private ["_dVal"];
		_dVal = 1;
		if {_shift} then {_dVal = 5};
		MV_Con_SelectedItemRotation = MV_Con_SelectedItemRotation + _dVal;
	};
};