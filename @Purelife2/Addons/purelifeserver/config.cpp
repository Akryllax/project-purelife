class CfgPatches {
	class purelifeserver {
		units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "purelifeserver.pbo";
        author = "Alexander 'Akryllax' Montero";
	};
};

class CfgFunctions {

	class ServerMission {

		tag = "SV";

		class Core {
			file = "purelifeserver\src\core";
			class serverPreinit {preInit = 1;};
			class serverPostinit {postInit = 1;};
			class AVASay_Network;
		};

		class EventHandlers {
			file = "purelifeserver\src\eventhandlers";
			class addServerEventHandlers {};
			class onClientConnect {};
			class onClientDisconnect {};
		};
	};

	class Database {

		tag = "DB";

		class DatabaseCore {
			file = "purelifeserver\src\database";
			class initialize {};
			class strip {};
			class async {};
		};

		class Queries {
			tag = "DBQ";
			file = "purelifeserver\src\database\queries";
			class playerExists {};
			class createPlayer {};
			class createBuyOrder {};
			class createSellOrder {};
		};
	};
};