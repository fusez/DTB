public OnGameModeExit()
{
	KillTimer(g_GameTimer);

	#if defined game_OnGameModeExit
		game_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit game_OnGameModeExit
#if defined game_OnGameModeExit
	forward game_OnGameModeExit();
#endif
