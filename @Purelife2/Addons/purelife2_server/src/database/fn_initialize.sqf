/*
    File: fn_initialize.sqf
    Author: Garrett

    Description:
        Initializes extDB3 to connect to the database
*/
private ["_database", "_return", "_protocol", "_protocol_options"];

_return = false;

_database = [_this, 0, "", [""]] call BIS_fnc_param;
_protocol = [_this, 1, "", [""]] call BIS_fnc_param;
_protocol_options = [_this, 2, "", [""]] call BIS_fnc_param;

if ( isNil {uiNamespace getVariable "extDB_SQL_CUSTOM_ID"}) then
{

	// extDB3 Version Check
	private _result = "extDB3" callExtension "9:VERSION";
	diag_log format ["extDB3: Version: %1", _result];
	if (_result == "") exitWith {diag_log "extDB3: Failed to Load Extension"; false};
	if ((parseNumber _result) < 1.026) exitWith {diag_log "Error: extDB3 version 1.026 or Higher Required";};

	// extDB3 Connect to Database
	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", _database]);
	if (_result select 0 isEqualTo 0) exitWith {diag_log format ["extDB3: Error Failed to Connect to Database: %1", _result]; false};
	diag_log format ["extDB3: Connected to Database [%1]", _database];

	private ["_random_number", "_extDB_SQL_CUSTOM_ID"];

	// Generate Randomized Protocol Name
	_random_number = round(random(999999));
	_extDB_SQL_CUSTOM_ID = str(_random_number);
	extDB_SQL_CUSTOM_ID = compileFinal _extDB_SQL_CUSTOM_ID;

	// extDB3 Load Protocol
	_result = call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:%2:%3:%4.ini", _database, _protocol, _extDB_SQL_CUSTOM_ID, _protocol_options]);
	if ((_result select 0) isEqualTo 0) exitWith {diag_log format ["extDB3: Error Database Setup: %1", _result]; false};

	diag_log format ["extDB3: Initalized %1 Protocol", _protocol];

	// extDB3 Lock
	"extDB3" callExtension "9:LOCK";
	diag_log "extDB3: Locked";

	// Save Randomized ID
	uiNamespace setVariable ["extDB_SQL_CUSTOM_ID", _extDB_SQL_CUSTOM_ID];
	serverReady = true;
	publicVariable "serverReady";
	_return = true;
}
else
{
	extDB_SQL_CUSTOM_ID = compileFinal str(uiNamespace getVariable "extDB_SQL_CUSTOM_ID");
	diag_log "extDB3: Already Setup";
	_return = true;
};

_return
