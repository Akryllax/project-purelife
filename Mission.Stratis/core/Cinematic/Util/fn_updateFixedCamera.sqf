private ["_cam", "_position", "_target", "_name"];

_camera = [_this, 0, objNull, [objNull, ""]] call BIS_fnc_param;
_position = [_this, 1, [], [[]]] call BIS_fnc_param;
_target = [_this, 2, [], [[]]] call BIS_fnc_param;

_camObj = objNull;
if((typeName _camera) != "OBJECT") then {
	_camObj = [_camera] call PL_fnc_findFixedCamera;
} else {
	_camObj = _camera;
};

if(isNull _camObj) exitWith {hint "Cam update error: Cam null"};

_camObj setPos _position;
_camObj camSetTarget ([_camObj, _target] call PL_fnc_cameraCalculateTarget);
showCinemaBorder false;
_camObj camCommit 0;
true