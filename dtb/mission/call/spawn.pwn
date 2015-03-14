public OnPlayerSpawn(playerid)
{
	switch(g_PlayerTeam[playerid])
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	    {
			ShowPlayerObjectiveTextdraw(playerid);
			SetPlayerCameraAtBombsite(playerid, g_ObjectiveBombsite);
		}
	}

	#if defined objective_OnPlayerSpawn
		return objective_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn objective_OnPlayerSpawn
#if defined objective_OnPlayerSpawn
	forward objective_OnPlayerSpawn(playerid);
#endif
