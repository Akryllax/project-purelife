/*
    File: fn_updatePlayerGear.sqf
    Author: Garrett

    Description:
        Updates the player's gear in the database
*/

// Only the server runs this
if (!isServer) exitWith {};

// Setup the parameters
params ["_pid", "_civGear", "_copGear", "_medGear", "_activeGear"];

// Run the query
[format ["updatePlayerGear:%1:%2:%3:%4:%5", _civGear, _copGear, _medGear, format ["""%1""", _activeGear], _pid]] call extDB_fnc_async;
