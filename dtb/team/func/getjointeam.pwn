GetTeamToJoin()
{
	new
		total_players[2],
		join_teamid
	;

	for(new teamid, alive_players, dead_players; teamid < 2; teamid ++)
		GetTeamPlayers(teamid, total_players[teamid], alive_players, dead_players);

	if(total_players[TEAM_ATTACK] > total_players[TEAM_DEFEND])
		join_teamid = TEAM_DEFEND;
	else if(total_players[TEAM_ATTACK] < total_players[TEAM_DEFEND])
		join_teamid = TEAM_ATTACK;
	else
		join_teamid = random(2);
	return join_teamid;
}
