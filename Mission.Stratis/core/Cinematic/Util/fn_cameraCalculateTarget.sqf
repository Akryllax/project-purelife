private ["_camera", "_dir", "_inclination", "_camPos", "_relPos", "_result"];

_camera = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_dir = [_this select 1, 0, 0, [-1]] call BIS_fnc_param;
_inclination = [_this select 1, 1, 0, [-1]] call BIS_fnc_param;

_camPos = getPos _camera;
_relPos = [sin(_dir), cos(_dir), _inclination];
_result = _camPos vectorAdd _relPos;
_result