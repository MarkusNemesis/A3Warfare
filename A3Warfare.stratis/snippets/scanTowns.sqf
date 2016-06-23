allLocationTypes = ["NameCity","NameCityCapital", "NameVillage"];
_locations = nearestLocations [[worldsize /2,worldsize /2,0], allLocationTypes, 50000];
{
	_objects = nearestObjects [position _x, ["house"], 250];
	_oCount = count _objects;
	_size = (_oCount*4);
	if (_oCount > 40) then {
		if (_size > 250) then {_size = 250;};
		
		_text =  format ["%1 | size: %2 | Supply: %3",text _x, _oCount, (_oCount/2) - ((_oCount/2) % 10)];
		_marker = createMarker [format["%1-name",text _x], position _x];
		_marker setMarkerShape "ICON";
		_marker setMarkerType "hd_dot";
		_marker setMarkerText _text;
		
		_zone = createMarker [format["%1-zone",text _x], position _x];
		_zone setMarkerShape "ELLIPSE";
		_zone setMarkerAlpha 0.5;
		_zone setMarkerSize [_size,_size];
		_zone setMarkerColor "ColorGUER";

	};
} forEach _locations;