class CfgFunctions
{
	class KillzoneKid {
		/* KillzoneKid, we love you */
		tag = "KK";
		class ServerTransfer {
			class redirectClientToServer {
				file = "server\system\fn_redirectClientToServer.sqf";
			};
		};
	};

	class Purelife {
		tag = "PL";

		class AVA {
			file="core\AVA";
			class init_AVA {
				postInit = 1;
			};
			class startAVASystems {};
			class AVASay {};
		};

		class Avatars {
			file = "core\Player";
			class createAvatar {};
			class destroyAvatar {};
			class initializeAvatar {};
			class initPlayerSystems {};
			class transferAvatar {};
		};

		class Data {
			file = "core\Data";
			class loadUserdata {};
			class requestUserData {};
		};
		
		class EntityEventHandlers {
			file = "core\EventHandlers\Entity";
			class addEntityEH;
			class onPlayerEnterVehicle {};
			class onPlayerExitVehicle {};
			class onPlayerKilled {};
			class onPlayerRespawned {};
		};

		class Interface {
			file = "core\Interface";
			class initInterface {};
			class addHUDEventHandlers {};
			class resetInterface {};
		};

		class KeyboardEventHandlers {
			file = "core\EventHandlers\Keyboard";
			class asyncKeydown {};
			class initInputEH { postInit = 1; };
			class onKeyDown {};
		};

		class Music
		{
			file = "core\Music";
			class playRandom {};
			class playSong {};
			class stopMusic {};
		};

		class UIFunctions {
			file = "dialog\functions";
			class songInfo {};
			class diag_Selection_overlay_enter {};
			class diag_Selection_overlay_exit {};
			class diag_Selection_overlay_init {};
		};
	};
	class Purelife_Server {
		tag = "SV";
		class Avatars {
			file = "server\avatars";
			class copyAvatar {};
			class createAvatar {};
			class createTempAvatar {};
			class destroyAvatar {};
			class initAvatarSystems {};
			class transferAvatar {};
		};
	};

	class Cinematics
	{
		tag = "PL";
		
		class Intro
		{
			file = "core\Cinematic\Intro";
			class loginCinematic {};
			class stopLoginCinematic {};
		};
		
		class Util 
		{
			file = "core\Cinematic\Util";
			
			class cameraCalculateTarget {};
			class conditionalBlur {};
			class circunstancialBlur {};
			class circunstancialMonochrome {};
			class createDeadCamera {};
			class createFixedCamera {};
			class deleteDeadCamera {};
			class deleteFixedCamera {};
			class endBlur {};
			class findFixedCamera {};
			class killAllCircunstancialBlurs {};
			class startBLur {};
			class updateFixedCamera {};
		};
	};
};