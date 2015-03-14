public OnGameEnd(reason)
{
	if(g_IsBombBeingPlanted)
		CancelPlayerPlantingBomb(g_BombPlanterID);
	if(g_IsBombBeingDefused)
		CancelPlayerDefusingBomb(g_BombDefuserID);

	#if defined bomb_OnGameEnd
		bomb_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd bomb_OnGameEnd
#if defined bomb_OnGameEnd
	forward bomb_OnGameEnd(reason);
#endif
