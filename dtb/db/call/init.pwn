public OnGameModeInit()
{
    g_DBHandle = mysql_connect(SQL_HOST, SQL_USER, SQL_DB, SQL_PASSWORD);
	if(mysql_errno(g_DBHandle) == 0)
		print("Database connection established successfully!");
	else
		print("Database connection failed!");

	#if defined db_OnGameModeInit
		db_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit db_OnGameModeInit
#if defined db_OnGameModeInit
	forward db_OnGameModeInit();
#endif
