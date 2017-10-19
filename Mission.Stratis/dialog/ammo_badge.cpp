#include "IDD.h"
#include "IDC.h"

class AmmoBadge {
	idd = IDD_AMMOBADGE;
	movingEnable = 1;
	fadein = 0;
	duration = 99999999999999999999999999999999999999999999;
	fadeout = 0;
	name = "AmmoBadge";
	onLoad = "uiNamespace setVariable ['AmmoBadge',_this select 0]";
	
	controls[]=
	{
		BKG_AmmoBadge,
		TXT_AmmoCount
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by alexander, v1.063, #Zahemu)
	////////////////////////////////////////////////////////

	class BKG_AmmoBadge: RscPicture
	{
		idc = -1;
		text = "resources\hud\AmmoHUD.paa";
		x = 49 * GUI_GRID_W + GUI_GRID_X;
		y = -15 * GUI_GRID_H + GUI_GRID_Y;
		w = 19 * GUI_GRID_W;
		h = 15 * GUI_GRID_H;
	};
	class TXT_AmmoCount: RscText
	{
		idc = IDC_AMMOBADGE_AMMO_TEXT;
		text = "30/30"; //--- ToDo: Localize;
		x = 64 * GUI_GRID_W + GUI_GRID_X;
		y = -7.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 3 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		sizeEx = 1 * GUI_GRID_H;
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};