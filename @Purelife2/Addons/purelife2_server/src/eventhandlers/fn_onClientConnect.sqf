params [
	_id,
	_uid,
	_name,
	_jip,
	_owner
];

_result = [_uid, _owner] call DBQ_fnc_playerExists;

if(_result) then {
	ServerAuthorisation = true;

	_owner remoteExecCall ["loadUserdata"];

	_owner publicVariableClient "ServerAuthorisation";
	ServerAuthorisation = false;
} else {
	[_uid,_name] call DBQ_fnc_createPlayer;
};