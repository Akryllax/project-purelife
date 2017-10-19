/*
 * 
 */

#define BLUR_AMOUT 9
#define DEFAULT_DELAY 0.2
 
 _this spawn {
	private ["_variableName", "_commitDelay", "_negativeBoolean"];

	if(isNil "AKR_stackedBlurs") then {
		AKR_stackedBlurs = [];
	};

	AKR_stackedBlurs pushBack (_this spawn {
		_variableName	= [_this, 0, "", ["", {}]] call BIS_fnc_param;
		_commitDelay	= [_this, 1, DEFAULT_DELAY, [1]] call BIS_fnc_param;
		_terminate		= [_this, 2, {false}, [{}]] call BIS_fnc_param;

		if(_variableName isEqualTo "") exitWith { hint "Null var"; };
		if(isNil "PP_dynamicConditional") then {
				PP_dynamicConditional = ppEffectCreate ["DynamicBlur",500];
		};

		switch (typeName _variableName) do {
			
			case "CODE": {
				while {true} do {
					waitUntil {[] call _variableName;};
					PP_dynamicConditional ppEffectEnable true;
					PP_dynamicConditional ppEffectAdjust [BLUR_AMOUT];
					PP_dynamicConditional ppEffectCommit _commitDelay;

					waitUntil {!([] call _variableName);};
					
					PP_dynamicConditional ppEffectAdjust [0];
					PP_dynamicConditional ppEffectCommit _commitDelay;
				};
			};
			
			case "STRING": {
				while {true} do {
					waitUntil {missionNamespace getVariable[_variableName, false]};
					PP_dynamicConditional ppEffectEnable true;
					PP_dynamicConditional ppEffectAdjust [BLUR_AMOUT];
					PP_dynamicConditional ppEffectCommit _commitDelay;

					waitUntil {!(missionNamespace getVariable[_variableName, false])};
					
					PP_dynamicConditional ppEffectAdjust [0];
					PP_dynamicConditional ppEffectCommit _commitDelay;
				};
			};
		
		};
	});
 };