public OnGameModeInit()
{
	StartGame();
	g_GameTimer = SetTimer("OnSecondPassed", 1000, true);

	#if defined game_OnGameModeInit
		game_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit game_OnGameModeInit
#if defined game_OnGameModeInit
	forward game_OnGameModeInit();
#endif
