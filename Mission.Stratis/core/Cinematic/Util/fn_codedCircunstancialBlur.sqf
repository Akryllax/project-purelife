/*
 * 
 */

#define BLUR_AMOUT 9
#define DEFAULT_DELAY 0.2
 
private ["_variableName", "_commitDelay", "_negativeBoolean"];

AKR_stackedBlurs pushBack (_this spawn {
	_variableName	= [_this, 0, "", [""]] call BIS_fnc_param;
	_commitDelay	= [_this, 1, DEFAULT_DELAY, [1]] call BIS_fnc_param;
	_negativeBoolean = [_this, 2, false, [false]] call BIS_fnc_param;

	if(_variableName == "") exitWith { hint "Null var"; };
	if(isNil "PP_dynamic") then {
			PP_dynamic = ppEffectCreate ["DynamicBlur",500];
	};

	while {true} do {
		waitUntil {missionNamespace getVariable[_variableName, false]};
		PP_dynamic ppEffectEnable true;
		PP_dynamic ppEffectAdjust [BLUR_AMOUT];
		PP_dynamic ppEffectCommit _commitDelay;

		if!(_negativeBoolean) then {
			waitUntil{!(missionNamespace getVariable[_variableName, false])};
		} else {
			waitUntil{(missionNamespace getVariable[_variableName, false])};
		};
		
		PP_dynamic ppEffectAdjust [0];
		PP_dynamic ppEffectCommit _commitDelay;
	};
});