/*
    File: fn_getPlayerData.sqf
    Author: Garrett

    Description:
        Gets the player's data from the database
*/

// Only the server runs this
if (!isServer) exitWith {};

// Setup variables/parameters
private ["_result"];
params ["_pid", "_sender"];

// Call the query
_result = [format ["getPlayerData:%1", _pid], 2] call extDB_fnc_async;

// Return it to the player who asked for it
[_result] remoteExecCall ["Process_fnc_playerData", (owner _sender)];
