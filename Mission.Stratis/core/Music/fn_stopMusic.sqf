removeMusicEventHandler ["MusicStop", musicEH];
playingMusic = false;
10 fadeMusic 0;
sleep 10;

if(!(missionNamespace getVariable["playingMusic", false])) then {
	playMusic "";
};