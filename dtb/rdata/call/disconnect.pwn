public OnPlayerDisconnect(playerid, reason)
{
	ResetPlayerRoundVariables(playerid);

	#if defined rstats_OnPlayerDisconnect
		return rstats_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect rstats_OnPlayerDisconnect
#if defined rstats_OnPlayerDisconnect
	forward rstats_OnPlayerDisconnect(playerid, reason);
#endif
