/*
    File: fn_insertPlayer.sqf
    Author: Garrett

    Description:
        Insert a new player into the database
*/

// Only the server runs this
if (!isServer) exitWith {};

// Setup the parameters
params ["_pid", "_name", "_cash", "_bank", "_creditBalance", "_creditLimit", "_position", "_civGear", "_copGear", "_medGear", "_activeGear", "_activeRole"];

// Call the query
[format ["insertPlayer:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12", _pid, _name, _cash, _bank, _creditBalance, _creditLimit, _position, _civGear, _copGear, _medGear, format ["""%1""", _activeGear], format ["""%1""", _activeRole]]] call extDB_fnc_async;
