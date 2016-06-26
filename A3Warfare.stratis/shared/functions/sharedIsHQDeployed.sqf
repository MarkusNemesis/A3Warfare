/* sharedIsHQDeployed script
Created: 09/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Returns whether the HQ is deployed.
If the HQ is not a land vehicle, but the HQ is alive, then the HQ is deployed ELSE it's either dead or undeployed.
Parameters: [side]
Return: True - HQ is deployed / False - HQ is not deployed OR Dead.
*/

call compile format ["_return = false;
if (!(MV_Shared_%1_HQ isKindOf 'LandVehicle') && alive MV_Shared_%1_HQ) then 
{
	_return = true;
};

_return", _this select 0]