public OnPlayerSpawn(playerid)
{
	if(g_PlayerAccountID[playerid] == 0)
		return TogglePlayerSpectating(playerid, true), 1;

	if(g_IsPlayerRegistered{playerid} && !g_IsPlayerLoggedIn{playerid})
		return TogglePlayerSpectating(playerid, true), 1;

	#if defined db_OnPlayerSpawn
		return db_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn db_OnPlayerSpawn
#if defined db_OnPlayerSpawn
	forward db_OnPlayerSpawn(playerid);
#endif
