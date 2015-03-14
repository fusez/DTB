public OnGameEnd(reason)
{
	for(new teamid; teamid < 2; teamid ++)
	{
		TextDrawHideForAll(g_TeamMaxHealthTD[teamid]);
		TextDrawHideForAll(g_TeamCurrentHealthTD[teamid]);
		TextDrawHideForAll(g_TeamTextHealthTD[teamid]);
	}

	#if defined thtd_OnGameEnd
		thtd_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd thtd_OnGameEnd
#if defined thtd_OnGameEnd
	forward thtd_OnGameEnd(reason);
#endif
