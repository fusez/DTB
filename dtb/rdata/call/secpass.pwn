public OnSecondPassed()
{
	if(g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		for(new playerid; playerid < MAX_PLAYERS; playerid ++)
		{
			ResetPlayerRoundVariables(playerid);

			if(IsPlayerConnected(playerid))
			    SetPlayerScore(playerid, 0);
		}
	}

	#if defined rstats_OnSecondPassed
		rstats_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed rstats_OnSecondPassed
#if defined rstats_OnSecondPassed
	forward rstats_OnSecondPassed();
#endif
