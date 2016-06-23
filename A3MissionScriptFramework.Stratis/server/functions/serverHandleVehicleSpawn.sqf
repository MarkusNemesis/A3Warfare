/* serverHandleVehicleSpawn script
Created: 04/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when a vehicle spawns. Adds the vehicle to the respective side's vehicle array.
Each vehicle entry follows this format: [VehNetID, Special]
Special is whether it's an Ambo, HQ, supply truck, etc. Is used for what marker type it should have.
TODO create an 'ondeathEH' to handle the changing of the icon and eventual removal of this vehicle from the array.
Return: N/A
*/

private ["_Vehicle", "_Side", "_Type"];
_Vehicle = _this select 0;
_Side = toUpper str(_this select 1);
_Type = _this select 2;

// Add to vehicle array
call compile format["MV_Netvar_%1VEHICLES set [count MV_Netvar_%1VEHICLES, [netId _Vehicle, _Type]];publicVariable 'MV_Netvar_%1VEHICLES';", _Side];

// Strip all contents of the vehicle
clearWeaponCargoGlobal _Vehicle;
clearMagazineCargoGlobal _Vehicle;