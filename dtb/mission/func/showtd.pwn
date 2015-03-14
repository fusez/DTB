ShowPlayerObjectiveTextdraw(playerid)
{
	switch(g_PlayerTeam[playerid])
	{
		case TEAM_ATTACK:
	        TextDrawShowForPlayer(playerid, g_ObjectiveTD[TEAM_ATTACK]);
		case TEAM_DEFEND:
	        TextDrawShowForPlayer(playerid, g_ObjectiveTD[TEAM_DEFEND]);
	}
}
