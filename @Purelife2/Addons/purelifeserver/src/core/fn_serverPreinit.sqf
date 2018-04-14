/*
 * File: fn_serverPreinit.sqf
 * Author: Alexander 'Akryllax' Montero
 *
 * Description: 
 */

diag_log "Called "##__FILE__;

if(!isServer) exitWith { ["Error: executing server preInit in non-server"] call BIS_fnc_error; false};

["purelife2", "SQL_CUSTOM", "purelife2"] call DB_fnc_initialize;