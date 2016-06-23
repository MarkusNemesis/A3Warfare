/* exportCollage script
Created: 18/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: This script is used to import object collages into any map.
When passed a properly formatted export via clipboard, it will spawn in these objects, set their position relative to a central point and the attaches it to that object.
Return: Null
*/

private ['_spawnLoc','_objects','_locs','_rotations', '_input', '_dummy', '_direction'];
_input = [["B_MBT_01_TUSK_F",[-0.00107717,-0.0276159,-0.00320148],360,[-2.90368e-006,0.999916,0.0129259],[-0.00067848,-0.0129259,0.999916]],["Land_BarGate_F",[-0.369954,4.3756,0],0,[0,1,0],[0,0,1]],["Land_HBarrierWall6_F",[3.27887,-0.0560654,0],90,[1,-4.37114e-008,0],[0,0,1]],["Land_HBarrier_Big_F",[1.17028,-7.2729,0],0,[0,1,0],[0,0,1]],["Land_Cargo20_blue_F",[-4.43806,-0.803854,0],90,[1,-4.37114e-008,0],[0,0,1]],["Land_HBarrier_5_F",[-6.55786,-0.77267,0],90,[1,-4.37114e-008,0],[0,0,1]],["Land_JunkPile_F",[-4.47291,-0.742829,2.635],270.306,[-0.999986,0.00534915,0],[0,0,1]],["Logic",[9,9,9],0,[0,1,0],[0,0,1]],["CamoNet_BLUFOR_big_F",[-0.216,-2.229,0],176.652,[0.0584014,-0.998293,0],[0,0,1]]];
_spawnLoc = player modelToWorld [0,15,0];
_spawnLoc set [2,0];

hint str _spawnLoc;
_direction = (getDir player) - 180;

_dummy = createVehicle["b_survivor_F",_spawnLoc,[],0,"NONE"];
_dummy setDir _direction;
_dummy setVectorUp surfaceNormal _spawnLoc;
{
	private ['_class', '_location','_rotation','_vDir','_vUp', '_obj'];
	_class = _x select 0;
	_location = _dummy modelToWorld (_x select 1);
	_location = AGLtoASL _location;
	_rotation = (_x select 2) + _direction;
	_vDir = _x select 3;
	_vUp = _x select 4;
	
	diag_log format["Loc: %1 - %2",_location,_class];
	diag_log format["Dummy: %1 - %2",getPosASL _dummy,_class];
	
	_obj = createVehicle[_class,_location,[],0,"NONE"];
	_obj setPosASL _location;
	
	_obj setDir _rotation;
	
	_obj setVectorUp (VectorUp _dummy);
	
	_obj enableSimulation false;
	_obj allowdamage false;
} foreach _input;

deleteVehicle _dummy;

//[Classname, [relative position], [Rotation],[VectorDir],[VectorUp]