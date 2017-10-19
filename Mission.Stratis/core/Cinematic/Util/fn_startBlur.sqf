/*
 * 
 */

#define BLUR_AMOUT 9
#define DEFAULT_DELAY 0.2
 
private ["_variableWatch", "_negativeBoolean"];

_commitDelay	= [_this, 0, DEFAULT_DELAY, [1]] call BIS_fnc_param;

if(isNil "PP_dynamic") then {
	PP_dynamic = ppEffectCreate ["DynamicBlur",500];
};
PP_dynamic ppEffectEnable true;
PP_dynamic ppEffectAdjust [BLUR_AMOUT];
PP_dynamic ppEffectCommit _commitDelay;