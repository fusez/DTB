public OnGameEnd(reason)
{
	if(g_GameWinner != TEAM_NONE)
	{
		new losers = GetTeamOpponents(g_GameWinner);
		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(!IsPlayerConnected(playerid))
			    continue;

			if(g_PlayerTeam[playerid] == g_GameWinner)
				g_PlayerGamesWon[playerid] ++;
			else if(g_PlayerTeam[playerid] == losers)
	   		    g_PlayerGamesLost[playerid] ++;
		}
	}

	#if defined db_OnGameEnd
		db_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd db_OnGameEnd
#if defined db_OnGameEnd
	forward db_OnGameEnd(reason);
#endif
