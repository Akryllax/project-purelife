/*
	File: fn_init_AVA.sqf
	Author: Akryllax
	Description: Local AVA init. Intended to be called once.
 */

if(isDedicated) exitWith {};

AVAEventQueue = [];
AVA_lastEvent = time;
//missionConfigFile >> "CfgAva"

[] spawn {
	waitUntil {time > 0};

	sleep 2;
	inAvaRange = true;
	//hint "AVA systems online";
	[] call PL_fnc_startAVASystems;
	[] call PL_fnc_clearNotificationStack;
	[] spawn PL_fnc_startAVAEventQueue;
};