/*
	File: fn_startAVASystems.sqf
	Author: Akryllax
	Description: Starts the AVA Systems. Do *not* confuse with an init. This 
	is called each time the AVA interface gets online (login, getting	into
	celltower range, after EMP, etc.).
 */

[] spawn {
	if(inAvaRange) then {
		avaOnline = true;
		playSound "WAVABootup_Music";
		sleep 5;
		["WAVASystemsOnline"] call PL_fnc_AVASay;	
		sleep 2;
	} else {
		avaOnline = false;
		["WAVAStartingSystems"] call PL_fnc_AVASay;
		sleep 1.5;
		playSound "WAVABootupError_Music";
		sleep 4.25;
		["WAVAYouhavelefttheAvaAssistantGrid"] call PL_fnc_AVASay;
		sleep 2.1;
		["WAVAShutingdown"] call PL_fnc_AVASay;
		sleep 1.5;
	};
};

[] spawn {
	while{true} do {
		if(avaOnline) then {
			if (triggerLowAmmoAva) then {
				triggerLowAmmoAva = false;

				["WLowAmmo"] call PL_fnc_AVASay;
			};
			sleep 0.5;
		} else {
			waitUntil {avaOnline};
		};
	};
};