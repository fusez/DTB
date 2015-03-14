public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_BombProgressBackTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombProgressMaxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombProgressValueTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_BombTextTD[playerid]);

	g_BombProgressBackTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_BombProgressMaxTD		[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_BombProgressValueTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_BombTextTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;

	#if defined bomb_OnPlayerDisconnect
		return bomb_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect bomb_OnPlayerDisconnect
#if defined bomb_OnPlayerDisconnect
	forward bomb_OnPlayerDisconnect(playerid, reason);
#endif
