public OnGameModeInit()
{
	for(new teamid; teamid < 2; teamid ++)
	{
		switch(teamid)
		{
		    case TEAM_ATTACK:
				g_ScoreboardBoxTD[teamid] = TextDrawCreate(320.0, 130.0, "_");
			case TEAM_DEFEND:
				g_ScoreboardBoxTD[teamid] = TextDrawCreate(320.0, 253.0, "_");
		}
		TextDrawAlignment		(g_ScoreboardBoxTD[teamid], 2);
		TextDrawBackgroundColor	(g_ScoreboardBoxTD[teamid], 255);
		TextDrawFont			(g_ScoreboardBoxTD[teamid], 1);
		TextDrawLetterSize		(g_ScoreboardBoxTD[teamid], 0.5, 10.899996);
		TextDrawColor			(g_ScoreboardBoxTD[teamid], -1);
		TextDrawSetOutline		(g_ScoreboardBoxTD[teamid], 0);
		TextDrawSetProportional	(g_ScoreboardBoxTD[teamid], 1);
		TextDrawSetShadow		(g_ScoreboardBoxTD[teamid], 1);
		TextDrawUseBox			(g_ScoreboardBoxTD[teamid], 1);
		TextDrawBoxColor		(g_ScoreboardBoxTD[teamid], g_TeamColors[teamid] - 155);
		TextDrawTextSize		(g_ScoreboardBoxTD[teamid], 0.0, 299.0);
		TextDrawSetSelectable	(g_ScoreboardBoxTD[teamid], 0);

		switch(teamid)
		{
		    case TEAM_ATTACK:
				g_ScoreboardRowTD[teamid] = TextDrawCreate(320.0, 119.0, "_");
			case TEAM_DEFEND:
				g_ScoreboardRowTD[teamid] = TextDrawCreate(320.0, 242.0, "_");
		}
		TextDrawAlignment		(g_ScoreboardRowTD[teamid], 2);
		TextDrawBackgroundColor	(g_ScoreboardRowTD[teamid], 255);
		TextDrawFont			(g_ScoreboardRowTD[teamid], 2);
		TextDrawLetterSize		(g_ScoreboardRowTD[teamid], 0.509998, 0.899997);
		TextDrawColor			(g_ScoreboardRowTD[teamid], -1);
		TextDrawSetOutline		(g_ScoreboardRowTD[teamid], 0);
		TextDrawSetProportional	(g_ScoreboardRowTD[teamid], 1);
		TextDrawSetShadow		(g_ScoreboardRowTD[teamid], 2);
		TextDrawUseBox			(g_ScoreboardRowTD[teamid], 1);
		TextDrawBoxColor		(g_ScoreboardRowTD[teamid], 150);
		TextDrawTextSize		(g_ScoreboardRowTD[teamid], 0.0, 299.0);
		TextDrawSetSelectable	(g_ScoreboardRowTD[teamid], 0);

		switch(teamid)
		{
			case 0:
				g_ScoreboardTeamTD[teamid] = TextDrawCreate(170.0, 118.0, g_TeamNames[teamid]);
			case 1:
				g_ScoreboardTeamTD[teamid] = TextDrawCreate(170.0, 240.0, g_TeamNames[teamid]);
		}
		TextDrawBackgroundColor	(g_ScoreboardTeamTD[teamid], 255);
		TextDrawFont			(g_ScoreboardTeamTD[teamid], 1);
		TextDrawLetterSize		(g_ScoreboardTeamTD[teamid], 0.209998, 1.0);
		TextDrawColor			(g_ScoreboardTeamTD[teamid], g_TeamColors[teamid]);
		TextDrawSetOutline		(g_ScoreboardTeamTD[teamid], 0);
		TextDrawSetProportional	(g_ScoreboardTeamTD[teamid], 1);
		TextDrawSetShadow		(g_ScoreboardTeamTD[teamid], 1);
		TextDrawSetSelectable	(g_ScoreboardTeamTD[teamid], 0);

		for(new slot; slot < MAX_TEAM_PLAYERS; slot ++)
		{
			switch(teamid)
			{
				case TEAM_ATTACK:
				{
					g_ScoreboardPlayerTD[teamid][slot] =
					TextDrawCreate(170.0, 128.0 + (slot * 10.0), "Player");

					g_ScoreboardBombTD[teamid][slot] =
					TextDrawCreate(287.0, 128.0 + (slot * 10.0), "Bomb Planter");

					g_ScoreboardHealthTD[teamid][slot] =
					TextDrawCreate(345.0, 128.0 + (slot * 10.0), "Health");

					g_ScoreboardScoreTD[teamid][slot] =
					TextDrawCreate(377.0, 128.0 + (slot * 10.0), "Score");

					g_ScoreboardDamageTD[teamid][slot] =
					TextDrawCreate(400.0, 128.0 + (slot * 10.0), "Damage");

					g_ScoreboardAccuracyTD[teamid][slot] =
					TextDrawCreate(436.0, 128.0 + (slot * 10.0), "Accuracy");
				}
				case TEAM_DEFEND:
				{
					g_ScoreboardPlayerTD[teamid][slot] =
					TextDrawCreate(170.0, 251.0 + (slot * 10.0), "Player");

					g_ScoreboardBombTD[teamid][slot] =
					TextDrawCreate(287.0, 251.0 + (slot * 10.0), "Bomb Defuser");

					g_ScoreboardHealthTD[teamid][slot] =
					TextDrawCreate(345.0, 251.0 + (slot * 10.0), "Health");

					g_ScoreboardScoreTD[teamid][slot] =
					TextDrawCreate(377.0, 251.0 + (slot * 10.0), "Score");

					g_ScoreboardDamageTD[teamid][slot] =
					TextDrawCreate(400.0, 251.0 + (slot * 10.0), "Damage");

					g_ScoreboardAccuracyTD[teamid][slot] =
					TextDrawCreate(436.0, 251.0 + (slot * 10.0), "Accuracy");
				}
			}
			TextDrawBackgroundColor	(g_ScoreboardPlayerTD[teamid][slot], 255);
			TextDrawBackgroundColor	(g_ScoreboardBombTD[teamid][slot], 255);
			TextDrawBackgroundColor	(g_ScoreboardHealthTD[teamid][slot], 255);
			TextDrawBackgroundColor	(g_ScoreboardScoreTD[teamid][slot], 255);
			TextDrawBackgroundColor	(g_ScoreboardDamageTD[teamid][slot], 255);
			TextDrawBackgroundColor	(g_ScoreboardAccuracyTD[teamid][slot], 255);

			TextDrawFont			(g_ScoreboardPlayerTD[teamid][slot], 1);
			TextDrawFont			(g_ScoreboardBombTD[teamid][slot], 1);
			TextDrawFont			(g_ScoreboardHealthTD[teamid][slot], 1);
			TextDrawFont			(g_ScoreboardScoreTD[teamid][slot], 1);
			TextDrawFont			(g_ScoreboardDamageTD[teamid][slot], 1);
			TextDrawFont			(g_ScoreboardAccuracyTD[teamid][slot], 1);

			TextDrawLetterSize		(g_ScoreboardPlayerTD[teamid][slot], 0.209999, 1.0);
			TextDrawLetterSize		(g_ScoreboardBombTD[teamid][slot], 0.209999, 1.0);
			TextDrawLetterSize		(g_ScoreboardHealthTD[teamid][slot], 0.209999, 1.0);
			TextDrawLetterSize		(g_ScoreboardScoreTD[teamid][slot], 0.209999, 1.0);
			TextDrawLetterSize		(g_ScoreboardDamageTD[teamid][slot], 0.209999, 1.0);
			TextDrawLetterSize		(g_ScoreboardAccuracyTD[teamid][slot], 0.209999, 1.0);

			TextDrawColor			(g_ScoreboardPlayerTD[teamid][slot], -1);
			TextDrawColor			(g_ScoreboardBombTD[teamid][slot], -1);
			TextDrawColor			(g_ScoreboardHealthTD[teamid][slot], -1);
			TextDrawColor			(g_ScoreboardScoreTD[teamid][slot], -1);
			TextDrawColor			(g_ScoreboardDamageTD[teamid][slot], -1);
			TextDrawColor			(g_ScoreboardAccuracyTD[teamid][slot], -1);

			TextDrawSetOutline		(g_ScoreboardPlayerTD[teamid][slot], 0);
			TextDrawSetOutline		(g_ScoreboardBombTD[teamid][slot], 0);
			TextDrawSetOutline		(g_ScoreboardHealthTD[teamid][slot], 0);
			TextDrawSetOutline		(g_ScoreboardScoreTD[teamid][slot], 0);
			TextDrawSetOutline		(g_ScoreboardDamageTD[teamid][slot], 0);
			TextDrawSetOutline		(g_ScoreboardAccuracyTD[teamid][slot], 0);

			TextDrawSetProportional	(g_ScoreboardPlayerTD[teamid][slot], 1);
			TextDrawSetProportional	(g_ScoreboardBombTD[teamid][slot], 1);
			TextDrawSetProportional	(g_ScoreboardHealthTD[teamid][slot], 1);
			TextDrawSetProportional	(g_ScoreboardScoreTD[teamid][slot], 1);
			TextDrawSetProportional	(g_ScoreboardDamageTD[teamid][slot], 1);
			TextDrawSetProportional	(g_ScoreboardAccuracyTD[teamid][slot], 1);

			TextDrawSetShadow		(g_ScoreboardPlayerTD[teamid][slot], 1);
			TextDrawSetShadow		(g_ScoreboardBombTD[teamid][slot], 1);
			TextDrawSetShadow		(g_ScoreboardHealthTD[teamid][slot], 1);
			TextDrawSetShadow		(g_ScoreboardScoreTD[teamid][slot], 1);
			TextDrawSetShadow		(g_ScoreboardDamageTD[teamid][slot], 1);
			TextDrawSetShadow		(g_ScoreboardAccuracyTD[teamid][slot], 1);

			TextDrawSetSelectable	(g_ScoreboardPlayerTD[teamid][slot], 0);
			TextDrawSetSelectable	(g_ScoreboardBombTD[teamid][slot], 0);
			TextDrawSetSelectable	(g_ScoreboardHealthTD[teamid][slot], 0);
			TextDrawSetSelectable	(g_ScoreboardScoreTD[teamid][slot], 0);
			TextDrawSetSelectable	(g_ScoreboardDamageTD[teamid][slot], 0);
			TextDrawSetSelectable	(g_ScoreboardAccuracyTD[teamid][slot], 0);
		}
	}

	for(new column; column < 4; column ++)
	{
		switch(column)
		{
			case 0:
				g_ScoreboardColumnTD[column] = TextDrawCreate(345.0, 118.0, "Health");
			case 1:
				g_ScoreboardColumnTD[column] = TextDrawCreate(377.0, 118.0, "Score");
			case 2:
				g_ScoreboardColumnTD[column] = TextDrawCreate(400.0, 118.0, "Damage");
			case 3:
				g_ScoreboardColumnTD[column] = TextDrawCreate(436.0, 118.0, "Accuracy");
		}
		TextDrawBackgroundColor	(g_ScoreboardColumnTD[column], 255);
		TextDrawFont			(g_ScoreboardColumnTD[column], 1);
		TextDrawLetterSize		(g_ScoreboardColumnTD[column], 0.209998, 1.0);
		TextDrawColor			(g_ScoreboardColumnTD[column], -1);
		TextDrawSetOutline		(g_ScoreboardColumnTD[column], 0);
		TextDrawSetProportional	(g_ScoreboardColumnTD[column], 1);
		TextDrawSetShadow		(g_ScoreboardColumnTD[column], 1);
		TextDrawSetSelectable	(g_ScoreboardColumnTD[column], 0);
	}

	#if defined sb_OnGameModeInit
		sb_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit sb_OnGameModeInit
#if defined sb_OnGameModeInit
	forward sb_OnGameModeInit();
#endif
