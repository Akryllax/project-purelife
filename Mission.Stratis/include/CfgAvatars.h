#include "side.h"

class CfgAvatars {
	class Avatars {
		class AvatarBase {
			avatarID = -1;
			side = SIDE_ANY;
			displayName = "";
			iconDraw = "";
			objectClass = "";
			objectTextures[] = {};
			enableRandomization = 0;
			defaultOutfit[] = {};
			defaultPermisions[] = {};
		};

		class Civilian : AvatarBase {
			id = 1;
			side = SIDE_CIVILIAN;
			displayName = "Civilian";
			objectClass = "C_man_1";
		};

		class Police : AvatarBase {
			id = 2;
			side = SIDE_POLICE;
			displayName = "Police agent";
			objectClass = "C_man_1";
		};
	};
};