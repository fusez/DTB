public OnSecondPassed()
{
	if(g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		for(new warzone; warzone < 4; warzone ++)
			GangZoneDestroy(g_ZoneID[warzone]);
	}

	#if defined wz_OnSecondPassed
		wz_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed wz_OnSecondPassed
#if defined wz_OnSecondPassed
	forward wz_OnSecondPassed();
#endif
