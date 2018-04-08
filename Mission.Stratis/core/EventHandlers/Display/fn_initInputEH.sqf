[] spawn {
	waituntil {
		_mainKEH = ((findDisplay 46) displayAddEventHandler["KeyDown", PL_fnc_onKeyDown]);
		_mainKEH > 0
	};
};