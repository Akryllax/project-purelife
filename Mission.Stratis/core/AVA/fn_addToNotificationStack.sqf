/*
1	File: fn_addToNotificationStack.sqf
	Author: Akryllax
	Description: Add an Event to the notifiation stack.
 */

_eventClassname =	param [0, "GenericEvent", [""]];
_eventValues =	param [1, [],[[]]];
_priority = 	param [2, -1, [-1]];

_returnElement = [_eventClassname, _eventValues, _priority];

if(_priority > 0 ) then {
	_inserted = false;
	{
		if((_x select 2) < _priority) exitWith {
			[AVA_eventQueue, _returnElement, _forEachIndex] call PL_fnc_arrayInsertInto;
			_inserted = true;
		};
	} forEach (AVA_eventQueue);

	if(!_inserted) then {
		AVA_eventQueue pushBack _returnElement;
		_inserted = true;
	}
} else {
	AVA_eventQueue pushBack _returnElement;
};

_returnElement