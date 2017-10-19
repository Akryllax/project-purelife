AVAEventQueue = [];
AVA_lastEvent = time;
//missionConfigFile >> "CfgAva"

[] spawn {
	waitUntil {time > 0};

	sleep 2;
	inAvaRange = true;
	//hint "AVA systems online";
	[] call PL_fnc_startAVASystems;
};
