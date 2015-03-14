HidePlayerWeaponMenu(playerid)
{
	if(g_pWeaponMenu{playerid} == INVALID_WEAPONMENU_ID)
	    return 0;

	PlayerTextDrawHide		(playerid, g_WeaponMenuBoxTD[playerid]);
	PlayerTextDrawHide		(playerid, g_WeaponMenuTitleTD[playerid]);
	PlayerTextDrawHide		(playerid, g_WeaponMenuBackTD[playerid]);

	for(new a, b = sizeof g_MenuWeapons; a < b; a ++)
	{
		PlayerTextDrawHide	(playerid, g_WeaponMenuIconTD[playerid][a]);
		PlayerTextDrawHide	(playerid, g_WeaponMenuNameTD[playerid][a]);
	}

	g_pWeaponMenu{playerid} = INVALID_WEAPONMENU_ID;
	CancelSelectTextDraw(playerid);
	return 1;
}
