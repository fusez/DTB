ac_CheckPlayerMoney(playerid)
{
	if(IsPlayerSpawned(playerid))
	{
		new client_money = GetPlayerMoney(playerid),
		    ac_money = ac_GetPlayerMoney(playerid);

		if(client_money > ac_money)
		{
			if(g_acMoneyWarnings{playerid} >= MAX_AC_MONEY_WARNINGS)
			{
				new reason[40];
				format(reason, sizeof reason,
					"Money Hacks ($%i)", client_money
				);
				Ban(playerid, reason);
			}
			else
                g_acMoneyWarnings{playerid} ++;
		}
		else
			g_acMoneyWarnings{playerid} = 0;
	}
	else
		g_acMoneyWarnings{playerid} = 0;
}
