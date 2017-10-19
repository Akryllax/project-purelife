#include "..\IDD.h"
#include "..\IDC.h"
#include "..\COLORS.h"

disableSerialization;

_control = _this select 0;
_display = (ctrlParent _control);

switch (ctrlIDC _control) do {
	case IDC_SELECTION_SCREEN_INVI_POLICE :
	{
		_outline = (_display displayCtrl IDC_SELECTION_SCREEN_OUTLINE_POLICE);
		_outline ctrlSetTextColor [COLOR_POLICE];
		_button = (_display displayCtrl IDC_SELECTION_SCREEN_BTN_POLICE);
		_button ctrlSetTextColor [COLOR_POLICE];
		/*_newPos = [];
		{
			_newPos pushBack (parseNumber _x);
		} forEach (getArray (missionConfigFile >> "SelectionScreen" >> ctrlClassName _button >> "inactiveDimension"));
		_button ctrlSetPosition _newPos;*/

		_outline ctrlCommit 0.5;
		_button ctrlCommit 0.5;
	};
	case IDC_SELECTION_SCREEN_INVI_CIVILIAN :
	{
		_outline = (_display displayCtrl IDC_SELECTION_SCREEN_OUTLINE_CIVILIAN);
		_outline ctrlSetTextColor [COLOR_CIVILIAN];
		_button = (_display displayCtrl IDC_SELECTION_SCREEN_BTN_CIVILIAN);
		_button ctrlSetTextColor [COLOR_CIVILIAN];
		/*_newPos = [];
		{
			_newPos pushBack (parseNumber _x);
		} forEach (getArray (missionConfigFile >> "SelectionScreen" >> ctrlClassName _button >> "inactiveDimension"));
		_button ctrlSetPosition _newPos;*/

		_outline ctrlCommit 0.5;
		_button ctrlCommit 0.5;
	};
	case IDC_SELECTION_SCREEN_INVI_MEDICAL :
	{
		_outline = (_display displayCtrl IDC_SELECTION_SCREEN_OUTLINE_MEDICAL);
		_outline ctrlSetTextColor [COLOR_MEDICAL];
		_button = (_display displayCtrl IDC_SELECTION_SCREEN_BTN_MEDICAL);
		_button ctrlSetTextColor [COLOR_MEDICAL];
		/*_newPos = [];
		{
			_newPos pushBack (parseNumber _x);
		} forEach (getArray (missionConfigFile >> "SelectionScreen" >> ctrlClassName _button >> "inactiveDimension"));
		_button ctrlSetPosition _newPos;*/

		_outline ctrlCommit 0.5;
		_button ctrlCommit 0.5;
	};
	default {
		_control ctrlSetTextColor [COLOR_MEDICAL];
		_control ctrlCommit 0.5;
	};
};