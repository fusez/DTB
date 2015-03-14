public OnPlayerDeath(playerid, killerid, reason)
{
	g_PlayerDeaths[playerid] ++;
	if(killerid != INVALID_PLAYER_ID)
		g_PlayerKills[killerid] ++;

	WriteDeathlog(playerid, killerid, reason);

	#if defined db_OnPlayerDeath
		db_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath db_OnPlayerDeath
#if defined db_OnPlayerDeath
	forward db_OnPlayerDeath(playerid, killerid, reason);
#endif
