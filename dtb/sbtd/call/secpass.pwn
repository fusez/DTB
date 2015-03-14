public OnSecondPassed()
{
	if(g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(IsPlayerConnected(playerid))
				PlayerTextDrawHide(playerid, g_pScoreboardResultTD[playerid]);
		}

		for(new column; column < 4; column ++)
			TextDrawHideForAll(g_ScoreboardColumnTD[column]);

		for(new teamid; teamid < 2; teamid ++)
		{
			TextDrawHideForAll(g_ScoreboardBoxTD[teamid]);
			TextDrawHideForAll(g_ScoreboardRowTD[teamid]);
			TextDrawHideForAll(g_ScoreboardTeamTD[teamid]);

			for(new slot; slot < MAX_TEAM_PLAYERS; slot ++)
			{
				TextDrawHideForAll(g_ScoreboardPlayerTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardBombTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardHealthTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardScoreTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardDamageTD[teamid][slot]);
				TextDrawHideForAll(g_ScoreboardAccuracyTD[teamid][slot]);
			}
		}
	}

	#if defined sb_OnSecondPassed
		sb_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed sb_OnSecondPassed
#if defined sb_OnSecondPassed
	forward sb_OnSecondPassed();
#endif
