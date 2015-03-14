public OnPlayerUpdate(playerid)
{
	static
		last_lr[MAX_PLAYERS]
	;

	new keys,
	    ud,
	    lr;

	GetPlayerKeys(playerid, keys, ud, lr);

	if(IsPlayerSpectating(playerid) && lr != last_lr[playerid])
	{
		if(lr == KEY_LEFT)
		{
			new
				current_target = GetPlayerSpectatePlayer(playerid),
				start_browse_index,
				total_players,
				alive_players,
				dead_players
			;

			if(current_target == INVALID_PLAYER_ID)
				start_browse_index = GetMaxPlayers();
			else
                start_browse_index = current_target - 1;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			for(new new_target = start_browse_index; new_target >= 0; new_target --)
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
		else if(lr == KEY_RIGHT)
		{
			new
				current_target = GetPlayerSpectatePlayer(playerid),
				start_browse_index,
                total_players,
				alive_players,
				dead_players
			;

			if(current_target == INVALID_PLAYER_ID)
				start_browse_index = 0;
			else
                start_browse_index = current_target + 1;

			GetTeamPlayers(g_PlayerTeam[playerid], total_players, alive_players, dead_players);

			for(new new_target = start_browse_index, max_playerid = GetMaxPlayers(); new_target < max_playerid; new_target ++)
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

    last_lr[playerid] = lr;

	#if defined spec_OnPlayerUpdate
		return spec_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate spec_OnPlayerUpdate
#if defined spec_OnPlayerUpdate
	forward spec_OnPlayerUpdate(playerid);
#endif
