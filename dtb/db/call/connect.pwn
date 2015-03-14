public OnPlayerConnect(playerid)
{
    LoadPlayerAccount(playerid);
    LoadPlayerSessions(playerid); // Loads previous sessions, then check for bans
    
	#if defined db_OnPlayerConnect
		db_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect db_OnPlayerConnect
#if defined db_OnPlayerConnect
	forward db_OnPlayerConnect(playerid);
#endif
