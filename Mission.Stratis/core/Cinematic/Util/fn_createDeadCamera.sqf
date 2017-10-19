private ["_cam", "_position", "_target", "_name"];

deadCamDone = false;

_this spawn {
	deadCamDone = false;
	_target = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

	if(!isNil "DeadCam") then {
		[] call PL_fnc_deleteDeadCamera;
	};

	[player, 1] call BIS_fnc_dirtEffect;


	_origPos = _target modelToWorld (_target selectionPosition "head");

	//Init
	deadBlur = ppEffectCreate ["DynamicBlur",300];
	
	90 cutRsc ["DeadMessage","PLAIN"];
	
	DeadCam = "camera" camCreate _origPos;
	DeadCam cameraEffect ["EXTERNAL", "BACK"];
	DeadCam camSetTarget _target;
	showBN = true;
	DeadCam camCommit 0;
	
	showCinemaBorder true;
	disableUserInput true;
	
	_position = getPos _target;
	_direction = -(getDir _target);
	_position = _position vectorAdd ([sin(_direction - 90), cos(_direction - 90), 1] vectorMultiply 10);
	DeadCam camSetPos _position;
	DeadCam camCommit 3;
	sleep 3;
	
	DeadCam camSetPos ((getPos DeadCam) vectorAdd [0,0,3]);
	DeadCam camCommit 5;
	sleep 4.9;
	
	//Second act
	deadBlur ppEffectEnable true;
	deadBlur ppEffectAdjust [3];
	deadBlur ppEffectCommit 10;
	_newtarget = (getPos _target) vectorAdd[0,0,5];
	_position = _position vectorAdd[0,0,3];
	DeadCam camSetTarget _position;
	DeadCam camSetPos _position;
	DeadCam camCommit 9;
	sleep 9;
	deadCamDone = true;
};