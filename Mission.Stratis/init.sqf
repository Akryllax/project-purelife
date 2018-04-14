/*
	File: init.sqf
	Author: Alexander 'Akryllax' Montero

	Description:
	Startpoint for the mission.
*/


///// DEVELOPMENT /////
if(!(isMultiplayer)) exitWith {
	_obj = "B_Soldier_F" createVehicle (getMarkerPos "respawn");
	selectPlayer _obj;
};
///~~#DEVELOPMENT#~~///

[] call PL_fnc_initializeCommonVariables;
[] call PL_fnc_requestServerSync;

waitUntil{time > 0};

[] call PL_fnc_initInterface;
//waitUntil{ scriptDone ([player] spawn PL_fnc_initializeAvatar)};

//[] spawn PL_fnc_loginCinematic;
[player] call PL_fnc_addEntityEH;
["showBlur",0.2] call PL_fnc_circunstancialBlur;

player enableStamina false;

waituntil {!isNil "serverReady"};

[] spawn {
	waitUntil {!inIntro};
	[] call PL_fnc_init_AVA;
}