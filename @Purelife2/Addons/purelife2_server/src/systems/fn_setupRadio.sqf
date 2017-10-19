/*
    File: fn_setupRadio.sqf
    Author: Garrett
    Description:
        Setup the radios to be used for the players
*/

private ["_copSideLabel", "_copSideColor", "_copSideID",
         "_civSideLabel", "_civSideColor", "_civSideID",
         "_medSideLabel", "_medSideColor", "_medSideID",
         "_copDispatchLabel", "_copDispatchColor", "_copDispatchID",
         "_copCommandLabel", "_copCommandColor", "_copCommandID"
        ];

// 1. Side channel for all cops
_copSideLabel = "All Police";
_copSideColor = [west] call BIS_fnc_sideColor;

// 2. Side channel for all civs
_civSideLabel = "Help Channel";
_civSideColor = [civilian] call BIS_fnc_sideColor;

// 3. Side channel for medics
_medSideLabel = "All Medics";
_medSideColor = [east] call BIS_fnc_sideColor;

// 4. Dispatch channel for cops
_copDispatchLabel = "Police Dispatch";
_copDispatchColor = [0, 0.8, 0, 1];

// 5. Command channel for cops
_copCommandLabel = "Police Command";
_copCommandColor = [0.85, 0.85, 0, 1];

_copSideID     = radioChannelCreate [_copSideColor,     _copSideLabel,     "%UNIT_NAME", [], true];
_civSideID     = radioChannelCreate [_civSideColor,     _civSideLabel,     "%UNIT_NAME", [], true];
_medSideID     = radioChannelCreate [_medSideColor,     _medSideLabel,     "%UNIT_NAME", [], true];
_copDispatchID = radioChannelCreate [_copDispatchColor, _copDispatchLabel, "%UNIT_NAME", [], true];
_copCommandID  = radioChannelCreate [_copCommandColor,  _copCommandLabel,  "%UNIT_NAME", [], true];

COP_CHANNELS = [_copSideID, _copDispatchID, _copCommandID];
CIV_CHANNELS = [_civSideID];
MED_CHANNELS = [_medSideID];

publicVariable "COP_CHANNELS";
publicVariable "CIV_CHANNELS";
publicVariable "MED_CHANNELS";
