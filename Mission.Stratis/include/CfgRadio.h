#define AVAPATH \sounds\voiceover\ava
#define SYSTEMNAME Ava

class CfgRadio {
	sounds[] = {};
	class 911Notified
	{
		name = "911Notified";
		sound[] = {"\sounds\voiceover\ava9_1_1_notifie.mp3", db-100, 1.0};
		title = "(Ava) 911 notified";
	};

	class WLowAmmo
	{
		name = "WLowAmmo";
		sound[] = {"\sounds\voiceover\ava\WARNING_Low_ammo.mp3", db-100, 1.0};
		title = "(Ava) Warning! Low ammo";
	};

	class WAVASystemsOnline
	{
		name = "WAVASystemsOnline";
		sound[] = {"sounds\voiceover\ava\All_Ava_Assistant_Grid_Systems_working._Welcome_ba.ogg", db-100, 1.0};
		title = "(Ava) All AVA Assistant Grid Systems working. Welcome back!";
	};
};