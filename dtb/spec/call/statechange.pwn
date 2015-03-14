public OnPlayerStateChange(playerid, newstate, oldstate)
{
	switch(newstate)
	{
		case PLAYER_STATE_DRIVER, PLAYER_STATE_PASSENGER:
		{
			SetPlayerArmedWeapon(playerid, 0);

			new vehicleid = GetPlayerVehicleID(playerid);
			for(new spectatorid, max_playerid = GetMaxPlayers(); spectatorid < max_playerid; spectatorid ++)
			{
				if(!IsPlayerConnected(spectatorid))
				    continue;

				if(!IsPlayerSpectating(spectatorid))
				    continue;

				if(GetPlayerSpectatePlayer(spectatorid) == playerid)
					PlayerSpectateVehicle(spectatorid, vehicleid);
			}
		}
		case PLAYER_STATE_ONFOOT:
		{
			for(new spectatorid, max_playerid = GetMaxPlayers(); spectatorid < max_playerid; spectatorid ++)
			{
				if(!IsPlayerConnected(spectatorid))
				    continue;

				if(!IsPlayerSpectating(spectatorid))
				    continue;

				if(GetPlayerSpectatePlayer(spectatorid) == playerid)
					PlayerSpectatePlayer(spectatorid, playerid);
			}
		}
		case PLAYER_STATE_SPECTATING:
		{
			new
				total_players,
				alive_players,
				dead_players
			;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			SetPlayerSpectateMap(playerid);

			for(new new_target, max_playerid = GetMaxPlayers(); new_target < max_playerid; new_target ++)
			{
				if(!IsPlayerConnected(new_target))
					continue;

				if(!IsPlayerSpawned(new_target))
				    continue;

				if(
					(g_PlayerTeam[playerid] == TEAM_ATTACK || g_PlayerTeam[playerid] == TEAM_DEFEND) &&
					g_PlayerTeam[playerid] != g_PlayerTeam[new_target] && alive_players > 0
				){
					continue;
				}

				PlayerSpectatePlayer(playerid, new_target);
				break;
			}
		}
	}

	#if defined spec_OnPlayerStateChange
		spec_OnPlayerStateChange(playerid, newstate, oldstate);
	#endif
}
#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange spec_OnPlayerStateChange
#if defined spec_OnPlayerStateChange
	forward spec_OnPlayerStateChange(playerid, newstate, oldstate);
#endif
