HidePlayerObjectiveTextdraw(playerid)
{
	for(new teamid; teamid < 2; teamid ++)
        TextDrawHideForPlayer(playerid, g_ObjectiveTD[teamid]);
}
