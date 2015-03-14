public OnPlayerDisconnect(playerid, reason)
{
	if(g_pDamageIconCreated{playerid})
	{
        g_pDamageIconCreated{playerid} = false;
		DestroyObject(g_pDamageIconObject[playerid]);
	}

	#if defined di_OnPlayerDisconnect
		return di_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect di_OnPlayerDisconnect
#if defined di_OnPlayerDisconnect
	forward di_OnPlayerDisconnect(playerid, reason);
#endif
