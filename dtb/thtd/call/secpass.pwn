public OnSecondPassed()
{
	if(g_GameState == STATE_STARTED && g_GameTime > 0)
	{
		for(new teamid; teamid < 2; teamid ++)
			UpdateTeamHealthTextdraws(teamid);
	}

	#if defined thtd_OnSecondPassed
		thtd_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed thtd_OnSecondPassed
#if defined thtd_OnSecondPassed
	forward thtd_OnSecondPassed();
#endif
