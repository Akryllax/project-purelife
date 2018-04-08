/*
	File: fn_generateEvent.sqf
	Author: Akryllax
	Description: Generates an event from the given class and optional params.

	Returns:
		ARRAY - [config]
*/

_eventClass = param[0,"",["", configNull]];
_priority = param[1, -1,[-1]];
_name = param[2,"",[""]];
_values = param[3,[],[[]]];

_result = [];
