public OnGameModeExit()
{
	TextDrawDestroy(g_GameTimeTD);

	#if defined ttd_OnGameModeExit
		ttd_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit ttd_OnGameModeExit
#if defined ttd_OnGameModeExit
	forward ttd_OnGameModeExit();
#endif
