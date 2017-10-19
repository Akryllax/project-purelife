[] spawn {
	while {true} do {
		_closest = getMarkerPos (avaTowerPoints select 0);
		{
			if(((getMarkerPos _x) vectorDistance (getPos player)) < _closest vectorDistance (getPos player)) then {
				_closest = _x;
			};
		} forEach (avaTowerPoints);
	};
};