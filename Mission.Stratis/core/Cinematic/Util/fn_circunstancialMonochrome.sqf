/*
 * 
 */

 #define DEFAULT_DELAY 0.2
 
 _this spawn {
	private ["_variableName", "_commitDelay", "_negativeBoolean"];

	if(isNil "AKR_stackedMonochrome") then {
		AKR_stackedMonochrome = [];
	};

	AKR_stackedMonochrome pushBack (_this spawn {
		_variableName	= [_this, 0, "", ["", {}]] call BIS_fnc_param;
		_commitDelay	= [_this, 1, DEFAULT_DELAY, [1]] call BIS_fnc_param;
		_terminate		= [_this, 2, {false}, [{}]] call BIS_fnc_param;

		if(_variableName isEqualTo "") exitWith { hint "Null var"; };
		if(isNil "ppMonochrome") then {
				ppMonochrome = ppEffectCreate ["ColorCorrections", 1999];
		};

		switch (typeName _variableName) do {
			
			case "CODE": {
				while {true} do {
					waitUntil {[] call _variableName;};
					ppMonochrome ppEffectEnable true;
					ppMonochrome ppEffectAdjust [0.3, 0.5, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
					ppMonochrome ppEffectCommit _commitDelay;

					waitUntil {!([] call _variableName);};
					
					ppMonochrome ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1.0]];
					ppMonochrome ppEffectCommit _commitDelay;
				};
			};
			
			case "STRING": {
				_tempVar = (missionNamespace getVariable[_variableName, nil]);
				if(isNil "_tempVar") then {
					missionNamespace setVariable[_variableName, false];
				};
			
				while {true} do {
					waitUntil {missionNamespace getVariable[_variableName, false]};
					ppMonochrome ppEffectEnable true;
					ppMonochrome ppEffectAdjust [0.3, 0.5, 0, [1, 1, 1, 0], [1, 1, 1, 0.0], [1, 1, 1, 1.0]];
					ppMonochrome ppEffectCommit _commitDelay;

					waitUntil {!(missionNamespace getVariable[_variableName, false])};
					
					ppMonochrome ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 1], [1, 1, 1, 1.0]];
					ppMonochrome ppEffectCommit _commitDelay;
				};
			};
		};
	});
};