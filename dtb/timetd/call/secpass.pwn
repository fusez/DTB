public OnSecondPassed()
{
	switch(g_GameState)
	{
		case STATE_COUNTDOWN:
		{
			if(g_GameTime > 0)
			{
				new string[3];
				format(string, sizeof string, "%i", g_GameTime);
				TextDrawSetString(g_GameTimeTD, string);
			}
			else
				TextDrawSetString(g_GameTimeTD, "go!");
		}
		case STATE_STARTED:
		{
			if(g_GameTime > 0)
			{
				if(g_IsBombPlanted && !g_IsBombDefused)
				{
					new string[6];
					format(string, sizeof string, "~r~%i", g_GameTime);
					TextDrawSetString(g_GameTimeTD, string);
				}
				else
				{
					new minutes,
						seconds = g_GameTime,
						string[6];

					while(seconds >= 60)
					{
						minutes ++;
						seconds -= 60;
					}

					format(string, sizeof(string), "%02i:%02i", minutes, seconds);
					TextDrawSetString(g_GameTimeTD, string);
				}
			}
			else
			    TextDrawSetString(g_GameTimeTD, "intermission");
		}
		case STATE_FINISHED:
		{
			new mapname[MAX_MAP_NAME + 1];
			GetMapName(mapname, sizeof mapname, g_NextMapID);

			if(g_GameTime > 0)
			{
				new string[MAX_MAP_NAME + 35];
				format(string, sizeof string, "~w~loading ~r~%s~w~ in %i seconds...", mapname, g_GameTime);
				TextDrawSetString(g_GameTimeTD, string);
			}
			else
			{
				new string[MAX_MAP_NAME + 21];
				format(string, sizeof string, "~w~loading ~r~%s~w~...", mapname, g_GameTime);
				TextDrawSetString(g_GameTimeTD, string);
			}
		}
	}
	TextDrawShowForAll(g_GameTimeTD);

	#if defined ttd_OnSecondPassed
		ttd_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed ttd_OnSecondPassed
#if defined ttd_OnSecondPassed
	forward ttd_OnSecondPassed();
#endif
