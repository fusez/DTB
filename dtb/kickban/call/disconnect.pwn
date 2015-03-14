public OnPlayerDisconnect(playerid, reason)
{
	g_IsPlayerKicked{playerid} = false;

	#if defined kb_OnPlayerDisconnect
		return kb_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect kb_OnPlayerDisconnect
#if defined kb_OnPlayerDisconnect
	forward kb_OnPlayerDisconnect(playerid, reason);
#endif
