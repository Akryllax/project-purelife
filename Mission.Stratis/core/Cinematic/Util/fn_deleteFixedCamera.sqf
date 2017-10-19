private ["_cam", "_position", "_target", "_name"];

_camera = [_this, 0, objNull, [objNull, ""]] call BIS_fnc_param;

_camObj = objNull;
if((typeName _camera) != "OBJECT") then {
	_camObj = [_camera] call PL_fnc_findFixedCamera;
} else {
	_camObj = _camera;
};

if(isNull _camObj) exitWith {hint "Null camera"};

_camObj cameraEffect ["terminate","back"];
camDestroy _camObj;