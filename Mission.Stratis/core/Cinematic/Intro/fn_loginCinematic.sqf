/*
	Author: Akryllax

	Description:
	Starts the introduction cutscene. This will cycles randomly through the defined spots (in "CAMERA_SPOTS.inc") and 
	play random tracks from CfgMusic.

	Parameter(s):
		NONE

	Returns:
		NONE
*/

#include "CAMERA_SPOTS.inc"

[] spawn PL_fnc_playRandom;

0 fadeSound 0.4;
_camIndex = 0;
introCamera = (_camPoints select _camIndex) call PL_fnc_createFixedCamera;
inIntro = true;

PP_login = ppEffectCreate ["DynamicBlur",499];

while {inIntro} do {
	_nextPoint = _camPoints select _camIndex;
	PP_login ppEffectEnable true;
	if(inLogin) then {
		PP_login ppEffectAdjust [10];
		PP_login ppEffectCommit 0.3;
	};
	sleep 0.3;
	[introCamera, _nextPoint select 0, _nextPoint select 1] call PL_fnc_updateFixedCamera;
	PP_login ppEffectEnable true;
	if(inLogin) then {
		PP_login ppEffectAdjust [0];
		PP_login ppEffectCommit 0.3;
	};
	_camIndex = (_camIndex + 1) % (count _camPoints);
	sleep 20;
};