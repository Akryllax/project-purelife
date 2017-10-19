_steamID = param [0,"",[""]];
_ownerID = param [1,-99,[""]];

if(count _steamID == 0) exitWith {
	diag_log "Error: Empty SteamID input #$124";
};
/*
with profileNamespace do 
{
	_pathTo = [
		userDatabase,
		_steamID
	] call BIS_fnc_findNestedElement;

	_dataRow = (userDatabase select (_pathTo select 0)) select 1;
	missionNamespace setVariable ["userData", _dataRow];
};

_ownerID publicVariableClient "userData";
*/
missionNamespace setVariable ["userData", [_steamID, 10000]];
_ownerID publicVariableClient "userData";