/*
	File: fn_initializeCommonVariables.sqf
	Author: Akryllax
	Description: Declares public variables in mission namespace at start.
 */

///	Module:	UNKNOWN
/// Use:	UNKNOWN
currentlyTrackedVehicle = objNull;
currentlyTrackedVehicleEH = 0;

///	Module:	Cinematics
/// Use:	Track login cinematic state
inIntro = false;
inLogin = false;