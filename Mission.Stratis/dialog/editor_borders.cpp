#include "IDC.h"
#include "IDD.h"
#include "COLORS.h"

class EditorMouseBorders
{
	idd = IDD_EDITORMOUSEBORDERS;		// set to -1, because we don't require a unique ID
	movingEnable = false;			// the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = false;		// freeze the game
	objects[] = { };
	onLoad = "disableSerialization; _this call PL_fnc_diag_Selection_overlay_init;";
	//onUnload "_this call PL_fnc_diag_Selection_overlay_destroy;";

	controlsBackground[] = { };
	controls[]=
	{
		bkg_mouse_left_border,
		bkg_mouse_right_border,
		bkg_mouse_top_border,
		bkg_mouse_bottom_border
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by alexander, v1.063, #Vitaju)
	////////////////////////////////////////////////////////

	class bkg_mouse_left_border: RscText
	{
		idc = 1000;
		x = -0.00531252 * safezoneW + safezoneX;
		y = -0.028 * safezoneH + safezoneY;
		w = 0.04125 * safezoneW;
		h = 1.089 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
	};
	class bkg_mouse_right_border: RscText
	{
		idc = 1001;
		x = 0.964063 * safezoneW + safezoneX;
		y = -0.061 * safezoneH + safezoneY;
		w = 0.04125 * safezoneW;
		h = 1.089 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
	};
	class bkg_mouse_top_border: RscText
	{
		idc = 1002;
		x = -0.0104688 * safezoneW + safezoneX;
		y = -0.00599999 * safezoneH + safezoneY;
		w = 1.01578 * safezoneW;
		h = 0.055 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
	};
	class bkg_mouse_bottom_border: RscText
	{
		idc = 1003;
		x = -0.015625 * safezoneW + safezoneX;
		y = 0.951 * safezoneH + safezoneY;
		w = 1.01578 * safezoneW;
		h = 0.055 * safezoneH;
		colorBackground[] = {0,0,0,0.3};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
