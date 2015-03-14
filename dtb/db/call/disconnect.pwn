public OnPlayerDisconnect(playerid, reason)
{
	if(g_PlayerAccountID[playerid] != 0)
	{
	    CreatePlayerSession(playerid);

		if(g_IsPlayerRegistered{playerid} && g_IsPlayerLoggedIn{playerid})
			SavePlayerAccount(playerid, g_PlayerAccountID[playerid]);
	}

	g_PlayerAccountID			[playerid] = 0;
	g_IsPlayerRegistered		{playerid} = false;
	g_IsPlayerLoggedIn			{playerid} = false;
    g_PlayerLoginAttempts		{playerid} = 0;
	g_PlayerPassword			[playerid] = "";
	g_PlayerSalt				[playerid] = "";
	g_PlayerAdminLevel			{playerid} = 0;
	g_PlayerKills				[playerid] = 0;
	g_PlayerBestMultiKill   	{playerid} = 0;
	g_PlayerDeaths				[playerid] = 0;
	g_PlayerGamesWon			[playerid] = 0;
	g_PlayerGamesLost			[playerid] = 0;
	g_PlayerBombsPlanted 		[playerid] = 0;
	g_PlayerBombsDefused		[playerid] = 0;
	g_PlayerPlayTime			[playerid] = 0;

	#if defined db_OnPlayerDisconnect
		return db_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect db_OnPlayerDisconnect
#if defined db_OnPlayerDisconnect
	forward db_OnPlayerDisconnect(playerid, reason);
#endif
