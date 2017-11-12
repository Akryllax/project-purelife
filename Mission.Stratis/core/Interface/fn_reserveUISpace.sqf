/*
	Author: Alexander 'Akryllax' Montero

	Description:
		Blocks any attempt to create any other dialogs	until 
		UIReserve it is explicitely released.
 */

_uiReserveID = param [0, "",[""]];
_override = param[1,false, [false]];


if((count UIReserve > 0) && (!_override)) exitWith {
	[format["Called __FILE__ when UIReserve is blocked with params: '%1'", str _this]] call BIS_fnc_error;
};