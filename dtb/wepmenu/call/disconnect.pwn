public OnPlayerDisconnect(playerid, reason)
{
	if(g_pWeaponMenu{playerid} != INVALID_WEAPONMENU_ID)
	{
	    g_pWeaponMenu{playerid} = INVALID_WEAPONMENU_ID;
		CancelSelectTextDraw(playerid);
	}

	PlayerTextDrawDestroy(playerid, g_WeaponMenuBoxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_WeaponMenuTitleTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_WeaponMenuBackTD[playerid]);

	g_WeaponMenuBoxTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_WeaponMenuTitleTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_WeaponMenuBackTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;

	for(new item, limit = sizeof g_MenuWeapons; item < limit; item ++)
	{
		PlayerTextDrawDestroy(playerid, g_WeaponMenuIconTD[playerid][item]);
		PlayerTextDrawDestroy(playerid, g_WeaponMenuNameTD[playerid][item]);

		g_WeaponMenuIconTD	[playerid][item] = PlayerText: INVALID_TEXT_DRAW;
		g_WeaponMenuNameTD	[playerid][item] = PlayerText: INVALID_TEXT_DRAW;
	}

	#if defined wm_OnPlayerDisconnect
		return wm_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect wm_OnPlayerDisconnect
#if defined wm_OnPlayerDisconnect
	forward wm_OnPlayerDisconnect(playerid, reason);
#endif
