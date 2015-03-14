public OnPlayerConnect(playerid)
{
	g_ZoneBackgroundTD[playerid] =
	CreatePlayerTextDraw			(playerid, 320.0, 1.0, "_");
	PlayerTextDrawAlignment			(playerid, g_ZoneBackgroundTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_ZoneBackgroundTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_ZoneBackgroundTD[playerid], 1);
	PlayerTextDrawLetterSize		(playerid, g_ZoneBackgroundTD[playerid], 0.5, 49.499992);
	PlayerTextDrawColor				(playerid, g_ZoneBackgroundTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_ZoneBackgroundTD[playerid], 0);
	PlayerTextDrawSetProportional	(playerid, g_ZoneBackgroundTD[playerid], 1);
	PlayerTextDrawSetShadow			(playerid, g_ZoneBackgroundTD[playerid], 1);
	PlayerTextDrawUseBox			(playerid, g_ZoneBackgroundTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_ZoneBackgroundTD[playerid], 150);
	PlayerTextDrawTextSize			(playerid, g_ZoneBackgroundTD[playerid], 0.0, 638.0);
	PlayerTextDrawSetSelectable		(playerid, g_ZoneBackgroundTD[playerid], 0);

	g_ZoneTextTD[playerid] =
	CreatePlayerTextDraw			(playerid, 320.0, 170.0, "Leaving Warzone");
	PlayerTextDrawAlignment			(playerid, g_ZoneTextTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_ZoneTextTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_ZoneTextTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_ZoneTextTD[playerid], 0.509998, 2.999998);
	PlayerTextDrawColor				(playerid, g_ZoneTextTD[playerid], -16776961);
	PlayerTextDrawSetOutline		(playerid, g_ZoneTextTD[playerid], 0);
	PlayerTextDrawSetProportional	(playerid, g_ZoneTextTD[playerid], 1);
	PlayerTextDrawSetShadow			(playerid, g_ZoneTextTD[playerid], 2);
	PlayerTextDrawSetSelectable		(playerid, g_ZoneTextTD[playerid], 0);

	#if defined wz_OnPlayerConnect
		wz_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect wz_OnPlayerConnect
#if defined wz_OnPlayerConnect
	forward wz_OnPlayerConnect(playerid);
#endif
