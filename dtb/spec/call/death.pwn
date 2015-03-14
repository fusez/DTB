public OnPlayerDeath(playerid, killerid, reason)
{
	for(new spectatorid, max_playerid = GetMaxPlayers(); spectatorid < max_playerid; spectatorid ++)
	{
		if(!IsPlayerConnected(spectatorid))
		    continue;

		if(!IsPlayerSpectating(spectatorid))
		    continue;

		if(GetPlayerSpectatePlayer(spectatorid) == playerid)
			TogglePlayerSpectating(spectatorid, false);
	}

	#if defined spec_OnPlayerDeath
		spec_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath spec_OnPlayerDeath
#if defined spec_OnPlayerDeath
	forward spec_OnPlayerDeath(playerid, killerid, reason);
#endif
