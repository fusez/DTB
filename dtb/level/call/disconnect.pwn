public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy	(playerid, g_PlayerLevelBoxTD	[playerid]);
	PlayerTextDrawDestroy	(playerid, g_PlayerXPMaxTD		[playerid]);
	PlayerTextDrawDestroy	(playerid, g_PlayerXPProgressTD	[playerid]);
	PlayerTextDrawDestroy	(playerid, g_PlayerLevelTextTD 	[playerid]);
	PlayerTextDrawDestroy	(playerid, g_PlayerXPTextTD		[playerid]);

	g_PlayerLevel			{playerid} = 0;
	g_PlayerXP				[playerid] = 0;
	g_PlayerLevelBoxTD		[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPMaxTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPProgressTD	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerLevelTextTD 	[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PlayerXPTextTD		[playerid] = PlayerText: INVALID_TEXT_DRAW;

	#if defined level_OnPlayerDisconnect
		return level_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect level_OnPlayerDisconnect
#if defined level_OnPlayerDisconnect
	forward level_OnPlayerDisconnect(playerid, reason);
#endif
