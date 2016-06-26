/* sharedIsHQ script
Created: 09/09/2013
Author: Markus Davey
Skype: markus.davey
Desc: Tests whether the given object is an HQ.
Parameters: [Object]
Return: bool (True, is HQ / False, is not HQ)
*/
private ['_return', '_obj'];
_obj = _this select 0;
_return = false;

if (_obj == MV_Shared_WEST_HQ || _obj == MV_Shared_EAST_HQ) then {
	_return = true;
};

_return