public OnPlayerConnect(playerid)
{
	g_WeaponMenuBoxTD[playerid] =
	CreatePlayerTextDraw			(playerid, 320.0, 107.0, "_");
	PlayerTextDrawAlignment			(playerid, g_WeaponMenuBoxTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_WeaponMenuBoxTD[playerid], 0.0, 28.6);
	PlayerTextDrawUseBox			(playerid, g_WeaponMenuBoxTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_WeaponMenuBoxTD[playerid], 100);
	PlayerTextDrawTextSize			(playerid, g_WeaponMenuBoxTD[playerid], 0.0, 255.0);

	g_WeaponMenuTitleTD[playerid] =
	CreatePlayerTextDraw			(playerid, 196.0, 93.0, "Title");
	PlayerTextDrawBackgroundColor	(playerid, g_WeaponMenuTitleTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_WeaponMenuTitleTD[playerid], 0);
	PlayerTextDrawLetterSize		(playerid, g_WeaponMenuTitleTD[playerid], 0.53, 2.4);
	PlayerTextDrawColor				(playerid, g_WeaponMenuTitleTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_WeaponMenuTitleTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_WeaponMenuTitleTD[playerid], 1);

	g_WeaponMenuBackTD[playerid] =
	CreatePlayerTextDraw			(playerid, 395.0, 108.0, "Press here to go back");
	PlayerTextDrawAlignment			(playerid, g_WeaponMenuBackTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_WeaponMenuBackTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_WeaponMenuBackTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_WeaponMenuBackTD[playerid], 0.2, 1.1);
	PlayerTextDrawColor				(playerid, g_WeaponMenuBackTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_WeaponMenuBackTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_WeaponMenuBackTD[playerid], 1);
	PlayerTextDrawUseBox			(playerid, g_WeaponMenuBackTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_WeaponMenuBackTD[playerid], 0);
	PlayerTextDrawTextSize			(playerid, g_WeaponMenuBackTD[playerid], 10.0, 106.0);
	PlayerTextDrawSetSelectable		(playerid, g_WeaponMenuBackTD[playerid], 1);

	for(new height, item, limit = sizeof g_MenuWeapons; height < 4; height ++)
	{
		for(new width; width < 5; width ++, item ++)
		{
			if(item == limit)
			    break;

			g_WeaponMenuIconTD[playerid][item] =
			CreatePlayerTextDraw			(playerid, 193.0 + (width * 51.0), 121.0 + (height * 61.0), "Weapon Icon");
			PlayerTextDrawAlignment			(playerid, g_WeaponMenuIconTD[playerid][item], 2);
			PlayerTextDrawBackgroundColor	(playerid, g_WeaponMenuIconTD[playerid][item], 50);
			PlayerTextDrawFont				(playerid, g_WeaponMenuIconTD[playerid][item], 5);
			PlayerTextDrawColor				(playerid, g_WeaponMenuIconTD[playerid][item], -1);
			PlayerTextDrawUseBox			(playerid, g_WeaponMenuIconTD[playerid][item], 1);
			PlayerTextDrawBoxColor			(playerid, g_WeaponMenuIconTD[playerid][item], 0);
			PlayerTextDrawTextSize			(playerid, g_WeaponMenuIconTD[playerid][item], 50.0, 60.0);
			PlayerTextDrawSetPreviewRot		(playerid, g_WeaponMenuIconTD[playerid][item], 0.0, 330.0, 310.0, 1.0);
			PlayerTextDrawSetSelectable		(playerid, g_WeaponMenuIconTD[playerid][item], 1);

			g_WeaponMenuNameTD[playerid][item] =
			CreatePlayerTextDraw			(playerid, 218.0 + (width * 51.0), 162.0 + (height * 61.0), "Weapon Name");
			PlayerTextDrawAlignment			(playerid, g_WeaponMenuNameTD[playerid][item], 2);
			PlayerTextDrawBackgroundColor	(playerid, g_WeaponMenuNameTD[playerid][item], 255);
			PlayerTextDrawFont				(playerid, g_WeaponMenuNameTD[playerid][item], 2);
			PlayerTextDrawLetterSize		(playerid, g_WeaponMenuNameTD[playerid][item], 0.16, 0.9);
			PlayerTextDrawColor				(playerid, g_WeaponMenuNameTD[playerid][item], -1);
			PlayerTextDrawSetOutline		(playerid, g_WeaponMenuNameTD[playerid][item], 1);
			PlayerTextDrawSetProportional	(playerid, g_WeaponMenuNameTD[playerid][item], 1);
			PlayerTextDrawUseBox			(playerid, g_WeaponMenuNameTD[playerid][item], 1);
			PlayerTextDrawBoxColor			(playerid, g_WeaponMenuNameTD[playerid][item], 0);
			PlayerTextDrawTextSize			(playerid, g_WeaponMenuNameTD[playerid][item], 0.0, 48.0);
			PlayerTextDrawSetSelectable		(playerid, g_WeaponMenuNameTD[playerid][item], 0);
		}
	}

	#if defined wm_OnPlayerConnect
		wm_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect wm_OnPlayerConnect
#if defined wm_OnPlayerConnect
	forward wm_OnPlayerConnect(playerid);
#endif
