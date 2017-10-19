/*
 * File: fn_initializeAvatar.sqf
 * Author: Akryllax
 */

_unit = param [0,objNull,[objNull]];

[getPlayerUID player] call PL_fnc_requestUserData;