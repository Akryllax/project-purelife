/*
 *	File: fn_PlayerExists.sqf
 *	Author: Alexander 'Akryllax' Montero
 *
 *	Description:
 */

// Only the server runs this
if (!isServer) exitWith {
	["Called from non-server"] call BIS_fnc_error; false
};

params ["_pid", "_sender"];

diag_log "Called "##__FILE__;

_result = [format ["playerExists:%1", _pid], 2] call DB_fnc_async;

// Return it to the player who asked for it
(str _result) remoteExecCall ["hint", (owner _sender)];
_result