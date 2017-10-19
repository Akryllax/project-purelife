private ["_camName"];

_camName = [_this, 0, "", [""]] call BIS_fnc_param;

if(isNil "FixedCameras") exitWith { objNull };
if(_camName == "") exitWith { objNull };

_return = objNull;

{
	if(_camName in _x) exitWith {_return = _x select 1};
} forEach (FixedCameras);

_return