/*
	File: fn_startAVAEventQueue.sqf
	Author: Akryllax
	Description: Start Notification queue daemon.
 */

if(!canSuspend) exitWith {
	["Error: This must be executes as scheduled"] call BIS_fnc_error;
	false
};

AVA_eventQueuePaused = false;

while {true} do {
	waitUntil { sleep 1; ((count AVA_eventQueue) > 0) && !AVA_eventQueuePaused};

	//[_eventClassname, _eventValues, _priority];
	_event = AVA_eventQueue deleteAt 0;
	_eventClass = missionConfigFile >> "CfgAVA" >> "Events" >> (_event select 0);

	switch (getText [_eventClass, "type"]) do {
		case "notification": {

		};

		case "ava_gui_notification": {

		};
		
		default {
			[format["Error: Unkown AVA Event class type. Params: '%1'", _event]] call BIS_fnc_error;
		};
	};

	sleep (_eventClass getNumber "duration");
	sleep 0.2;
};