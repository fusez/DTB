public OnSecondPassed()
{
	if(g_GameState == STATE_STARTED && g_GameTime > 0)
	{
		for(new teamid; teamid < 2; teamid ++)
			UpdateTeamPlayersTextdraws(teamid);
	}

	#if defined tptd_OnSecondPassed
		tptd_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed tptd_OnSecondPassed
#if defined tptd_OnSecondPassed
	forward tptd_OnSecondPassed();
#endif
