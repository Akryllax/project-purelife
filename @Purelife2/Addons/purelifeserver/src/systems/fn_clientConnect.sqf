/*
    File: fn_clientConnect.sqf
    Author: Garrett
*/

// Stop server from running this
if (time == 0) exitWith {};

private ["_toPush", "_initFunction"];
params ["_dpID", "_uid", "_name", "_jip", "_owner"];

_toPush = [_uid, time];
connectedPlayers pushBack _toPush;

diag_log format ["Player Connected: %1", _uid];
diag_log format ["Connected: %1", connectedPlayers];

_initFunction = "
    if (isServer) exitWith {};
    private [""_timeStamp"", ""_setRating"", ""_getRating"", ""_addVal""];

    0 cutText[""Please wait while we set some things up for you..."", ""BLACK FADED""];
    0 cutFadeOut 9999999;

    _timeStamp = diag_tickTime;
    diag_log ""Setting up Tanoans: Revolution"";

    waitUntil { !isNull player && player == player; };
    diag_log ""Player Ready..."";

    setTerrainGrid 50;
    setViewDistance 2500;
    setObjectViewDistance 2500;

    player enableFatigue false;
    player enableStamina false;
    player setCustomAimCoef 0;
    _setRating = 999999;
    _getRating = rating player;
    _addVal = _setRating - _getRating;
    player addRating _addVal;

    0 cutText[""Waiting on the server to finish getting dressed..."", ""BLACK FADED""];
    0 cutFadeOut 9999999;

    waitUntil { !isNil ""serverReady""; };
    waitUntil { serverReady };
    diag_log ""Server Ready..."";

    diag_log ""Requesting Player's Data..."";
    [] call Process_fnc_requestData;

    waitUntil {!(isNull (findDisplay 46))};
    (findDisplay 46) displayAddEventHandler [""KeyDown"", ""_this call handle_fnc_keyHandler""];

    [] call misc_fnc_statusBar;

    [] spawn serverToClient_fnc_clientWeather;
";

// Have the client initialize
[[], compile _initFunction] remoteExec ["spawn", _owner];
