UpdateTeamPlayersTextdraws(teamid)
{
	new
		alive_players,
	    dead_players,
	    total_players
	;

	GetTeamPlayers(teamid, total_players, alive_players, dead_players);

	for(new i; i < MAX_TEAM_PLAYERS; i ++)
	{
		if(i < total_players)
		{
			if(i < alive_players)
				TextDrawColor(g_TeamPlayersTD[teamid][i], g_TeamColors[teamid]);
			else
				TextDrawColor(g_TeamPlayersTD[teamid][i], g_TeamColors[teamid] - 200);
			TextDrawShowForAll(g_TeamPlayersTD[teamid][i]);
		}
		else
		    TextDrawHideForAll(g_TeamPlayersTD[teamid][i]);
	}
	return 1;
}
