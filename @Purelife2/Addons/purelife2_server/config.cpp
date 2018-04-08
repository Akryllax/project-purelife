class CfgPatches {
	class purelife2_server {
		units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "purelife2_server.pbo";
        author = "Alexander 'Akryllax' Montero";
	};
};

class CfgFunctions {
	class Database {

		tag = "DB";

		class DatabaseCore {
			file = "purelife2_server\src\database";
			class nigga {};
			class initialize {};
			class strip {};
			class async {};
		};

		class Queries {
			tag = "DBQ";
			file = "purelife2_server\src\database\queries";
			class playerExists {};
			class createPlayer {};
			class createBuyOrder {};
			class createSellOrder {};
		};
	};

	class ServerMission {

		tag = "SV";

		class Core {
			file = "\purelife2_server\src\core";
			class serverPreinit {preInit = 1;};
			class serverPostinit {postInit = 1;};
		};

		class EventHandlers {
			file = "\purelife2_server\src\eventhandlers";
			class addServerEventHandlers {};
			class onClientConnect {};
			class onClientDisconnect {};
		};
	};
};