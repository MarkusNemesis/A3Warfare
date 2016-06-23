/* sharedGetRandomPosition script
Created: 11/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Gets a random position based off the passed parameters.
Params: Centre [PosATL], MinimumDist [Num], AllowWater [Bool], AllowNearTown [Array] (bool allow, num dist)
Return: Location
*/

private ["_Centre", "_AllowWater", "_MinDist", "_retry" , "_AllowNearTown", "_Return"];

_Centre = _this select 0;
_MinDist = _this select 1;
_AllowWater = _this select 2;
_AllowNearTown = _this select 3;

_retry = true;
while {_retry} do
{
	_retry = false;
	_return = [((random (_MinDist * 2)) - _MinDist) + (_Centre select 0), ((random (_MinDist * 2)) - _MinDist) + (_Centre select 1), 0];
	if (!_AllowWater) then {
		_retry = surfaceIsWater _return;
	};
	if (!(_AllowNearTown select 0)) then {
		private ["_nearLocations"];
		_nearLocations = nearestLocations [_return, ["name","nameCity", "nameVillage", "NameCityCapital"], _AllowNearTown select 1];
		if ((count _nearLocations) > 0) then {
			_retry = true; // -- Town is too close to location. Retry
		};
	};
};
diag_log _return;
_return