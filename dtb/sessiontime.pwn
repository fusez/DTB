new g_PlayerJoinTime[MAX_PLAYERS];

#define GetPlayerJoinTime(%0) \
	(g_PlayerJoinTime[%0])

#define GetPlayerSessionTime(%0) \
	(gettime() - g_PlayerJoinTime[%0])

public OnPlayerConnect(playerid)
{
    g_PlayerJoinTime[playerid] = gettime();

	#if defined stime_OnPlayerConnect
		stime_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect stime_OnPlayerConnect
#if defined stime_OnPlayerConnect
	forward stime_OnPlayerConnect(playerid);
#endif
