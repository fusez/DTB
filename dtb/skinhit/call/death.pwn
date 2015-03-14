public OnPlayerDeath(playerid, killerid, reason)
{
	if(g_SkinhitIssuerID[playerid] != INVALID_PLAYER_ID)
	{
		if(GetTickCount() - g_SkinhitTick[playerid] < 5000)
		{
			killerid = g_SkinhitIssuerID[playerid];
			reason = g_SkinhitReasonID[playerid];
		}
		g_SkinhitIssuerID[playerid] = INVALID_PLAYER_ID;
	}

	#if defined sh_OnPlayerDeath
		sh_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath sh_OnPlayerDeath
#if defined sh_OnPlayerDeath
	forward sh_OnPlayerDeath(playerid, killerid, reason);
#endif
