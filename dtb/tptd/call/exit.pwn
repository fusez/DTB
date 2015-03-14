public OnGameModeExit()
{
	for(new teamid; teamid < 2; teamid ++)
	{
		for(new slot; slot < MAX_TEAM_PLAYERS; slot ++)
		    TextDrawDestroy(g_TeamPlayersTD[teamid][slot]);
	}

	#if defined tptd_OnGameModeExit
		tptd_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit tptd_OnGameModeExit
#if defined tptd_OnGameModeExit
	forward tptd_OnGameModeExit();
#endif
