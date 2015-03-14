public OnGameEnd(reason)
{
	if(g_GameWinner != TEAM_NONE)
	{
		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(IsPlayerConnected(playerid) && g_PlayerTeam[playerid] == g_GameWinner)
				GivePlayerXP(playerid, 1, "Round Winner");
		}
	}

	#if defined level_OnGameEnd
		level_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd level_OnGameEnd
#if defined level_OnGameEnd
	forward level_OnGameEnd(reason);
#endif
