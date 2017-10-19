

#include "IDD.h"
#include "IDC.h"

class LowAmmoBadge {
	idd = IDD_LOWAMMOBADGE;
	movingEnable = 1;
	fadein = 0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout = 0;
	name = "LowAmmoBadge";
	onLoad = "uiNamespace setVariable ['LowAmmoBadge',_this select 0]";

	controls[]=
	{
		IMG_WARNING_LOWAMMO
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by alexander, v1.063, #Vojiju)
	////////////////////////////////////////////////////////

	class IMG_WARNING_LOWAMMO: RscPicture
	{
		idc = IDC_LOWAMMOBADGE_IMAGE;
		text = "resources\hud\warning-low-ammo.paa";
		x = 14.5 * GUI_GRID_W + GUI_GRID_X;
		y = 19 * GUI_GRID_H + GUI_GRID_Y;
		w = 11 * GUI_GRID_W;
		h = 8 * GUI_GRID_H;
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};