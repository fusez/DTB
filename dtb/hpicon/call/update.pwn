public OnPlayerUpdate(playerid)
{
	if(g_pDamageIconCreated{playerid} && (GetTickCount() - g_pDamageIconTick[playerid]) > 1000)
	{
        g_pDamageIconCreated{playerid} = false;
		DestroyObject(g_pDamageIconObject[playerid]);
	}

	#if defined di_OnPlayerUpdate
		return di_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate di_OnPlayerUpdate
#if defined di_OnPlayerUpdate
	forward di_OnPlayerUpdate(playerid);
#endif
