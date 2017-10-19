avaTowerPoints = [];

_avaTowerSearch = true;
_counter = 1;
while {_avaTowerSearch} do {
	_markerName = format["ava_tower_point_%1", _counter];
	_markerPos = getMarkerPos _markerName;

	if(vectorMagnitude _markerPos != 0) then {
		avaTowerPoints pushBack _markerName;
	} else {
		_avaTowerSearch = false;
	};

	_counter = _counter + 1;
};

{
	"Land_Device_assembled_F" createVehicle (getMarkerPos _x);
} forEach (avaTowerPoints);

publicVariable "avaTowerPoints";