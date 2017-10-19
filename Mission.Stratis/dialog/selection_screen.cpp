#include "IDC.h"
#include "IDD.h"
#include "COLORS.h"

class SelectionScreen
{
	idd = IDD_SELECTIONSCEEN;		// set to -1, because we don't require a unique ID
	movingEnable = false;			// the dialog can be moved with the mouse (see "moving" below)
	enableSimulation = false;		// freeze the game
	objects[] = { };
	onLoad = "disableSerialization; _this call PL_fnc_diag_Selection_overlay_init;";
	//onUnload "_this call PL_fnc_diag_Selection_overlay_destroy;";

	controlsBackground[] = { 
		END_BACKGROUND,
		BKG_selectors,
	};
	controls[]=
	{
		/*3D_view_police,
		3DView_civilian,
		3DView_medical,*/
		OUTLINE_POLICE,
		OUTLINE_CIVILIAN,
		OUTLINE_MEDICAL,
		BTN_POLICE,
		BTN_CIVILIAN,
		BTN_MEDICAL,
		rtext_POLICE,
		rtext_civilian,
		rtext_medical,
		INVI_POLICE,
		INVI_CIVILIAN,
		INVI_MEDICAL
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by alexander, v1.063, #Rehylo)
	////////////////////////////////////////////////////////

	class SelectionGlow : RscPicture {
		text = "selector_outline.paa";
		//onMouseEnter = "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_enter";
		//onMouseExit = "disableSerialization; _this call PLS_fnc_diag_Selection_overlay_exit";
	};

	class INVISIBLE_BUTTON : RscButton {
		text = "";
		colorText[] = {0,0,0,0};
		colorBackground[] = {0,0,0,0};
		colorActive[] = {0,0,0,0};
		onButtonClick = "hint str _this";
		onMouseEnter = "disableSerialization; _this call PL_fnc_diag_Selection_overlay_enter;";
		onMouseExit = "disableSerialization; _this call PL_fnc_diag_Selection_overlay_exit;";
		colorDisabled[] = {0,0,0,0.3};
		colorBackgroundDisabled[] = {0,0,0,0.3};
		colorBackgroundActive[] = {0,0,0,0};
		colorFocused[] = {0,0,0,0};
		colorShadow[] = {0,0,0,0};
		colorBorder[] = {0,0,0,0};
		soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
		soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
		soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
		soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
		style = 2;
		shadow = 0;
		font = "puristaMedium";
		sizeEx = 0.03921;
		offsetX = 0.000;
		offsetY = 0.000;
		offsetPressedX = 0;
		offsetPressedY = 0;
		borderSize = 0;
	}

	class OVERLAY_BLOW : RscPicture {
		idc = IDC_SELECTION_SCREEN_OVERLAY_GLOW_EXTRA;
	};

	class END_BACKGROUND: RscPicture
	{
		idc = -1;
		text = "resources\hud\end_background.paa";
		x = -0.0310938 * safezoneW + safezoneX;
		y = -0.38 * safezoneH + safezoneY;
		w = 1.03125 * safezoneW;
		h = 1.771 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class BKG_selectors: RscPicture
	{
		idc = -1;
		text = "resources\hud\selector_background.paa";
		x = 0.17 * safezoneW + safezoneX;
		y = -0.116 * safezoneH + safezoneY;
		w = 0.680625 * safezoneW;
		h = 1.232 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	/*
	class 3D_view_police: RscPicture
	{
		idc = -1; 
		type = 82;
		model = "a3\characters_f_exp\gendarmerie\b_gen_commander_f.p3d";
		scale = 1;

		direction[] = {0, 0, 0};
		up[] = {0,0,1}; 

		z = 0.2;

		xBack = 0.5;
		yBack = 0.5;
		zBack = 1.2;

		inBack = 0;
		enableZoom = 0;
		zoomDuration = 0;

		x = 0.183437 * safezoneW + safezoneX;
		y = 0.227222 * safezoneH + safezoneY;
		w = 0.179844 * safezoneW;
		h = 0.545667 * safezoneH;
	};
	class 3DView_civilian: RscPicture
	{
		idc = 1212;
		text = "#(argb,8,8,3)color(1,1,1,0.5)";
		x = 0.420625 * safezoneW + safezoneX;
		y = 0.228889 * safezoneH + safezoneY;
		w = 0.179844 * safezoneW;
		h = 0.545667 * safezoneH;
	};
	class 3DView_medical: RscPicture
	{
		idc = 1213;
		text = "#(argb,8,8,3)color(1,1,1,0.5)";
		x = 0.658125 * safezoneW + safezoneX;
		y = 0.227777 * safezoneH + safezoneY;
		w = 0.179844 * safezoneW;
		h = 0.545667 * safezoneH;
	};
	*/
	class INVI_POLICE: INVISIBLE_BUTTON
	{
		idc = IDC_SELECTION_SCREEN_INVI_POLICE;
		x = 0.180312 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.185625 * safezoneW;
		h = 0.55 * safezoneH;
	};

	class INVI_CIVILIAN: INVISIBLE_BUTTON
	{
		idc = IDC_SELECTION_SCREEN_INVI_CIVILIAN;
		x = 0.419531 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.185625 * safezoneW;
		h = 0.55 * safezoneH;
	};
	class INVI_MEDICAL: INVISIBLE_BUTTON
	{
		idc = IDC_SELECTION_SCREEN_INVI_MEDICAL;
		x = 0.654688 * safezoneW + safezoneX;
		y = 0.227222 * safezoneH + safezoneY;
		w = 0.185625 * safezoneW;
		h = 0.55 * safezoneH;
	};
	class OUTLINE_POLICE: SelectionGlow
	{
		idc = IDC_SELECTION_SCREEN_OUTLINE_POLICE;
		text = "resources\hud\selector_outline.paa";
		x = 0.121094 * safezoneW + safezoneX;
		y = 0.225 * safezoneH + safezoneY;
		w = 0.304219 * safezoneW;
		h = 0.55 * safezoneH;
		colorText[] = {COLOR_POLICE};
	};
	class OUTLINE_CIVILIAN: SelectionGlow
	{
		idc = IDC_SELECTION_SCREEN_OUTLINE_CIVILIAN;
		text = "resources\hud\selector_outline.paa";
		x = 0.35875 * safezoneW + safezoneX;
		y = 0.224445 * safezoneH + safezoneY;
		w = 0.304219 * safezoneW;
		h = 0.55 * safezoneH;
		colorText[] = {COLOR_CIVILIAN};
	};
	class OUTLINE_MEDICAL: SelectionGlow
	{
		idc = IDC_SELECTION_SCREEN_OUTLINE_MEDICAL;
		text = "resources\hud\selector_outline.paa";
		x = 0.595625 * safezoneW + safezoneX;
		y = 0.226666 * safezoneH + safezoneY;
		w = 0.304219 * safezoneW;
		h = 0.55 * safezoneH;
		colorText[] = {COLOR_MEDICAL};
	};
	class BTN_POLICE: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_BTN_POLICE;
		text = "resources\hud\button_background.paa";
		x = 0.183594 * safezoneW + safezoneX;
		y = 0.546111 * safezoneH + safezoneY;
		w = 0.179219 * safezoneW;
		h = 0.350889 * safezoneH;

		inactiveDimension[] = {
			x,y,w,h
		};

		activeDimension[] = {
			0.572187 * safezoneW + safezoneX,
			-0.094 * safezoneH + safezoneY,
			0 * safezoneW,
			0 * safezoneH
		};

		colorText[] = {COLOR_POLICE};
	};
	class BTN_CIVILIAN: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_BTN_CIVILIAN;
		text = "resources\hud\button_background.paa";
		x = 0.42125 * safezoneW + safezoneX;
		y = 0.546667 * safezoneH + safezoneY;
		w = 0.179219 * safezoneW;
		h = 0.350889 * safezoneH;

		inactiveDimension[] = {
			x,y,w,h
		};

		activeDimension[] = {
			0.420594 * safezoneW + safezoneX,
			0.58426 * safezoneH + safezoneY,
			0.180469 * safezoneW,
			0.187 * safezoneH
		};

		colorText[] = {COLOR_CIVILIAN};
	};
	class BTN_MEDICAL: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_BTN_MEDICAL;
		text = "resources\hud\button_background.paa";
		x = 0.658125 * safezoneW + safezoneX;
		y = 0.546667 * safezoneH + safezoneY;
		w = 0.179219 * safezoneW;
		h = 0.350889 * safezoneH;

		inactiveDimension[] = {
			x,y,w,h
		};

		activeDimension[] = {
			0.657472 * safezoneW + safezoneX,
			0.58778 * safezoneH + safezoneY,
			0.180469 * safezoneW,
			0.187 * safezoneH
		};

		colorText[] = {COLOR_MEDICAL};
	};
	class rtext_POLICE: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_rtext_POLICE;
		text = "resources\hud\POLICE_text.paa";
		x = 0.226719 * safezoneW + safezoneX;
		y = 0.632 * safezoneH + safezoneY;
		w = 0.0928125 * safezoneW;
		h = 0.176 * safezoneH;
		colorText[] = {1,1,1,1};
	};
	class rtext_civilian: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_rtext_civilian;
		text = "resources\hud\JOIN CIVILIAN text.paa";
		x = 0.461406 * safezoneW + safezoneX;
		y = 0.641889 * safezoneH + safezoneY;
		w = 0.103125 * safezoneW;
		h = 0.165 * safezoneH;

		xActive = 35.27 * GUI_GRID_W + GUI_GRID_X;
		yActive = 16.49 * GUI_GRID_H + GUI_GRID_Y;
		wActive = 17.5 * GUI_GRID_W;
		hActive = 8.5 * GUI_GRID_H;

		colorText[] = {1,1,1,1};
	};
	class rtext_medical: RscPicture
	{
		idc = IDC_SELECTION_SCREEN_rtext_medical;
		text = "resources\hud\JOIN MEDICAL text.paa";
		x = 0.703125 * safezoneW + safezoneX;
		y = 0.634444 * safezoneH + safezoneY;
		w = 0.0928125 * safezoneW;
		h = 0.176 * safezoneH;
		colorText[] = {1,1,1,1};
	};

	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};