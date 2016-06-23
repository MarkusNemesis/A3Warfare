/* exportCollage script
Created: 18/06/2016
Author: Markus Davey
Skype: markus.davey
Desc: This script is used to export object collages in the VR map.
Grabs all entities within a specified radius of the zero point [0,0,0] and catalogues their position relative to the central point and their rotation.
Exports it to clipboard with the following format:
[[Classname, [relative position], [Rotation],[VectorDir],[VectorUp]]
Return: [[Classname, [relative position], [Rotation],[VectorDir],[VectorUp]],...]
*/

private ['_tmpObjs','_objects','_locs','_rotations', '_output'];
_output = [];
_tmpObjs = [0,0,0] nearObjects ["ALL",20];

{
	private ['_class', '_location','_rotation','_vDir','_vUp'];
	
	_class = typeOf _x;
	
	_location = getPosATL _x;
	
	_rotation = getDir _x;
	
	_vDir = vectorDir _x;
	
	_vUp = vectorUp _x;
	
	_output set [count _output, [_class, _location, _rotation, _vDir, _vUp]];
} foreach _tmpObjs;

copyToClipboard str _output;