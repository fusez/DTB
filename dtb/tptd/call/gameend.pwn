public OnGameEnd(reason)
{
	for(new teamid; teamid < 2; teamid ++)
	{
		for(new i; i < MAX_TEAM_PLAYERS; i ++)
			TextDrawHideForAll(g_TeamPlayersTD[teamid][i]);
	}

	#if defined tptd_OnGameEnd
		tptd_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd tptd_OnGameEnd
#if defined tptd_OnGameEnd
	forward tptd_OnGameEnd(reason);
#endif
