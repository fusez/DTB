public OnPlayerUpdate(playerid)
{
	static previous_tick[MAX_PLAYERS];
	if(GetTickCount() - previous_tick[playerid] > 500)
	{
		new bombsiteid;
		if(IsPlayerSpawned(playerid))
			bombsiteid = GetPlayerBombsite(playerid);
		else
			bombsiteid = INVALID_BOMBSITE_ID;

		if(bombsiteid != g_PlayerBombsite{playerid})
		{
			if(bombsiteid == INVALID_BOMBSITE_ID)
			{
				if(g_IsBombBeingPlanted && g_BombPlanterID == playerid)
					CancelPlayerPlantingBomb(playerid);
				else if(g_IsBombBeingDefused && g_BombDefuserID == playerid)
					CancelPlayerDefusingBomb(playerid);
				else
					PlayerTextDrawHide(playerid, g_BombTextTD[playerid]);
			}
			else
			{
				if(!g_IsBombPlanted && g_BombCarrierID == playerid)
				{
					PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "~r~Press ~w~~k~~VEHICLE_ENTER_EXIT~ ~r~to plant the bomb");
					PlayerTextDrawShow(playerid, g_BombTextTD[playerid]);
				}
				else if(g_IsBombPlanted && !g_IsBombDefused && g_PlayerTeam[playerid] == TEAM_DEFEND)
				{
					PlayerTextDrawSetString(playerid, g_BombTextTD[playerid], "~r~Press ~w~~k~~VEHICLE_ENTER_EXIT~ ~r~to defuse the bomb");
					PlayerTextDrawShow(playerid, g_BombTextTD[playerid]);
				}
			}
			g_PlayerBombsite{playerid} = bombsiteid;
		}
		previous_tick[playerid] = GetTickCount();
	}

	#if defined bomb_OnPlayerUpdate
		return bomb_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate bomb_OnPlayerUpdate
#if defined bomb_OnPlayerUpdate
	forward bomb_OnPlayerUpdate(playerid);
#endif
