_avatar = param [0, objNull, [objNull]];
_data = param [1, [], []];

if(isNull _avatar) exitWith {
	["Recieved NULL avatar"] call BIS_fnc_error; false
};

if(![_avatar] call PL_fnc_isAvatar) exitWith {
	["Recieved object is NOT an avatar"] call BIS_fnc_error; false
};

if(count _data == 0 ) exitWith {
	["Empty customization data"] call BIS_fnc_log;
};