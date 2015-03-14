public OnPlayerUpdate(playerid)
{
	new targetid = GetPlayerTargetPlayer(playerid);
	if(targetid != INVALID_PLAYER_ID)
	{
		new
		    teamid = g_PlayerTeam[playerid],
			target_teamid = g_PlayerTeam[targetid]
		;

		if(GetTeamOpponents(teamid) == target_teamid)
			ShowPlayerForOpponents(targetid, true);
	}

	if(g_IsPlayerShown{playerid} && (gettime() - g_LastPlayerShowTime[playerid]) >= 3)
        ShowPlayerForOpponents(playerid, false);

	#if defined pshow_OnPlayerUpdate
		return pshow_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate pshow_OnPlayerUpdate
#if defined pshow_OnPlayerUpdate
	forward pshow_OnPlayerUpdate(playerid);
#endif
