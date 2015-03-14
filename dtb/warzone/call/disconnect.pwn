public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_ZoneBackgroundTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_ZoneTextTD[playerid]);

	g_IsPlayerInZone		{playerid} = true;
	g_PlayerZoneWarnings	{playerid} = 0;
	g_ZoneBackgroundTD		[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_ZoneTextTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;

	#if defined wz_OnPlayerDisconnect
		return wz_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect wz_OnPlayerDisconnect
#if defined wz_OnPlayerDisconnect
	forward wz_OnPlayerDisconnect(playerid, reason);
#endif
