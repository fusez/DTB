public OnGameEnd(reason)
{
	g_IsObjectiveShown = false;

	if(reason == REASON_DESTROYED || reason == REASON_DEFUSED)
	{
		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(!IsPlayerConnected(playerid))
				continue;

			HidePlayerObjectiveTextdraw(playerid);
			if(IsPlayerSpawned(playerid))
				SetPlayerCameraAtBombsite(playerid, g_BombPlantSite);
		}
	}

	#if defined objective_OnGameEnd
		objective_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd objective_OnGameEnd
#if defined objective_OnGameEnd
	forward objective_OnGameEnd(reason);
#endif
