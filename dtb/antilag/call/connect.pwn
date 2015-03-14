public OnPlayerConnect(playerid)
{
	g_AntilagBoxTD[playerid] =
	CreatePlayerTextDraw		(playerid, 569.0, 1.0, "_");
	PlayerTextDrawAlignment		(playerid, g_AntilagBoxTD[playerid], 2);
	PlayerTextDrawLetterSize	(playerid, g_AntilagBoxTD[playerid], 0.5, 1.1);
	PlayerTextDrawUseBox		(playerid, g_AntilagBoxTD[playerid], 1);
	PlayerTextDrawBoxColor		(playerid, g_AntilagBoxTD[playerid], 100);
	PlayerTextDrawTextSize		(playerid, g_AntilagBoxTD[playerid], 0.0, 139.0);

	g_PingTD[playerid] =
	CreatePlayerTextDraw			(playerid, 501.0, 2.0, "Ping:");
	PlayerTextDrawBackgroundColor	(playerid, g_PingTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_PingTD[playerid], 1);
	PlayerTextDrawLetterSize		(playerid, g_PingTD[playerid], 0.19, 0.899999);
	PlayerTextDrawColor				(playerid, g_PingTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_PingTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_PingTD[playerid], 1);

	g_FramerateTD[playerid] =
	CreatePlayerTextDraw			(playerid, 553.0, 2.0, "FPS:");
	PlayerTextDrawAlignment			(playerid, g_FramerateTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_FramerateTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_FramerateTD[playerid], 1);
	PlayerTextDrawLetterSize		(playerid, g_FramerateTD[playerid], 0.190000, 0.899999);
	PlayerTextDrawColor				(playerid, g_FramerateTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_FramerateTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_FramerateTD[playerid], 1);

	g_PacketlossTD[playerid] =
	CreatePlayerTextDraw			(playerid, 638.0, 2.0, "Packetloss:");
	PlayerTextDrawAlignment			(playerid, g_PacketlossTD[playerid], 3);
	PlayerTextDrawBackgroundColor	(playerid, g_PacketlossTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_PacketlossTD[playerid], 1);
	PlayerTextDrawLetterSize		(playerid, g_PacketlossTD[playerid], 0.19, 0.899999);
	PlayerTextDrawColor				(playerid, g_PacketlossTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_PacketlossTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_PacketlossTD[playerid], 1);

	PlayerTextDrawShow(playerid, g_PingTD[playerid]);
	PlayerTextDrawShow(playerid, g_FramerateTD[playerid]);
	PlayerTextDrawShow(playerid, g_PacketlossTD[playerid]);
	PlayerTextDrawShow(playerid, g_AntilagBoxTD[playerid]);

	#if defined al_OnPlayerConnect
		al_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect al_OnPlayerConnect
#if defined al_OnPlayerConnect
	forward al_OnPlayerConnect(playerid);
#endif
