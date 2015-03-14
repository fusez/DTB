public OnGameModeInit()
{
	for(new teamid; teamid < 2; teamid ++)
	{
		g_TeamMaxHealthTD[teamid] =
		TextDrawCreate		(321.0, 437.0, "_");
		TextDrawLetterSize	(g_TeamMaxHealthTD[teamid], 0.0, 1.1);
		TextDrawUseBox		(g_TeamMaxHealthTD[teamid], 1);
		TextDrawBoxColor	(g_TeamMaxHealthTD[teamid], g_TeamColors[teamid] - 200);
		TextDrawTextSize	(g_TeamMaxHealthTD[teamid], TEAM_HEALTH_BAR_MAX[teamid], 0.0);

		g_TeamCurrentHealthTD[teamid] =
		TextDrawCreate		(321.0, 437.0, "_");
		TextDrawLetterSize	(g_TeamCurrentHealthTD[teamid], 0.0, 1.1);
		TextDrawUseBox		(g_TeamCurrentHealthTD[teamid], 1);
		TextDrawBoxColor	(g_TeamCurrentHealthTD[teamid], g_TeamColors[teamid]);
		TextDrawTextSize	(g_TeamCurrentHealthTD[teamid], TEAM_HEALTH_BAR_MIN[teamid], 0.0);

		switch(teamid)
		{
		    case TEAM_ATTACK:
			{
				g_TeamTextHealthTD[teamid] =
				TextDrawCreate		(318.0, 435.0, "0");
				TextDrawAlignment	(g_TeamTextHealthTD[teamid], 3);
			}
			case TEAM_DEFEND:
			{
				g_TeamTextHealthTD[teamid] =
				TextDrawCreate		(322.0, 435.0, "0");
				TextDrawAlignment	(g_TeamTextHealthTD[teamid], 1);
			}
		}
		TextDrawBackgroundColor	(g_TeamTextHealthTD[teamid], 255);
		TextDrawFont			(g_TeamTextHealthTD[teamid], 2);
		TextDrawLetterSize		(g_TeamTextHealthTD[teamid], 0.289999, 1.299999);
		TextDrawColor			(g_TeamTextHealthTD[teamid], COLOR_WHITE);
		TextDrawSetOutline		(g_TeamTextHealthTD[teamid], 0);
		TextDrawSetProportional	(g_TeamTextHealthTD[teamid], 1);
		TextDrawSetShadow		(g_TeamTextHealthTD[teamid], 1);
	}

	#if defined thtd_OnGameModeInit
		thtd_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit thtd_OnGameModeInit
#if defined thtd_OnGameModeInit
	forward thtd_OnGameModeInit();
#endif
