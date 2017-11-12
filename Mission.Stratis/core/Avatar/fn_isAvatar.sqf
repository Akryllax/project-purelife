_avatar = param [0, objNull, [objNull]];

if(isNull _avatar) exitWith {
	["Recieved NULL avatar"] call BIS_fnc_error; false
};

_return = (_avatar getvariable["isThisAvatar", false]);

_return