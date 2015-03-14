public OnGameModeExit()
{
	for(new teamid; teamid < 2; teamid ++)
		TextDrawDestroy(g_ObjectiveTD[teamid]);

	#if defined objective_OnGameModeExit
		objective_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit objective_OnGameModeExit
#if defined objective_OnGameModeExit
	forward objective_OnGameModeExit();
#endif
