[] spawn {
	_pid = 1;

	_result = ([format["checkPlayer:%1",1], 2] call DB_fnc_async);
	
	diag_log str _result;
}