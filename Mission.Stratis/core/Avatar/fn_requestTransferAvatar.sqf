_targetAvatar = param [0, objNull, [objNull]];
_originalID = param [1, -1, [-1]];
_newID = param [2, -1, [-1]];

if(isNull _targetAvatar) exitWith {
	["Target avatar object is NULL"] call BIS_fnc_error; false
};

if(_originalID < 1) exitWith {
	["Original ID doesn't exist"] call BIS_fnc_error; false
};

if(_newID < 1) exitWith {
	["Target ID doesn't exist"] call BIS_fnc_error; false
};