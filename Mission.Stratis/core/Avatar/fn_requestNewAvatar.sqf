_avatarClass = param [0, "", [""]];
_position = param [1, getMarkerPos "respawn", [[]]];
_transferMode = param [2, true, [false]];

if(count _avatarClass == 0) exitWith {
	["Avatar class is empty"] call BIS_fnc_error; false
};

oldAvatarData = [];
if(_transferMode) then {
	oldAvatarData = avatar getVariable["avatarData", []];
};

[_avatarClass, _position, clientOwner] remoteExec ["SV _fnc_createAvatar", 2, false];

["avatar", {
	if(count oldAvatarData > 0) then {
		avatar setVariable["avatarData", oldAvatarData];
		oldAvatarData = nil;
	};
}] call PL_fnc_await;