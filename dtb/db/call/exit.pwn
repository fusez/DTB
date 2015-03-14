public OnGameModeExit()
{
	if(mysql_close(g_DBHandle))
		print("Database connection closed.");

	#if defined db_OnGameModeExit
		db_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit db_OnGameModeExit
#if defined db_OnGameModeExit
	forward db_OnGameModeExit();
#endif
