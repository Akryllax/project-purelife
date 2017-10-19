params [
	["_unit", objNull],
	["_position", ""],
	["_vehicle", objNull],
	["_turret", []]
];

if(!(currentlyTrackedVehicleEH isEqualTo 0)) then {
	 currentlyTrackedVehicle removeEventHandler["GetInMan", currentlyTrackedVehicleEH];
};

currentlyTrackedVehicle = _vehicle;

currentlyTrackedVehicleEH = currentlyTrackedVehicle addEventHandler["Damaged", {
	_unit = param [0, objNull, [objNull]];
	_damage = param [2, 0, [0]];

	if(damage _unit > 0.5) then {
		if(damage _unit > 0.2) then {
			
		};
	};
}];