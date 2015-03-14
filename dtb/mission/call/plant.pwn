public OnBombPlanted(playerid, bombsiteid)
{
	g_IsObjectiveShown = true;
	g_ObjectiveShownTime = gettime();

	UpdateObjectiveTextdraws(bombsiteid);

	for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
	{
		if(!IsPlayerConnected(loop_playerid))
			continue;

		if(!IsPlayerSpawned(loop_playerid))
			continue;

		ShowPlayerObjectiveTextdraw(loop_playerid);
		SetPlayerCameraAtBombsite(loop_playerid, bombsiteid);
		TogglePlayerControllable(loop_playerid, false);
	}

	#if defined objective_OnBombPlanted
		objective_OnBombPlanted(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombPlanted
	#undef OnBombPlanted
#else
	#define _ALS_OnBombPlanted
#endif
#define OnBombPlanted objective_OnBombPlanted
#if defined objective_OnBombPlanted
	forward objective_OnBombPlanted(playerid, bombsiteid);
#endif
