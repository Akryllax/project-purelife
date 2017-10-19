/*
    File: fn_strip.sqf
    Author: Garrett

    Description:
		Strips : from String
*/

private _string = (_this select 0);
private _array = toArray _string;
{
	if (_x == 58) then
	{
		_array set[_forEachIndex, -1];
	};
} foreach _array;
_array = _array - [-1];
_string = toString _array;
_string
