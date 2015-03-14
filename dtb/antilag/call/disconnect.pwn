public OnPlayerDisconnect(playerid, reason)
{
	PlayerTextDrawDestroy(playerid, g_AntilagBoxTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PingTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_FramerateTD[playerid]);
	PlayerTextDrawDestroy(playerid, g_PacketlossTD[playerid]);

	g_PingWarnings			[playerid] = 0;
	g_FpsWarnings			[playerid] = 0;
	g_PacketLossWarnings	[playerid] = 0;
	g_AntilagBoxTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PingTD				[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_FramerateTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;
	g_PacketlossTD			[playerid] = PlayerText: INVALID_TEXT_DRAW;

	#if defined al_OnPlayerDisconnect
		return al_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect al_OnPlayerDisconnect
#if defined al_OnPlayerDisconnect
	forward al_OnPlayerDisconnect(playerid, reason);
#endif
