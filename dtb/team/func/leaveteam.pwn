PlayerLeaveTeam(playerid, reasonid)
{
	new teamid = g_PlayerTeam[playerid];
	if(teamid == TEAM_NONE)
	    return 0;

	if(reasonid == LEAVE_TEAM_DISCONNECT)
		g_PlayerTeam[playerid] = TEAM_NONE;

	CallLocalFunction("OnPlayerLeaveTeam", "iii", playerid, teamid, reasonid);
	return 1;
}
