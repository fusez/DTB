public OnPlayerStreamIn(playerid, forplayerid)
{
	if(g_PlayerTeam[playerid] == g_PlayerTeam[forplayerid] || g_PlayerTeam[forplayerid] == TEAM_SPECTATE)
		ShowPlayerForPlayer(playerid, forplayerid, true);
	else
		ShowPlayerForPlayer(playerid, forplayerid, g_IsPlayerShown{playerid});

	#if defined pshow_OnPlayerStreamIn
		pshow_OnPlayerStreamIn(playerid, forplayerid);
	#endif
}
#if defined _ALS_OnPlayerStreamIn
	#undef OnPlayerStreamIn
#else
	#define _ALS_OnPlayerStreamIn
#endif
#define OnPlayerStreamIn pshow_OnPlayerStreamIn
#if defined pshow_OnPlayerStreamIn
	forward pshow_OnPlayerStreamIn(playerid, forplayerid);
#endif
