/*
 * File: fn_onKeyDown.sqf
 * Author: Akryllax
 *
 * Description: This is a onKeyDown handler. It dispatches then
 * keydown action to a scheduled call, but allows to override
 * default behaviour if you include the DIK_CODE to the override
 * array.
 */
#include "Keycodes.h"

//_ctrl = param [0, controlNull,[controlNull]];
_dikCode = param [1, -1, [-1]];
_shift = param [2, false, [false]];
_ctrlKey = param [3, false, [false]];
_alt = param [4, false, [false]];

_handled = false;
_target = cursorTarget;

//Include here the keys whose default behaviuor is going to be modified.
_overrideKeys = 
[
	DIK_F1, DIK_F2, DIK_F3,DIK_F4,DIK_F5,DIK_F6,DIK_F7,DIK_F8,DIK_F9,DIK_F10,DIK_F11,DIK_F12,
	DIK_GRAVE, DIK_TAB
];

if(_dikCode in _overrideKeys) then {
	_handled = true;
};

_this spawn PL_fnc_asyncKeydown;

_handled