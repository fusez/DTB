public OnGameModeExit()
{
	for(new column; column < 4; column ++)
		TextDrawDestroy(g_ScoreboardColumnTD[column]);

	for(new teamid; teamid < 2; teamid ++)
	{
		TextDrawDestroy(g_ScoreboardBoxTD[teamid]);
		TextDrawDestroy(g_ScoreboardRowTD[teamid]);
		TextDrawDestroy(g_ScoreboardTeamTD[teamid]);

		for(new slot; slot < MAX_TEAM_PLAYERS; slot ++)
		{
			TextDrawDestroy(g_ScoreboardPlayerTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardBombTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardHealthTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardScoreTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardDamageTD[teamid][slot]);
			TextDrawDestroy(g_ScoreboardAccuracyTD[teamid][slot]);
		}
	}

	#if defined sb_OnGameModeExit
		sb_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit sb_OnGameModeExit
#if defined sb_OnGameModeExit
	forward sb_OnGameModeExit();
#endif
