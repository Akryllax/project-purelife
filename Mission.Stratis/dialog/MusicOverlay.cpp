#include "IDC.h"
#include "IDD.h"
#include "COLORS.h"

class MusicOverlay
{
	idd = IDD_DIAG_MUSIC_OVERLAY;
	movingEnable = 1;
	fadein = 3;
	duration = 5;
	fadeout = 3;
	name = "MusicOverlay";
	onLoad = "uiNamespace setVariable ['MusicOverlay',_this select 0]";
	
	controls[]=
	{
		RscStructuredText_1100
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by Akryllax, v1.063, #Gylysi)
	////////////////////////////////////////////////////////

	class RscStructuredText_1100: RscStructuredText
	{
		idc = IDC_SONGDISPLAYER_RSCSTRUCTUREDTEXT_1100;
		text = "Cancion: <br/>Artista: <br/>Album:";
		x = -27 * GUI_GRID_W + GUI_GRID_X;
		y = 30.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 26.5 * GUI_GRID_W;
		h = 4 * GUI_GRID_H;
		colorText[] = {1,1,1,1};
		colorBackground[] = {1,1,1,0.1};
		colorActive[] = {0,0,0,0};
		sizeEx = 1 * GUI_GRID_H;
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
};