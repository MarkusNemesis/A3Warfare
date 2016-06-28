/* clientConInterfaceRuntime script
Created: 06/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs the construction interface.
Parameters: [buildObject (object)]
Return: N/A
*/

private ['_bObj', '_conCam'];
_bObj = _this select 0;

// -- Build the camera
MV_Con_ConCamera = [_bObj] call MV_Client_fnc_ConCreateCamera;

// -- Init Con Functions
[] call MV_Client_fnc_ConFunctions;

// -- Init Menus
[] call MV_Client_fnc_ConMenu;

// -- Init Event handlers
MV_Con_KeyDownEH = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call MV_Con_fnc_KeyDown;"];

// -- Init variables
MV_Con_SelectedItem = nil;
MV_Con_SelectedItemType = nil;
MV_Con_SelectedItemRotation = nil;
MV_Con_SelectedItem_DummyRoot = nil;

// -- Run the interface loop
waitUntil 
{
	private ['_lookPos'];
	_lookPos = screenToWorld [0.5, 0.5];
	// ---- Ensure a menu is displayed unless building
	if (commandingMenu == '' && isnil "MV_Con_SelectedItem") then
	{ // -- Default to main menu.
		if ([_bObj] call MV_Shared_fnc_IsHQ) then
		{ // -- If an HQ, display main HQ menu.
			if ([side player] call MV_Shared_fnc_IsHQDeployed) then {
				// -- If it's deployed, then show 'Deployed' main menu.
				showCommandingMenu "#USER:Con_HQ_Deployed";
			} else {
				// -- else show the 'Deploy' menu.
				showCommandingMenu "#USER:Con_HQ_Deploy";
			};
		} else {
			// -- If it's not an HQ, then it's a repair truck.
			// TODO create and display repair truck menu.
		};
	};
	
	// ---- Handle selected items
	if (!isnil "MV_Con_SelectedItem") then // ---- If we have a selected item
	{
		// -- Disable the commanding menu
		showCommandingMenu "";
		
		// -- Test the validity of the structure's placement.
		if (!isnil MV_Con_SelectedItem_DummyRoot) then {
			[_lookpos, _bObj] call MV_Con_fnc_ValidLocation;
		};
		
		if (!isNil "MV_Con_SelectedItem_DummyRoot") then
		{
			// -- Update current dummy object positions
			[_lookpos] call MV_Con_fnc_UpdateDummyObjects;
		} else {
		  // -- else, create the dummy objects
			[_lookpos] call MV_Con_fnc_CreateDummyObjects;
		};
	} else {
		if (!isnil "MV_Con_SelectedItem_DummyRoot") then
		{ // -- If we have no selection, but we have dummy objects, then delete the dummy objects
			[] call MV_Con_fnc_DeleteDummyObjects;
		};
	};
	
	// ---- Handle the Builder leaving the build radius of the buildObject
	if (player distance _bObj > 20) exitWith {[] call MV_Con_fnc_Exit;};
	
	// ---- Handle the Builder dying with the menu open
	if (!alive player) exitWith {[] call MV_Con_fnc_Exit;};
	
	// ---- Handle the Build Object being destroyed with the menu open
	if (!alive _bObj) exitWith {[] call MV_Con_fnc_Exit;};
	
	// -- Leave last
	isnil 'MV_Con_ConCamera'
};
showCommandingMenu "";// -- Clear the command menu
diag_log "MV: ConCam deleted";