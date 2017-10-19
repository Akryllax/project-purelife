_unit = param [0, objNull, [objNull]];

if(_unit isEqualTo objNull) exitWith {
	["Processing objNull #$123"] call BIS_fnc_error;
	false
};

currentlyVehicleDamaged = false;
currentlyvehicleHeavyDamaged = false;
triggerAVAVehicleDamage = false;
triggerAVAHeavyVehicleDamage = false;

_unit addEventHandler["Killed", PL_fnc_onPlayerKilled];
_unit addEventHandler["GetInMan", PL_fnc_onPlayerEnterVehicle];
_unit addEventHandler["GetOutMan", PL_fnc_onPlayerExitVehicle];