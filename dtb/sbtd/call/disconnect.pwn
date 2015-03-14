public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_pScoreboardResultTD[playerid]);
    g_pScoreboardResultTD[playerid] = PlayerText: INVALID_TEXT_DRAW;

	#if defined sb_OnPlayerDisconnect
		return sb_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect sb_OnPlayerDisconnect
#if defined sb_OnPlayerDisconnect
	forward sb_OnPlayerDisconnect(playerid, reason);
#endif
