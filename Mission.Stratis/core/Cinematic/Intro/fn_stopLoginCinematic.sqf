inIntro = false;
{
	[_x select 0] call PL_fnc_deleteFixedCamera;
} forEach (FixedCameras);
FixedCameras = [];
[] spawn PL_fnc_stopMusic;
5 fadeSound 1;