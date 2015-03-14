ShowPlayerForTeam(playerid, teamid, bool:show)
{
	for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
	{
		if(!IsPlayerConnected(loop_playerid))
			continue;

		if(g_PlayerTeam[loop_playerid] == teamid)
		{
			// Show Team Player for Player
			if(IsPlayerStreamedIn(loop_playerid, playerid))
				ShowPlayerForPlayer(loop_playerid, playerid, show);

			// Show Player For Team Player
			if(IsPlayerStreamedIn(playerid, loop_playerid))
				ShowPlayerForPlayer(playerid, loop_playerid, show);
		}
	}
	return 1;
}
