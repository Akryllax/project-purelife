/*
	File: fn_await.sqf
	Author: Akryllax
	Description: Calls a given function or code and awaits a response. Has an
	optional timeout option for avoiding infinite network waiting.
*/

_flag = param[0, "",[""]];
_callback = param[1, {}, [{}, ""]];
_scheduled = param [2, false, [false]];
_timeout = param [3, 10, [-1]];

if(count _flag == 0) exitwith {
	["Empty await flag"] call BIS_fnc_error;
	false;
};

missionNamespace setVariable[_flag, nil];

if(!canSuspend) exitWith {
	["Called await from unscheduled stack"] call BIS_fnc_error;
	false
};

_oldFlag = missionnamespace getVariable[_flag, false];
_timestamp = time;
waituntil {
	!((missionnamespace getVariable[_flag, false]) isEqualTo _oldFlag) ||
	(_timestamp + _timeout < time)
};

if(_timestamp + _timeout < time) exitWith {
	[format["Await timed out with flag '%1'", _flag]] call BIS_fnc_error;
	false
};

//Execute the callback
switch (typeName _callback) do {
	case "STRING" : {
		if(_scheduled) then {
			[] spawn (missionNamespace getVariable[_callback, {}]);
		} else {
			[] call (missionNamespace getVariable[_callback, {}]);
		};
	};
	case "CODE" : {
		if(_scheduled) then {
			[] spawn (_callback);
		} else {
			[] call (_callback);
		};
	};
	default {};
};

true