SV_input_queue_system = [
];

[] spawn {
	waituntil { count SV_input_queue_system > 0};
	_poped = SV_input_queue_system call BIS_fnc_arrayShift;
};