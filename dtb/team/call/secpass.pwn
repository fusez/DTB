public OnSecondPassed()
{
	if(g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		for(new playerid; playerid < MAX_PLAYERS; playerid ++)
			g_PlayerTeam[playerid] = TEAM_NONE;
	}

	#if defined team_OnSecondPassed
		team_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed team_OnSecondPassed
#if defined team_OnSecondPassed
	forward team_OnSecondPassed();
#endif
