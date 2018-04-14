/*
	File: fn_async.sqf
	Author: Garrett

	Description:
	   Commits an asynchronous call to extDB

	Parameters:
		0: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		1: STRING (Query to be ran).
*/

private ["_queryStmt", "_mode"];

// Get parameters
_queryStmt = [_this, 0, "", [""]] call BIS_fnc_param;
_mode = [_this, 1, 1, [0]] call BIS_fnc_param;

// Get they custom ID for extDB3
private _key = "extDB3" callExtension format["%1:%2:%3",_mode, (call extDB_SQL_CUSTOM_ID), _queryStmt];
if(_mode isEqualTo 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

// Setup the loop
private _queryResult = "";
private _loop = true;
while{_loop} do
{
	_queryResult = "extDB3" callExtension format["4:%1", _key];
	if (_queryResult isEqualTo "[5]") then {
		// extDB3 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			private ["_pipe"];
			_pipe = "extDB3" callExtension format["5:%1", _key];
			if(_pipe isEqualTo "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if !(_queryResult isEqualTo "[3]") then { _loop = false; };
	};
};

_queryResult = call compile _queryResult;

diag_log format["Querry result: %1", _queryResult];

// Not needed, its SQF Code incase extDB3 ever returns error message i.e Database Connection Died
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Protocol Error: %1", _queryResult]; []};
private _return = (_queryResult select 1);
//_return = _return select 0;
_return
