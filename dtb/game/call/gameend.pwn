public OnGameEnd(reason)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(!IsPlayerConnected(playerid))
		    continue;

		if(g_GameWinner == TEAM_NONE)
		{
			PlayerPlaySound(playerid, 5816, 0.0, 0.0, 0.0);
			if(IsPlayerSpawned(playerid))
				TogglePlayerControllable(playerid, false);
		}
		else
		{
			new losers = GetTeamOpponents(g_GameWinner);

			if(g_PlayerTeam[playerid] == g_GameWinner)
			{
				PlayerPlaySound(playerid, 31205, 0.0, 0.0, 0.0);

				if(IsPlayerSpawned(playerid))
	        	    ApplyAnimation(playerid, "OTB", "wtchrace_win", 4.1, 1, 0, 0, 0, 0, 0);
			}
			else if(g_PlayerTeam[playerid] == losers)
			{
				PlayerPlaySound(playerid, 31202, 0.0, 0.0, 0.0);

				if(IsPlayerSpawned(playerid))
	        	   	ApplyAnimation(playerid, "OTB", "wtchrace_lose", 4.1, 1, 0, 0, 0, 0, 0);
			}
		}
	}

	#if defined game_OnGameEnd
		game_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd game_OnGameEnd
#if defined game_OnGameEnd
	forward game_OnGameEnd(reason);
#endif
