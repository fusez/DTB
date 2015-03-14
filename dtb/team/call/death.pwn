public OnPlayerDeath(playerid, killerid, reason)
{
	PlayerLeaveTeam(playerid, LEAVE_TEAM_DEATH);

	#if defined team_OnPlayerDeath
		team_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath team_OnPlayerDeath
#if defined team_OnPlayerDeath
	forward team_OnPlayerDeath(playerid, killerid, reason);
#endif
