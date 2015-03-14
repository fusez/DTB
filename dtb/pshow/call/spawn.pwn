public OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch(teamid)
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	    {
		    g_IsPlayerShown{playerid} = false;

			ShowPlayerForTeam(playerid, teamid, true);
			ShowPlayerForTeam(playerid, GetTeamOpponents(teamid), false);
		}
	}

	#if defined pshow_OnPlayerSpawn
		return pshow_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn pshow_OnPlayerSpawn
#if defined pshow_OnPlayerSpawn
	forward pshow_OnPlayerSpawn(playerid);
#endif
