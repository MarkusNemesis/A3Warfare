/* sharedisPlayerOnFoot script
Function: MV_Shared_fnc_isPlayerOnFoot
Created: 29/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Returns TRUE if the passed object is a player, and iskindof 'man' (Thus, not in a vehicle).
Params: [_obj]
Return: true/false is player on foot.
*/

private ['_Obj', '_return'];
_obj = _this select 0;
_return = false;
if (isplayer _obj && _obj isKindOf "Man") then {_return = true;};

_return