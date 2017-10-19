#include "..\IDD.h"
#include "..\IDC.h"

disableSerialization;

_display = _this select 0;

_policeOverlay = _display displayCtrl IDC_SELECTION_SCREEN_INVI_POLICE;
_civOverlay = _display displayCtrl IDC_SELECTION_SCREEN_INVI_CIVILIAN;
_medOverlay = _display displayCtrl IDC_SELECTION_SCREEN_INVI_MEDICAL;

_policeOverlay ctrlAddEventHandler ["MouseEnter", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_enter"];
_civOverlay ctrlAddEventHandler ["MouseEnter", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_enter"];
_medOverlay ctrlAddEventHandler ["MouseEnter", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_enter"];

_policeOverlay ctrlAddEventHandler ["MouseExit", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_exit"];
_civOverlay ctrlAddEventHandler ["MouseExit", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_exit"];
_medOverlay ctrlAddEventHandler ["MouseExit", "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_exit"];
