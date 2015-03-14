new g_PlayerLastUpdate[MAX_PLAYERS];

#define GetPlayerPausedSeconds(%0) \
	(gettime() - g_PlayerLastUpdate[%0])

#define IsPlayerPaused(%0) \
	(GetPlayerPausedSeconds(%0) > 5)

/******************************************************************************/

public OnPlayerConnect(playerid)
{
	g_PlayerLastUpdate[playerid] = gettime();

	#if defined pause_OnPlayerConnect
		pause_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect pause_OnPlayerConnect
#if defined pause_OnPlayerConnect
	forward pause_OnPlayerConnect(playerid);
#endif

/******************************************************************************/

public OnPlayerUpdate(playerid)
{
	g_PlayerLastUpdate[playerid] = gettime();

	#if defined pause_OnPlayerUpdate
		return pause_OnPlayerUpdate(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate pause_OnPlayerUpdate
#if defined pause_OnPlayerUpdate
	forward pause_OnPlayerUpdate(playerid);
#endif

/******************************************************************************/
