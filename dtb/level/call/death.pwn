public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
		GivePlayerXP(killerid, 2, "Enemy Killed");

	for(new assistid, max_playerid = GetMaxPlayers(); assistid < max_playerid; assistid ++)
	{
		if(!IsPlayerConnected(assistid))
		    continue;

		if(assistid == killerid)
		    continue;

		if(assistid == playerid)
		    continue;

		if(g_PlayerDamagedBy[playerid][assistid])
			GivePlayerXP(assistid, 1, "Assisted Kill");
	}

	#if defined level_OnPlayerDeath
		level_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath level_OnPlayerDeath
#if defined level_OnPlayerDeath
	forward level_OnPlayerDeath(playerid, killerid, reason);
#endif
