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

// -- Run the interface loop
waitUntil 
{
	private ['_lookPos'];
	_lookPos = screenToWorld [0.5, 0.5];
	// -- Ensure a menu is displayed unless building
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
		
		if (!isNil "MV_Con_SelectedItem_DummyObjects") then
		{ // -- Update current dummy object positions
			[_lookpos] call MV_Con_fnc_UpdateDummyObjects;
		} else {
		  // -- else, create the dummy objects
			[_lookpos] call MV_Con_fnc_CreateDummyObjects;
		};
	} else {
		if (!isnil "MV_Con_SelectedItem_DummyObjects") then
		{ // -- If we have no selection, but we have dummy objects, then delete the dummy objects
			[] call MV_Con_fnc_DeleteDummyObjects;
		};
	};
	
	// ----
	
	// -- Leave last
	isnil 'MV_Con_ConCamera'
};
showCommandingMenu "";// -- Clear the command menu
diag_log "MV: ConCam deleted";