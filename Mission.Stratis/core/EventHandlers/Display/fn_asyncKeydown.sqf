/*
 * File: fn_asyncKeydown.sqf
 * Author: Akryllax
 * Description: Processes the key action. Just add a 
 *
 * 'case DIK_KEY: {
 *		//code here
 *	}'
 *
 * For each key you want to process.
 */
#include "Keycodes.h"
disableSerialization;

//_ctrl = param [0, controlNull,[controlNull]];
_dikCode = param [1, -1, [-1]];
_shift = param [2, false, [false]];
_ctrlKey = param [3, false, [false]];
_alt = param [4, false, [false]];

switch (_dikCode) do {

	case DIK_F1: {
		hint "Working!";
	};

	case DIK_F2: {
		//Open the magic debug dialog.
		createDialog "RscDisplayDebugPublic";
	};

	case DIK_F3: {
		[] call PL_fnc_resetInterface;
		sleep 0.5;
		[] call PL_fnc_initInterface;
	};

	case DIK_F4: {
		//Recompile all functions. (blocking?)
		1 call BIS_fnc_recompile;	
	};

	case DIK_TAB: {
		[] call PL_fnc_togglePlayerMenu;
	};

	//Unregistered keys are just ignored	
	default {
	
	};
};