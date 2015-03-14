GetTeamHealth(teamid, &current_health, &max_health)
{
	for(new playerid, max_players = GetMaxPlayers(); playerid < max_players; playerid ++)
	{
		if( !IsPlayerConnected(playerid) )
			continue;

		if( g_PlayerTeam[playerid] != teamid )
			continue;

		max_health += 200;
		if( !g_PlayerRoundKilled{playerid} )
		{
			new Float:health,
			    Float:armour;

			ac_GetPlayerHealth(playerid, health);
			ac_GetPlayerArmour(playerid, armour);

			current_health += (floatround(health) + floatround(armour));
		}
	}
}
