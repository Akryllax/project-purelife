/*
	File: fn_ambience.sqf 
	Author: Garrett 
	Description:
		Deals with ambience in the mission
*/

private _flyByFrequency = 30 * 60;	// 30 minutes

private _flyBy = {
	private _rand = (floor random 2) + 1;
	private ["_startMark", "_endMark"];
	if (_rand == 1) then {
		_startMark = "flyby_1";
		_endMark = "flyby_2";
	} else {
		_startMark = "flyby_2";
		_endMark = "flyby_1";
	};

	[
		[getMarkerPos _startMark select 0, getMarkerPos _startMark select 1, 100],
		[getMarkerPos _endMark select 0, getMarkerPos _endMark select 1, 100],
		100, "FULL", "B_Plane_Fighter_01_F", WEST
	] call BIS_fnc_ambientFlyBy;
	
	sleep 1;
	
	[
		[getMarkerPos _startMark select 0, getMarkerPos _startMark select 1, 100],
		[getMarkerPos _endMark select 0, getMarkerPos _endMark select 1, 100],
		100, "FULL", "B_Plane_Fighter_01_F", WEST
	] call BIS_fnc_ambientFlyBy;
};


// Main Loop
while {true} do {
	private _lastFlyBy = time;

	if (time > _lastFlyBy + _flyByFrequency) then { [] spawn _flyBy; _lastFlyBy = time; };

	// Only run this every minute
	sleep 60;
};