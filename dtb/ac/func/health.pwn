ac_CheckPlayerHealth(playerid)
{
	if(IsPlayerSpawned(playerid))
	{
		new Float:client_health,
		    Float:ac_health;

		GetPlayerHealth(playerid, client_health);
		ac_GetPlayerHealth(playerid, ac_health);

		if(client_health > ac_health)
		{
			if(g_acHealthWarnings{playerid} >= MAX_AC_HEALTH_WARNINGS || client_health > 100.0)
			{
				new reason[40];
				format(reason, sizeof reason,
					"Health Hacks (%.2f)", client_health
				);
				Ban(playerid, reason);
			}
			else
				g_acHealthWarnings{playerid} ++;
		}
		else
	    	g_acHealthWarnings{playerid} = 0;
	}
	else
	    g_acHealthWarnings{playerid} = 0;
}
