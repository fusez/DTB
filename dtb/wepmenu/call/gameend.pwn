public OnGameEnd(reason)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(!IsPlayerConnected(playerid))
		    continue;

		if(g_pWeaponMenu{playerid} != INVALID_WEAPONMENU_ID)
			HidePlayerWeaponMenu(playerid);
	}
	#if defined wm_OnGameEnd
		wm_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd wm_OnGameEnd
#if defined wm_OnGameEnd
	forward wm_OnGameEnd(reason);
#endif
