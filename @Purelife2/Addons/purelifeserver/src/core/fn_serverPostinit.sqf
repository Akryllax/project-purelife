diag_log "Called "##__FILE__;

if(!isServer) exitWith { ["Error: executing server postInit in non-server"] call BIS_fnc_error; false};

["PlayerConnet","onPlayerConnected", SV_fnc_onClientConnect] call BIS_fnc_addStackedEventHandler;
["PlayerDisconnect","onPlayerDisconnected", SV_fnc_onClientDisconnect] call BIS_fnc_addStackedEventHandler;