public OnPlayerUpdate(playerid)
{
	if(g_IsPlayerKicked{playerid})
	    return 0;

	#if defined kb_OnPlayerUpdate
		return kb_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate kb_OnPlayerUpdate
#if defined kb_OnPlayerUpdate
	forward kb_OnPlayerUpdate(playerid);
#endif
