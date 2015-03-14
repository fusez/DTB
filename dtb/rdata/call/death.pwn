public OnPlayerDeath(playerid, killerid, reason)
{
	g_PlayerRoundKilled{playerid} = true;

	#if defined rstats_OnPlayerDeath
		rstats_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath rstats_OnPlayerDeath
#if defined rstats_OnPlayerDeath
	forward rstats_OnPlayerDeath(playerid, killerid, reason);
#endif
