public OnPlayerLeaveTeam(playerid, teamid, reason)
{
	if(!g_IsBombPlanted && g_BombCarrierID == playerid)
	{
		if(g_IsBombBeingPlanted)
			CancelPlayerPlantingBomb(playerid);

		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
		CreateBombPickup(x, y, z);
	}
	else if(g_IsBombBeingDefused && g_BombDefuserID == playerid)
		CancelPlayerDefusingBomb(playerid);

	#if defined bomb_OnPlayerLeaveTeam
		bomb_OnPlayerLeaveTeam(playerid, teamid, reason);
	#endif
}
#if defined _ALS_OnPlayerLeaveTeam
	#undef OnPlayerLeaveTeam
#else
	#define _ALS_OnPlayerLeaveTeam
#endif
#define OnPlayerLeaveTeam bomb_OnPlayerLeaveTeam
#if defined bomb_OnPlayerLeaveTeam
	forward bomb_OnPlayerLeaveTeam(playerid, teamid, reason);
#endif
