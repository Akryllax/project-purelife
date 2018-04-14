/*
 * File: fn_togglePlayerMenu.sqf
 * Author: Akryllax
 * Description: Toggle the player interface.
 */

if(isPlayerMenuShowing) then {
	isPlayerMenuShowing = false;
	showBlur = false;
} else {
	isPlayerMenuShowing = true;
	showBlur = true;
}