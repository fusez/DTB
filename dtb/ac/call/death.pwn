public OnPlayerDeath(playerid, killerid, reason)
{
	if(ac_CheckPlayerFlooding(playerid))
		return 0;

	#if defined ac_OnPlayerDeath
		ac_OnPlayerDeath(playerid, killerid, reason);
	#endif
    return 1;
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath ac_OnPlayerDeath
#if defined ac_OnPlayerDeath
	forward ac_OnPlayerDeath(playerid, killerid, reason);
#endif
