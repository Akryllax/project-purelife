onEachFrame {};
mapScanRadious = 20;
mapScanRender = false;

renderScalerH = 0.5;
renderScalerV = 2;
ScanGridscale = 5;

[] spawn {

	mapScanRender = false;
	sleep 1;
	mapScanRender = true;

	debugPlayerPos = getPos player;

	_mapScan = [] spawn {
		mapPoints = [];
		for "_i" from -ceil(mapScanRadious/2) to floor(mapScanRadious/2) do {
			for "_j" from -ceil(mapScanRadious/2) to floor(mapScanRadious/2) do {
				_deltaVector = [ScanGridscale,0,0] vectorMultiply _i;
				_deltaVector = _deltaVector vectorAdd ([0,ScanGridscale,0] vectorMultiply _j);
				_deltaVector set[2,0];

				_probePoint = (debugPlayerPos vectorAdd _deltaVector);
				_probePoint set [2, (AGLToASL(_probePoint) select 2)];
				_probePoint = _probePoint vectorDiff debugPlayerPos;

				mapPoints pushBack [_i,_j,_probePoint select 2];
			};
		};
	};

	waitUntil { scriptDone _mapScan; };

	onEachFrame {
		_playerPos = getPos player;
		_deltaPlayerPos = _playerPos vectorAdd [0,0,0.2];

		_tickTack = false;
		for "_i" from 0 to mapScanRadious do {
			for "_j" from 1 to (mapScanRadious-1) do {
				
				_p0 = mapPoints select (_i + (_j-1) * 100);
				_p1 = mapPoints select (_i + _j * 100);
				
				_xy0	= [_p0 select 0, _p0 select 1, 0] vectorMultiply renderScalerH;
				_xy1	= [_p1 select 0, _p1 select 1, 0] vectorMultiply renderScalerH;
				_z0		= [0,0,_p0 select 2] vectorMultiply renderScalerV;
				_z1		= [0,0,_p1 select 2] vectorMultiply renderScalerV;

				_p0 = _xy0 vectorAdd _z0;
				_p1 = _xy1 vectorAdd _z1;

				_finalP0 = _p0 vectorAdd (_deltaPlayerPos);
				_finalP1 = _p1 vectorAdd (_deltaPlayerPos);

				drawLine3D[_finalP0,_finalP1, [1,0,0,1]];
			};	
		};
	};
};