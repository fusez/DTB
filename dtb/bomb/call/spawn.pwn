public OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch(teamid)
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	    {
			// Preload Bomb Anim
			PreloadAnimLib(playerid, "BOMBER");

			// Attached Bomb
			if(g_BombCarrierID != playerid)
				UnattachBombFromPlayer(playerid);

			// Bombsite Mapicons
			for(new bombsite; bombsite < 2; bombsite ++)
				ShowPlayerBombsiteIcon(playerid, bombsite, g_IsBombsiteCreated{bombsite});

			// Bomb Icon for Attackers
			if(teamid == TEAM_ATTACK && g_BombPickupID != INVALID_PICKUP_ID)
				ShowPlayerBombIcon(playerid, true);
			else
				ShowPlayerBombIcon(playerid, false);
		}
	}

	#if defined bomb_OnPlayerSpawn
		return bomb_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn bomb_OnPlayerSpawn
#if defined bomb_OnPlayerSpawn
	forward bomb_OnPlayerSpawn(playerid);
#endif
