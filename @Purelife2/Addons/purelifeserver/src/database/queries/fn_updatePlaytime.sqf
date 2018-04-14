/*
    File: fn_updatePlaytime.sqf
    Author: Garrett

    Description:
        Updates the player's playtime in the database
*/

// Only the server runs this
if (!isServer) exitWith {};

// Setup the parameters
params ["_pid", "_toAdd"];

// Run the query
[format ["updatePlaytime:%1:%2", _toAdd, _pid]] call extDB_fnc_async;
