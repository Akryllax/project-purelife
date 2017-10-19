/*
	File: init.sqf
	Author: Alexander 'Akryllax' Montero

	Description:
	Startpoint for the mission.
*/

if(!(isMultiplayer)) exitWith {
	_obj = "B_Soldier_F" createVehicle (getMarkerPos "respawn");
	selectPlayer _obj;
};

waitUntil{time > 0};

[] call PL_fnc_initInterface;
//waitUntil{ scriptDone ([player] spawn PL_fnc_initializeAvatar)};

//[] spawn PL_fnc_loginCinematic;
[player] call PL_fnc_addEntityEH;

[] spawn {
	waituntil {
		_mainKEH = ((findDisplay 46) displayAddEventHandler["KeyDown", PL_fnc_onKeyDown]);
		_mainKEH > 0
	};
};

currentlyTrackedVehicle = objNull;
currentlyTrackedVehicleEH = 0;

/*
ServerAuthorisation = false;
"ServerAuthorisation" addPublicVariableEventHandler {
	if(_this select 1) then {
		disableUserInput false;
	};
};

disableUserInput true;
[] spawn {
	waituntil{time > 0};
	sleep 10;

	if(!ServerAuthorisation) then {
		disableUserInput false;
		"end1" call BIS_fnc_endMission;
	};
};*/

player enableStamina false;
