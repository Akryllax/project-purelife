/*
	File: fn_weather.sqf
	Original Author: code34
	Edited By: Garrett 
	Description:
		Real Weather Script
*/

[] call client_fnc_clientWeather;

private ["_lastrain", "_rain", "_fog", "_mintime", "_maxtime", "_overcast", "_realtime", "_random","_startingdate", "_startingweather", "_timeforecast", "_daytimeratio", "_nighttimeratio", "_timesync", "_wind"];
	
// Real time vs fast time
// true: Real time is more realistic weather conditions change slowly (ideal for persistent game)
// false: fast time give more different weather conditions (ideal for non persistent game) 
_realtime = false;

// Random time before new forecast
// true: forecast happens bewteen mintime and maxtime
// false: forecast happens at mintime
_random = true;

// Min time seconds (real time) before a new weather forecast
_mintime = 600;

// Max time seconds (real time) before a new weather forecast
_maxtime = 1200;

// If Fastime is on
// Ratio 1 real time second for x game time seconds
// Default: 1 real second = 6 second in game
_daytimeratio = 6;
_nighttimeratio = 24;

// send sync data across the network each xxx seconds
// 60 real seconds by default is a good value
// shortest time do not improve weather sync
_timesync = 60;

// Mission starting date [year, month, day, hour, minutes]
_startingdate = [2018, 01, 01, 07, 00];

// Mission starting weather "CLEAR | CLOUDY | RAIN";
_startingweather = ["CLEAR", "CLOUDY", "RAIN"] call BIS_fnc_selectRandom;

setdate _startingdate;
switch (toUpper(_startingweather)) do {
	case "CLEAR": {
		wcweather = [0, 0, 0, [random 3, random 3, true], date];
	};
		
	case "CLOUDY": {
		wcweather = [0, 0, 0.6, [random 3, random 3, true], date];
	};
		
	case "RAIN": {
		wcweather = [1, 0, 1, [random 3, random 3, true], date];
	};

	default {
		// clear
		wcweather = [0, 0, 0, [random 3, random 3, true], date];
		diag_log "Real weather: wrong starting weather";
	};
};

// add handler
if (local player) then {
	wcweatherstart = true;
	"wcweather" addPublicVariableEventHandler {
		// first JIP synchronization
		if (wcweatherstart) then {
			wcweatherstart = false;
			skipTime -24;
			86400 setRain (wcweather select 0);
			86400 setfog (wcweather select 1);
			86400 setOvercast (wcweather select 2);
			skipTime 24;
			simulweatherSync;
			setwind (wcweather select 3);
			setdate (wcweather select 4);
		} else {
			wcweather = _this select 1;
			60 setRain (wcweather select 0);
			60 setfog (wcweather select 1);
			60 setOvercast (wcweather select 2);
			setwind (wcweather select 3);
			setdate (wcweather select 4);
		};
	};
};

// SERVER SIDE SCRIPT
if (!isServer) exitWith{};

// apply weather
skipTime -24;
86400 setRain (wcweather select 0);
86400 setfog (wcweather select 1);
86400 setOvercast (wcweather select 2);
skipTime 24;
simulweatherSync;
setwind (wcweather select 3);
setdate (wcweather select 4);

// sync server & client weather & time
[_realtime, _timesync, _daytimeratio, _nighttimeratio] spawn {
	private["_realtime", "_timesync", "_daytimeratio", "_nighttimeratio"];
		
	_realtime = _this select 0;
	_timesync = _this select 1;
	_daytimeratio = _this select 2;
	_nighttimeratio =  _this select 3;

	while { true } do {
		wcweather set [4, date];
		publicvariable "wcweather";
		if (!_realtime) then { 
			if ((date select 3 > 16) or (date select 3 <6)) then {
				setTimeMultiplier _nighttimeratio;
			} else {
				setTimeMultiplier _daytimeratio;
			};
		};
		sleep _timesync;
	};
};

_lastrain = 0;
_rain = 0;
_overcast = 0;

while {true} do {
	_overcast = random 1;
	if(_overcast > 0.70) then {
		_rain = random 1;
	} else {
		_rain = 0;
	};
	if ((date select 3 > 2) and (date select 3 <6)) then {
		if (random 1 > 0.75) then {
			_fog = 0.4 + (random 0.6);
		} else {
			_fog = 0.1 + (random 0.3);
		};
	} else {
		if ((_lastrain > 0.6) and (_rain < 0.2)) then {
			_fog = random 0.3;
		} else {
			_fog = 0;
		};
	};
	if (random 1 > 0.95) then {
		_wind = [random 7, random 7, true];
	} else {
		_wind = [random 3, random 3, true];
	};
	_lastrain = _rain;

	wcweather = [_rain, _fog, _overcast, _wind, date];
	60 setRain (wcweather select 0);
	60 setfog (wcweather select 1);
	60 setOvercast (wcweather select 2);
	setwind (wcweather select 3);
	if (_random) then {
		_timeforecast = _mintime + (random (_maxtime - _mintime));
	};
	sleep _timeforecast;
};