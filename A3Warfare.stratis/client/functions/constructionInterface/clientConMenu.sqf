/* clientConMenu script
Created: 08/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises the menu functions. Holds the custom menus.
Custom menus can have script embedded in them. IE, "call compile 'script here etc'"; This can be used to customise the menu labels, their visibility, etc.
Parameters: N/A
Return: N/A
Notes:
MV_Con_SelectedItem = [class variable / string]; - Default ""
MV_Con_SelectedItemType = String - "BUILDING", "OTHER"

 // -- TODO -- Define building profiles in shared.
*/

// ------ Construction Menus

// ---- Deploy HQ
// TODO - Pull the dummy array and put it into a variable so I don't need to copy paste it for every single buildable object
Con_HQ_Deploy = [
["Menu",false],
	["Deploy HQ",[2],"",-5,[["expression","call compile 'MV_Con_SelectedItemType = 'BUILDING'; MV_Con_SelectedItem = [""];'"]],"1","1"]
];

Con_HQ_Deployed = [
["Menu",false],
	["Structures",		[1],		"",		-5,		[["expression", "hint 'WIP'"]],"1","1"],
	["Defenses",		[2],		"",		-5,		[["expression", "hint 'WIP'"]],"1","1"],
	["Fortifications",	[3],		"",		-5,		[["expression", "hint 'WIP'"]],"1","1"],
	["Strategic",		[4],		"",		-5,		[["expression", "hint 'WIP'"]],"1","1"]
];

// ------ Menu Functions



/*
CUSTOM_menu = [
["Menu",false],
	["Item 1",[2],"",-5,[["expression","hint 'Hello!'"]],"1","1"],
	["Item 2",[3],"",-5,[["expression","[] execVM 'myScript.sqf'"]],"1","0"]
];

call compile "_lbl = 'Deploy HQ'; if ([side player] call MV_Shared_fnc_IsHQDeployed) then {_lbl = 'Undeploy HQ'}; _lbl
*/