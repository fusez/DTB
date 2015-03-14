public OnPlayerDisconnect(playerid, reason)
{
	g_SkinhitIssuerID[playerid] = INVALID_PLAYER_ID;

	for(new loop_playerid; loop_playerid < MAX_PLAYERS; loop_playerid ++)
	{
		if(g_SkinhitIssuerID[loop_playerid] == playerid)
			g_SkinhitIssuerID[loop_playerid] = INVALID_PLAYER_ID;
	}

	#if defined sh_OnPlayerDisconnect
		return sh_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect sh_OnPlayerDisconnect
#if defined sh_OnPlayerDisconnect
	forward sh_OnPlayerDisconnect(playerid, reason);
#endif
