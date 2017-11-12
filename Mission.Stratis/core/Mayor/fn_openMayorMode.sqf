if(!canSuspend) exitWith {
	["Error: Called __FILE__ in unscheduled."] call BIS_fnc_error;
	false
};

