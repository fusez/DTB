public OnPlayerMultiKill(playerid, kills)
{
	if(kills > g_PlayerBestMultiKill{playerid})
	    g_PlayerBestMultiKill{playerid} = kills;

	#if defined db_OnPlayerMultiKill
		db_OnPlayerMultiKill(playerid, kills);
	#endif
}
#if defined _ALS_OnPlayerMultiKill
	#undef OnPlayerMultiKill
#else
	#define _ALS_OnPlayerMultiKill
#endif
#define OnPlayerMultiKill db_OnPlayerMultiKill
#if defined db_OnPlayerMultiKill
	forward db_OnPlayerMultiKill(playerid, kills);
#endif
