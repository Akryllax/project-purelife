/*
    File: fn_clientDisconnect.sqf
    Author: Garrett
    Description:
        When a client disconnects this will remove their corpse, save position and alive or not
*/

private ["_alive", "_position", "_startTime", "_newConnectedPlayers", "_timeDiff"];
params ["_unit", "_id", "_uid", "_name"];
if (isNull _unit) exitWith {};
_alive = alive _unit;

//Save player info
_position = getPosATL _unit;
[_uid, _position] spawn Query_fnc_updatePlayerPosition;
// TO ADD - Update if player is alive or not in the database

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} forEach _containers;
deleteVehicle _unit;

// Get the connection time of the client
_newConnectedPlayers = [];
{
    if ((_x select 0) == _uid) then {
        _startTime = _x select 1;
    } else {
        _newConnectedPlayers pushBack _x;
    };
} forEach connectedPlayers;
connectedPlayers = _newConnectedPlayers;
_timeDiff = (time - _startTime) / 60;   // Convert Seconds to Minutes
[_uid, _timeDiff] spawn Query_fnc_updatePlaytime;

diag_log format ["Player Disconnected: %1", _uid];
diag_log format ["Connected: %1", connectedPlayers];
