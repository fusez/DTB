public OnPlayerDisconnect(playerid, reason)
{
    g_acMoneyWarnings		{playerid} = 0;
	g_acHealthWarnings		{playerid} = 0;
	g_acArmourWarnings		{playerid} = 0;
	g_acJetpackWarnings		{playerid} = 0;
    g_acFlyhackWarnings		{playerid} = 0;
	g_acNoReloadWarnings    {playerid} = 0;
	g_acMessageWarnings     {playerid} = 0;
	g_acMessageString       [playerid] = "";

	for(new slot; slot < 13; slot ++)
	{
		g_acWeaponWarnings	[playerid][slot] = 0;
		g_acWeaponSynced	[playerid][slot] = false;
	}

	#if defined ac_OnPlayerDisconnect
		return ac_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect ac_OnPlayerDisconnect
#if defined ac_OnPlayerDisconnect
	forward ac_OnPlayerDisconnect(playerid, reason);
#endif
