class CfgPatches {
	class purelife2_server_core {
		units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "purelife2_server_core.pbo";
        author = "Alexander 'Akryllax' Montero";
	};
};

class CfgFunctions {
	class Database {

		tag = "DB";

		class DatabaseCore {
			file = "\purelife2_server_core\src\database";
			class initialize {};
			class strip {};
			class async {};
		};

		class Queries {
			tag = "DBQ";
			file = "\purelife2_server_core\src\database\queries";
			class playerExists {};
			class createPlayer {};
			class createBuyOrder {};
			class createSellOrder {};
		};
	};

	class ServerMission {

		tag = "SV";

		class Ambiance {
			file = "\purelife2_server_core\src\ambiance";
			class triggerBlackout {};
		};

		class Core {
			file = "\purelife2_server_core\src\core";
			class serverPreinit {preInit = 1;};
			class serverPostinit {postInit = 1;};
		};

		class EventHandlers {
			file = "\purelife2_server_core\src\eventhandlers";
			class addServerEventHandlers {};
			class onClientConnect {};
			class onClientDisconnect {};
		};
	};
};