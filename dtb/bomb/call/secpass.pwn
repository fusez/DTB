public OnSecondPassed()
{
	if(g_GameState == STATE_STARTED)
	{
		if(g_IsBombPlanted && !g_IsBombBeingDefused)
		{
			new mapid = g_MapID,
				bombsite = g_BombPlantSite,
				Float:x,
				Float:y,
				Float:z;

			GetMapBombsitePos(mapid, bombsite, x, y, z);
			if(g_GameTime > 5)
				PlaySoundForAll(21000, x, y, z);
			else
			{
				switch(g_GameTime)
				{
					case 5:
						PlaySoundForAll(7416, x, y, z);
					case 3:
						PlaySoundForAll(7417, x, y, z);
					case 2:
						PlaySoundForAll(7418, x, y, z);
					case 1:
						PlaySoundForAll(7419, x, y, z);
				}
			}
		}

		if(g_GameTime == 0)
		{
			if(g_IsBombPlanted)
			{
				EndGame(REASON_DESTROYED);

				if(g_IsBombExploding)
					KillTimer(g_BombExplodeTimer);
				else
					g_IsBombExploding = true;
				g_BombExplodeTimer = SetTimer("ExplodeBombsite", 200, true);
			}
			else
				EndGame(REASON_NO_PLANT);
		}
	}
	else if(g_GameState == STATE_FINISHED && g_GameTime == 0)
	{
		DestroyBombObject();
		DestroyBombPickup();

		for(new bombsite; bombsite < 2; bombsite ++)
		{
			DestroyBombsiteIcon(bombsite);
			DestroyBombsiteObjects(bombsite);
		}

		if(g_IsBombBeingPlanted)
		{
			g_IsBombBeingPlanted = false;
			KillTimer(g_BombPlantTimer);
		}

		if(g_IsBombBeingDefused)
		{
			g_IsBombBeingDefused = false;
			KillTimer(g_BombDefuseTimer);
		}

		if(g_IsBombExploding)
		{
		    g_IsBombExploding = false;
		    KillTimer(g_BombExplodeTimer);
		}

		g_IsBombPlanted = false;
		g_IsBombDefused = false;
		g_BombCarrierID = INVALID_PLAYER_ID;
		g_BombPlanterID = INVALID_PLAYER_ID;
		g_BombDefuserID = INVALID_PLAYER_ID;
	}

	#if defined bomb_OnSecondPassed
		bomb_OnSecondPassed();
	#endif
}
#if defined _ALS_OnSecondPassed
	#undef OnSecondPassed
#else
	#define _ALS_OnSecondPassed
#endif
#define OnSecondPassed bomb_OnSecondPassed
#if defined bomb_OnSecondPassed
	forward bomb_OnSecondPassed();
#endif
