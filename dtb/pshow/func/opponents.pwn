ShowPlayerForOpponents(playerid, bool:show)
{
	g_LastPlayerShowTime[playerid] = gettime();
	if(show == g_IsPlayerShown{playerid})
		return 0;

	g_IsPlayerShown{playerid} = show;

	new teamid = g_PlayerTeam[playerid],
	    opposite_teamid = GetTeamOpponents(teamid);

	for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
	{
		if(!IsPlayerConnected(loop_playerid))
			continue;

		if(g_PlayerTeam[loop_playerid] != opposite_teamid)
			continue;

		if(IsPlayerStreamedIn(playerid, loop_playerid))
			ShowPlayerForPlayer(playerid, loop_playerid, show);
	}
	return 1;
}
