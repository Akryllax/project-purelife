// Only the server runs this
if (!isServer) exitWith {
	["Called from non-server"] call BIS_fnc_error; false
};

diag_log "Called "##__FILE__;

params ["_pid", "_username", "_cash", "_bank"];

[format ["createPlayer:%1:%2", _pid, _username]] call extDB_fnc_async;
