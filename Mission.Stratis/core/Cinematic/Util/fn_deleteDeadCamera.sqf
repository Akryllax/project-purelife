private ["_cam", "_position", "_target", "_name"];

if(isNil "DeadCam") exitWith {};

deadBlur ppEffectAdjust [0];
deadBlur ppEffectCommit 0.1;
DeadCam cameraEffect ["terminate","back"];
camDestroy DeadCam;
showBN = false;
showCinemaBorder false;