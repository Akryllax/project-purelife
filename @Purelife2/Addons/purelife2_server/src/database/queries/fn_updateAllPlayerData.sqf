/*
    File: fn_updateAllPlayerData.sqf
    Author: Garrett

    Description:
        Updates all the player's data in the database
*/

// Only the server runs this
if (!isServer) exitWith {};

// Setup the parameters
params ["_pid", "_cash", "_bank", "_creditBalance", "_creditLimit", "_civLicenses", "_copLicenses", "_medLicenses", "_civGear", "_copGear", "_medGear", "_activeGear", "_activeRole", "_stats", "_arrested", "_alive", "_position", "_playtime"];

// Run the query
[format ["updateAllPlayerData:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18", _cash, _bank, _creditBalance, _creditLimit, format ["""%1""", _civLicenses], format ["""%1""", _copLicenses], format ["""%1""", _medLicenses], _civGear, _copGear, _medGear, format ["""%1""", _activeGear], format ["""%1""", _activeRole], format ["""%1""", _stats], _arrested, _alive, _position, _playtime, _pid]] call extDB_fnc_async;
