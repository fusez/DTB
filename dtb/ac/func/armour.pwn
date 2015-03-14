ac_CheckPlayerArmour(playerid)
{
	if(IsPlayerSpawned(playerid))
	{
		new Float:client_armour,
		    Float:ac_armour;

		GetPlayerArmour(playerid, client_armour);
		ac_GetPlayerArmour(playerid, ac_armour);

		if(client_armour > ac_armour)
		{
			if(g_acArmourWarnings{playerid} >= MAX_AC_ARMOUR_WARNINGS || client_armour > 100.0)
			{
				new reason[40];
				format(reason, sizeof reason,
					"Armour Hacks (%.2f)", client_armour
				);
				Ban(playerid, reason);
			}
			else
				g_acArmourWarnings{playerid} ++;
		}
		else
			g_acArmourWarnings{playerid} = 0;
	}
	else
		g_acArmourWarnings{playerid} = 0;
}
