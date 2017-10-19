disableSerialization;
_songData = _this;

{
	if(count _x == 0) then {
		_songData set[_forEachIndex, localize "STR_unknown"];
	};
} forEach (_songData);

_song = _songData select 1;
_author = _songData select 2;
_album = _songData select 3;

_outStr = parseText format["%4: %1<br/>%5: %2<br/>%6: %3", _song, _author, _album, localize "STR_song", localize "STR_artist", localize "STR_album"];
88 cutRsc ["MusicOverlay","PLAIN"];
((uiNamespace getVariable "MusicOverlay") displayCtrl 15201) ctrlSetStructuredText  _outStr; 