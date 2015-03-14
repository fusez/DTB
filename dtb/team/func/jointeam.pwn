PlayerJoinTeam(playerid, teamid)
{
	if(teamid == TEAM_NONE)
	    return 0;

	switch(teamid)
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	        SetPlayerSkin(playerid, g_TeamSkins[teamid]);
	}

	g_PlayerTeam[playerid] = teamid;
	SetPlayerColor(playerid, g_TeamColors[teamid]);
	return 1;
}
