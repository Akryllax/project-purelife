/*
	Author: Akryllax

	Description:
	Initializes the display systems, mainly the UI and the Event Handlers.

	Parameter(s):
		NONE

	Returns:
		NONE
*/

disableSerialization;
MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];

//Create ammo interface
_outStr = parseText format["%1", player ammo (currentWeapon player)];
88 cutRsc ["AmmoBadge","PLAIN"];
((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetText (str _outStr);

//Low ammo overlay
hasLowAmmo = false;
weaponChanged = false;
avaHUDBaseVector = [0,0,0];
playerEyePos = ((ASLToAGL eyePos player));

lowammorunning = true;

currentlyVehicleDamaged = false;
currentlyvehicleHeavyDamaged = false;
triggerAVAVehicleDamage = false;
triggerAVAHeavyVehicleDamage = false;

["lowAmmoBadge", "onEachFrame", {
	switch(cameraview) do {
		case "INTERNAL":
		{
			playerEyePos = ((ASLToAGL eyePos player));
			_weaponDir = (player weaponDirection currentWeapon player);
			_vectorSide = (vectorDir player) vectorCrossProduct (vectorUp player);
			avaHUDBaseVector = (_weaponDir vectorAdd (_vectorSide vectorMultiply (-0.12))) vectorAdd ((_weaponDir) vectorMultiply -0.6);

			if(inAvaRange) then {
				if(hasLowAmmo) then {
					_lowAmmoVector = (playerEyePos vectorAdd (avaHUDBaseVector));
					drawIcon3D [MISSION_ROOT + "resources\hud\low_ammo_hud.paa", 
					if(parseNumber(((currentMagazineDetail player) splitString "(/)") select 1) == 0) then [
						{[1,0,0,1]},
						{[1,0.8,0,1]}
					], _lowAmmoVector, 10, 10, -5, "", 0, 0.025, "TahomaB"];
				};
				if(currentlyVehicleDamaged) then {
					_vehicleDamageVector = (playerEyePos) vectorAdd [0,0,-0.1];
					drawIcon3D [MISSION_ROOT + "resources\icons\ic_directions_car_white_24dp\web\ic_directions_car_white_24dp_2x.png", 
						if(currentlyvehicleHeavyDamaged) then [{[0.8,0.2,0.2,1]},{[1,0.8,0,1]}]
					, _vehicleDamageVector, 1.5, 1.5, 0, "LOW AMMO", 0, 0.025, "TahomaB"];
				};

				_playerHUDPos = avaHUDBaseVector vectorAdd (_vectorSide vectorMultiply 0.3);
				_playerHUDPos = playerEyePos vectorAdd (_playerHUDPos);
				drawIcon3D [MISSION_ROOT + "ui_concept_basic.paa", [1,1,1,1], _playerHUDPos, 15, 15, 5, "", 0, 0.025, "TahomaB"];
			};
		};
		case "EXTERNAL":
		{
			playerPos = getposatl player;
			playerEyePos = ((ASLToAGL eyePos player));
			_weaponDir = (player weaponDirection currentWeapon player);
			_eyeDir = (eyeDirection player);
			_vectorSide = (_eyeDir) vectorCrossProduct (vectorUp player);
			avaHUDBaseVector = (_eyeDir vectorMultiply -0.3);

			if(hasLowAmmo) then {
				_lowAmmoVector = (playerEyePos vectorAdd(_eyeDir vectorAdd (_vectorSide vectorMultiply -0.7)));
				drawIcon3D [MISSION_ROOT + "resources\hud\low_ammo_hud.paa", 
				if(parseNumber(((currentMagazineDetail player) splitString "(/)") select 1) == 0) then [
					{[1,0,0,1]},
					{[1,0.8,0,1]}
				], _lowAmmoVector, 10, 10, 0, "", 0, 0.025, "TahomaB"];
			};

			_playerHUDPos = (playerEyePos vectorAdd(_eyeDir vectorAdd (_vectorSide vectorMultiply 0.7)));
			_playerHUDPos = avaHUDBaseVector vectorAdd (_playerHUDPos);
			drawIcon3D [MISSION_ROOT + "ui_concept_basic.paa", [1,1,1,1], _playerHUDPos, 15, 15, 0, "", 0, 0.025, "TahomaB"];
		};

		case "GUNNER": 
		{
			playerEyePos = ((ASLToAGL eyePos player));
			_weaponDir = (player weaponDirection currentWeapon player);
			_vectorSide = (_weaponDir) vectorCrossProduct (vectorUp player);
			avaHUDBaseVector = (_weaponDir) vectorAdd ((_weaponDir) vectorMultiply 0.5);

			if(inAvaRange) then {
				if(hasLowAmmo) then {
					_lowAmmoVector = avaHUDBaseVector vectorAdd (_vectorSide vectorMultiply -0.3);
					_lowAmmoVector = playerEyePos vectorAdd _lowAmmoVector;
					drawIcon3D [MISSION_ROOT + "resources\hud\low_ammo_hud.paa", 
					if(parseNumber(((currentMagazineDetail player) splitString "(/)") select 1) == 0) then [
						{[1,0,0,1]},
						{[1,0.8,0,1]}
					], _lowAmmoVector, 10, 10, -3, "", 0, 0.025, "TahomaB"];
				};
				if(currentlyVehicleDamaged) then {
					_vehicleDamageVector = (playerEyePos) vectorAdd [0,0,-0.2];
					drawIcon3D [MISSION_ROOT + "resources\icons\ic_directions_car_white_24dp\web\ic_directions_car_white_24dp_2x.png", 
						if(currentlyvehicleHeavyDamaged) then [{[0.8,0.2,0.2,1]},{[1,0.8,0,1]}]
					, _vehicleDamageVector, 1.5, 1.5, 0, "LOW AMMO", 0, 0.025, "TahomaB"];
				};

				_playerHUDPos = avaHUDBaseVector vectorAdd (_vectorSide vectorMultiply 0.6);
				_playerHUDPos = playerEyePos vectorAdd (_playerHUDPos);
				drawIcon3D [MISSION_ROOT + "ui_concept_basic.paa", [1,1,1,1], _playerHUDPos, 15, 15, 3, "", 0, 0.025, "TahomaB"];
			};
		};
		default
		{

		};
	}
}] call BIS_fnc_addStackedEventHandler;

[] spawn {
	_oldWeapon = currentWeapon player;
	while {true} do {
		if(!(currentWeapon player isEqualTo _oldWeapon)) then {
			weaponChanged = true;
		};

		sleep 0.5;
	};
};

[] call PL_fnc_addHUDEventHandlers;