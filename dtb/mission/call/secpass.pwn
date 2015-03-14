public OnSecondPassed()
{
	if(g_GameState == STATE_COUNTDOWN)
	{
		if(g_GameTime == 10)
		{
			g_ObjectiveBombsite = BOMBSITE_A;
			UpdateObjectiveTextdraws(g_ObjectiveBombsite);
		}
		else if(g_GameTime == 5)
		{
			g_ObjectiveBombsite = BOMBSITE_B;
			UpdateObjectiveTextdraws(g_ObjectiveBombsite);

			for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
			{
				if(!IsPlayerConnected(playerid))
					continue;

				if(!IsPlayerSpawned(playerid))
					continue;

				ShowPlayerObjectiveTextdraw(playerid);
				SetPlayerCameraAtBombsite(playerid, g_ObjectiveBombsite);
			}
		}
		else if(g_GameTime == 0)
		{
			g_ObjectiveBombsite = BOMBSITE_A;

			for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
			{
				if(!IsPlayerConnected(playerid))
					continue;

				HidePlayerObjectiveTextdraw(playerid);
				if(IsPlayerSpawned(playerid))
					SetCameraBehindPlayer(playerid);
			}
		}
	}
	else if(g_IsObjectiveShown && (gettime() - g_ObjectiveShownTime) >= 5)
	{
		g_IsObjectiveShown = false;

		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(!IsPlayerConnected(playerid))
				continue;

			HidePlayerObjectiveTextdraw(playerid);
			if(!IsPlayerSpawned(playerid))
				continue;

			TogglePlayerControllable(playerid, true);
			SetCameraBehindPlayer(playerid);
		}
	}

	#if defined objective_OnSecondPassed
		objective_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed objective_OnSecondPassed
#if defined objective_OnSecondPassed
	forward objective_OnSecondPassed();
#endif
