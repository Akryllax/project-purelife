_class = param [0, "", [""]];

if(_class == "") exitWith {};

_text = getText(missionConfigFile >> "CfgSounds" >> _class >> "text");
player say _class;
systemChat _text;