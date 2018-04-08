PL_synchroArray = [];

[] spawn {
	while {true} do {
		waitUntil { sleep 0.5; (count PL_synchroArray) > 0;};
		
	};
};