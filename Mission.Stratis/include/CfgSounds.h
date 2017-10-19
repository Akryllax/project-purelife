class CfgSounds {

	class WLowAmmo
	{
		name = "WLowAmmo";
		sound[] = {"\sounds\voiceover\ava\WARNING_Low_ammo.ogg", 1, 1.0};
		text = "(Ava) Warning! Low ammo";
		titles[] = {"(Ava) Warning! Low ammo"};
	};

	class WAVAStartingSystems {
		name = "WAVAStartingSystems";
		sound[] = {"\sounds\voiceover\ava\Starting_up_system.ogg", 1, 1.0};
		text = "(Ava) Starting up systems...";
		titles[] = {"(Ava) Starting up systems..."};
	};

	class WAVA {
		name = "WLowAmmo";
		sound[] = {"\sounds\voiceover\ava\Starting_up_system.ogg", 1, 1.0};
		text = "(Ava) Starting up systems...";
		titles[] = {"(Ava) Starting up systems..."};
	};

	class WAVASystemsOnline
	{
		name = "WAVASystemsOnline";
		sound[] = {"sounds\voiceover\ava\All_Ava_Assistant_Grid_Systems_working._Welcome_ba.ogg", 1, 1.0};
		text = "(Ava) All AVA Assistant Grid Systems working. Welcome back!";
		titles[] = {"(Ava) All AVA Assistant Grid Systems working. Welcome back!"};
	};

	class WAVABootup_Music
	{
		name = "WAVABootup_Music";
		sound[] = {"sounds\sfx\ava_bootup.ogg", 1, 1.0};
		text = "BOOTING UP AVA (v0.1)";
		titles[] = {"BOOTING UP AVA (v0.1)"};
		duration = 5;
	};

	class WAVABootupError_Music
	{
		name = "WAVABootupError_Music";
		sound[] = {"sounds\sfx\ava_bootup_error.ogg", 1, 1.0};
		text = "BOOTING UP A$!-´#ERROR";
		titles[] = {"BOOTING UP A$!-´#ERROR"};
		duration = 4.45;
	};

	class WAVAYouhavelefttheAvaAssistantGrid {
		name = "WAVAYouhavelefttheAvaAssistantGrid";
		sound[] = {"sounds\voiceover\ava\You_have_left_the_Ava_Assistant_Gri.ogg", 1, 1.0};
		text = "(Ava) You have left the AVA Assistant Grid.";
		titles[] = {"(Ava) You have left the AVA Assistant Grid."};
		duration = 2;
	};

	class WAVAShutingdown {
		name = "WAVAShutingdown";
		sound[] = {"sounds\voiceover\ava\Shuting_dow.ogg", 1, 1.0};
		text = "(Ava) Shuting down...";
		titles[] = {"(Ava) Shuting down..."};
		duration = 1;		
	}
};