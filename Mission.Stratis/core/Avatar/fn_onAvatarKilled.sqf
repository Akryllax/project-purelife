_avatar = param [0, objNull, [objNull]];
_killer = param [1, objNull, [objNull]];

if(isNull _avatar) exitWith {
	["Avatar object is NULL"] call BIS_fnc_error; false
};

if(isNull _killer) exitWith {
	["Killer object is NULL"] call BIS_fnc_error; false
};