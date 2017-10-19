/*
 * 
 */

#define BLUR_AMOUT 9
#define DEFAULT_DELAY 0.2
 
private ["_variableWatch", "_negativeBoolean"];

_commitDelay	= [_this, 0, DEFAULT_DELAY, [1]] call BIS_fnc_param;

if(isNil "PP_dynamic") exitWith {};

PP_dynamic ppEffectAdjust [0];
PP_dynamic ppEffectCommit _commitDelay;
