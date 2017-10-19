#include "TRACKS.inc"
#define DEFAULT_FADEIN 5

_fadeIn = [_this, 0, DEFAULT_FADEIN, [-1]] call BIS_fnc_param;

if(missionNamespace getVariable ["playingMusic", false]) exitWith {};

_fadeIn fadeMusic 1;
playingMusic = true;
currentTrack = musicTracks call BIS_fnc_randomIndex;

(musicTracks select currentTrack) call PL_fnc_songInfo;
playMusic ((musicTracks select currentTrack) select 0);
musicEH = addMusicEventHandler ["MusicStop", {
	currentTrack = currentTrack + 1;
	currentTrack = currentTrack % (count musicTracks);
	(musicTracks select currentTrack) call PL_fnc_songInfo;
	playMusic ((musicTracks select currentTrack) select 0);
}];