_avatarClass = param [0, "", [""]];
_position = param [1, [0,0,0], [[]]];
_callerID = param [2, -1, [-1]];

if(count _avatarClass == 0) exitWith {
	["Avatar class is empty"] call BIS_fnc_error; false
};

if(_callerID < 3) exitWith {
	["Error: Empty caller ID or Not A Client"] call BIS_fnc_error;
};

_avatarConfig = missionConfigFile >> "CfgAvatars" >> "Avatars" 
	>> _avatarClass;

_avatarObj = getText(_avatarConfig >> "objectClass") createVehicle _position;

{
	missionnamespace setvariable ["avatar", _avatarObj];
} remoteExec ["call", _callerID];