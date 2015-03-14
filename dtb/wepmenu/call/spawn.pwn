public OnPlayerSpawn(playerid)
{
	switch(g_PlayerTeam[playerid])
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	    {
			ShowPlayerWeaponMenu(playerid, 0);
		    SelectTextDraw(playerid, COLOR_RED);
		}
	}

	#if defined wm_OnPlayerSpawn
		return wm_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn wm_OnPlayerSpawn
#if defined wm_OnPlayerSpawn
	forward wm_OnPlayerSpawn(playerid);
#endif
