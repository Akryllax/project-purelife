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
			class AVASay {};
			class AVATowerTracker {};
			class clearNotificationStack {};
			class createNotificationStack {};
			class init_AVA {};
			class pauseAVAEventQueue {};
			class playEvent {};
			class startAVAEventQueue {};
			class startAVASystems {};
			class stopAVASystems {};
		};

		class Avatars {
			file = "core\Avatar";
			class initializeAvatar {};
			class isAvatar {};
			class onAvatarKilled {};
			class requestCustomizeAvatar {};
			class requestDestroyAllMyAvatars {};
			class requestDestroyAvatar {};
			class requestNewAvatar {};
			class requestTransferAvatar {};
		};

		class Data {
			file = "core\Data";
			class loadUserdata {};
			class requestUserData {};
		};

		class EventHandlers_Display {
			file = "core\EventHandlers\Display";
			class addDisplayEH {};
			class asyncKeydown {};
			class initInputEH { postInit = 1; };
			class onKeyDown {};
			class removeDisplayEH {};
		};
		
		class EventHandlers_Entity {
			file = "core\EventHandlers\Entity";
			class addEntityEH;
			class onAvatarKilled {};
			class onAvatarTransfered {};
			class onPlayerEnterVehicle {};
			class onPlayerExitVehicle {};
			class onPlayerKilled {};
			class onPlayerRespawned {};
		};

		class Interface {
			file = "core\Interface";
			class addHUDEventHandlers {};
			class addOverlay {};
			class closeDialog {};
			class initInterface {};
			class openDialog {};
			class releaseUISpace {};
			class removeOverlay {};
			class reserveUISpace {};
			class togglePlayerMenu {};
			class resetInterface {};
		};

		class Inventory {
			file = "core\Inventory";
			class addItem {};
			class createInventory {};
			class deleteInventory {};
			class duplicateInventory {};
			class initializeInventory {};
			class removeItem {};
			class setInventory {};
			class transferInventory {};
		};

		class Music
		{
			file = "core\Music";
			class playRandom {};
			class playSong {};
			class stopMusic {};
		};

		class Sound {
			file = "core\Sound";
			class say3DNetworked {};
		};

		class System {
			file = "core\System";
			class arrayInsertInto {};
			class await {};
			class initializeCommonVariables {};
			class requestDBData {};
			class requestServerSync {};
			class recieveDBData {};
			class loadProfileNamespaceData {};
			class saveProfileNamespaceData {};
			class getProfileValue {};
			class setProfileValue {};
			class recieveKVArrayData {};
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
			class createDeadCamera {};
			class createFixedCamera {};
			class circunstancialBlur {};
			class circunstancialMonochrome {};
			class deleteDeadCamera {};
			class deleteFixedCamera {};
			class findFixedCamera {};
			class startCinematic {};
			class stopCinematic {};
			class updateFixedCamera {};
		};
	};
};