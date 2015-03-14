public OnPlayerDisconnect(playerid, reason)
{
	PlayerLeaveTeam(playerid, LEAVE_TEAM_DISCONNECT);

	#if defined team_OnPlayerDisconnect
		return team_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect team_OnPlayerDisconnect
#if defined team_OnPlayerDisconnect
	forward team_OnPlayerDisconnect(playerid, reason);
#endif
