public OnPlayerUpdate(playerid)
{
	static
	    previous_time[MAX_PLAYERS]
	;

	if( (gettime() - previous_time[playerid]) > 30 )
	{
		if(g_PlayerAccountID[playerid] != 0 && g_IsPlayerRegistered{playerid} && g_IsPlayerLoggedIn{playerid})
			SavePlayerAccount(playerid, g_PlayerAccountID[playerid]);
		previous_time[playerid] = gettime();
	}

	#if defined db_OnPlayerUpdate
		return db_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate db_OnPlayerUpdate
#if defined db_OnPlayerUpdate
	forward db_OnPlayerUpdate(playerid);
#endif
