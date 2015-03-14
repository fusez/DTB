public OnGameStart()
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(IsPlayerConnected(playerid))
			TogglePlayerSpectating(playerid, false);
	}

	#if defined game_OnGameStart
		game_OnGameStart();
	#endif
}
#if defined _ALS_OnGameStart
	#undef OnGameStart
#else
	#define _ALS_OnGameStart
#endif
#define OnGameStart game_OnGameStart
#if defined game_OnGameStart
	forward game_OnGameStart();
#endif
