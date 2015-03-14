public OnGameModeExit()
{
	for(new teamid; teamid < 2; teamid ++)
	{
		TextDrawDestroy(g_TeamMaxHealthTD[teamid]);
		TextDrawDestroy(g_TeamCurrentHealthTD[teamid]);
		TextDrawDestroy(g_TeamTextHealthTD[teamid]);
	}

	#if defined thtd_OnGameModeExit
		thtd_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit thtd_OnGameModeExit
#if defined thtd_OnGameModeExit
	forward thtd_OnGameModeExit();
#endif
