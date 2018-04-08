/*
	In editor or whatever add a marker where you want the VR Room to spawn.
	Execute this code in local.
 */

[] spawn {
	VRBaseObject = "Land_VR_Block_04_F";

	deleter = [] spawn {
		{
			deleteVehicle _x;
		}
		forEach ((getMarkerPos "marker_0") nearObjects [VRBaseObject, 500]);
		deleteVehicle root;
	};
	waitUntil { 
		scriptDone deleter;
	};

	[] spawn {

		//How many tiles * 2 we want

		VRwidth = 15;
		VRheight = 3;
		VRdepth = 15;



		sizeScaleX = 10.35;
		sizeScaleY = 10.35;
		sizeScaleZ = 8.85;

		//Rotation (if you need it for some reason)

		VRRootVectorUp = [0,0,1];
		VRBaseObject = "Land_VR_Block_04_F";

		sleep 0.5;

		root = createVehicle ["ThingEffect", ((getMarkerPos "marker_0") vectorAdd [0,0,100]), [], 0, "CAN_COLLIDE"];
		root setVectorUp VRRootVectorUp;
		hint str root;

		VRbasePos = getPos root;

		spawnPoint = [VRbasePos select 0,VRbasePos select 1, sizeScaleZ * 2];

		for "_i" from -VRwidth to VRwidth do {
			for "_j" from -VRdepth to VRdepth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[_i*sizeScaleX,_j*sizeScaleY,0]];
			};
		};

		for "_j" from -VRheight to VRheight do {
			for "_i" from -VRwidth to VRwidth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[_i*sizeScaleX,(-VRdepth-1)*sizeScaleY,(_j + VRheight+1)*sizeScaleZ]];
			};
		};

		for "_j" from -VRheight to VRheight do {
			for "_i" from -VRwidth to VRwidth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[_i*sizeScaleX,(VRdepth+1)*sizeScaleY,(_j+VRheight+1)*sizeScaleZ]];
			};
		};

		for "_j" from -VRheight to VRheight do {
			for "_i" from -VRdepth to VRdepth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[(-VRwidth-1)*sizeScaleX,_i*sizeScaleY,(_j+VRheight+1)*sizeScaleZ]];
			};
		};

		for "_j" from -VRheight to VRheight do {
			for "_i" from -VRdepth to VRdepth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[(VRwidth+1)*sizeScaleX,_i*sizeScaleY,(_j+VRheight+1)*sizeScaleZ]];
			};
		};

		for "_i" from -VRwidth to VRwidth do {
			for "_j" from -VRdepth to VRdepth do {
				_obj = VRBaseObject createVehicle VRbasePos;
				_obj attachTo [root,[_i*sizeScaleX,_j*sizeScaleY,(VRheight+1)*sizeScaleZ*2]];
			};
		};

		player allowDamage false;
		player setPos (spawnPoint vectorAdd [0,0,100]);
	};
};