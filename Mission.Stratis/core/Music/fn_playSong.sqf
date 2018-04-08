#include "TRACKS.inc"
#define DEFAULT_FADEIN 5

_songIndex = param [0, 0, [-1]];
_fadeIn = param [1, DEFAULT_FADEIN, [-1]];

if(missionNamespace getVariable ["playingMusic", false]) exitWith {};

_fadeIn fadeMusic 1;
playingMusic = true;
currentTrack = _songIndex;

(musicTracks select currentTrack) call PL_fnc_songInfo;
playMusic ((musicTracks select currentTrack) select 0);
musicEH = addMusicEventHandler ["MusicStop", {
	currentTrack = currentTrack + 1;
	currentTrack = currentTrack % (count musicTracks);
	(musicTracks select currentTrack) call PL_fnc_songInfo;
	playMusic ((musicTracks select currentTrack) select 0);
}];