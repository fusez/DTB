UpdateObjectiveTextdraws(bombsiteid)
{
	if(g_GameState == STATE_COUNTDOWN)
	{
		if(bombsiteid == BOMBSITE_A)
		{
			TextDrawSetString(g_ObjectiveTD[TEAM_ATTACK],
				"~w~You have joined the ~r~Attackers~w~. Plant the ~g~bomb~w~ at the ~y~yellow bombsite~w~..."
			);

			TextDrawSetString(g_ObjectiveTD[TEAM_DEFEND],
				"~w~You have joined the ~b~Defenders~w~. Defend the ~y~yellow bombsite~w~..."
			);
		}
		else if(bombsiteid == BOMBSITE_B)
		{
			TextDrawSetString(g_ObjectiveTD[TEAM_ATTACK],
				"~w~...Or the ~p~purple bombsite~w~!"
			);

			TextDrawSetString(g_ObjectiveTD[TEAM_DEFEND],
				"~w~...And the ~p~purple bombsite~w~!"
			);
		}
	}
	else if(g_GameState == STATE_STARTED && g_IsBombPlanted)
	{
		if(bombsiteid == BOMBSITE_A)
		{
			TextDrawSetString(g_ObjectiveTD[TEAM_ATTACK],
				"~w~The bomb has been planted at the ~y~yellow bombsite~w~! Defend it!"
			);

			TextDrawSetString(g_ObjectiveTD[TEAM_DEFEND],
				"~w~The bomb has been planted at the ~y~yellow bombsite~w~! Defuse it!"
			);
		}
		else if(bombsiteid == BOMBSITE_B)
		{
			TextDrawSetString(g_ObjectiveTD[TEAM_ATTACK],
				"~w~The bomb has been planted at the ~p~purple bombsite~w~! Defend it!"
			);

			TextDrawSetString(g_ObjectiveTD[TEAM_DEFEND],
				"~w~The bomb has been planted at the ~p~purple bombsite~w~! Defuse it!"
			);
		}
	}
}
