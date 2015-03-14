public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_PlayerHealthTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PlayerArmourTD[playerid]);

	g_PlayerHealthTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerHealthTD[playerid] = PlayerText: INVALID_TEXT_DRAW;
	#if defined phtd_OnPlayerDisconnect
		return phtd_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect phtd_OnPlayerDisconnect
#if defined phtd_OnPlayerDisconnect
	forward phtd_OnPlayerDisconnect(playerid, reason);
#endif
