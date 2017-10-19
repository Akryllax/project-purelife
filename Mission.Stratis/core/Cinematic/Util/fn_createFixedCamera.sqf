private ["_cam", "_position", "_target", "_name"];

_position = [_this, 0, [], [[]]] call BIS_fnc_param;
_target = [_this, 1, [], [[]]] call BIS_fnc_param;
_name = [_this, 2, "", [""]] call BIS_fnc_param;

if(isNil "FixedCameras") then {
	FixedCameras = [];
};

if(_name == "") then {
	_name = "FixedCamera_" + str ((count FixedCameras) + 1);
};

_cam = "camera" camCreate _position;
_cam cameraEffect ["EXTERNAL", "BACK"];
_cam camSetTarget ([_cam, _target] call PL_fnc_cameraCalculateTarget);
showCinemaBorder false;
_cam camCommit 0;

FixedCameras pushBack [_name, _cam];
_name