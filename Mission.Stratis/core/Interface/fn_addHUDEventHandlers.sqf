triggerLowAmmoAva = false;

player addEventHandler["Fired", {
	_curAmmo = parseNumber(((currentMagazineDetail player) splitString "(/)") select 1);
	_maxAmmo = getNumber(configFile >> "CfgMagazines" >> (currentMagazine player) >> "count");

	if(_curAmmo == 0) then {
		((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetTextColor [1,0,0,1];
		((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetText (str _curAmmo);
	} else {
		if(_curAmmo < _maxAmmo * 0.33) then {
			if(!hasLowAmmo) then {
				triggerLowAmmoAva = true;
			};
			hasLowAmmo = true;
			((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetTextColor [1,0.8,0,1];
			((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetText (str _curAmmo);
		} else {
			hasLowAmmo = false;
			((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetTextColor [1,1,1,1];
			((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetText (str _curAmmo);
		};
	};
}];

player addEventHandler["Reloaded", {
	_newMag = _this select 3;

	hasLowAmmo = false;

	_outStr = parseText format["%1", _newMag select 1];
	((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetTextColor [1,1,1,1];
	((uiNamespace getVariable "AmmoBadge") displayCtrl 15001) ctrlSetText (str _outStr);
}];