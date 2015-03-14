public OnPlayerConnect(playerid)
{
	g_PlayerLevelBoxTD[playerid] =
	CreatePlayerTextDraw			(playerid, 498.0, 79.0, "_");
	PlayerTextDrawLetterSize		(playerid, g_PlayerLevelBoxTD[playerid], 0.0, 2.6);
	PlayerTextDrawUseBox			(playerid, g_PlayerLevelBoxTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_PlayerLevelBoxTD[playerid], 255);
	PlayerTextDrawTextSize			(playerid, g_PlayerLevelBoxTD[playerid], 607.0, 0.0);

	g_PlayerXPMaxTD[playerid] =
	CreatePlayerTextDraw			(playerid, 500.0, 92.0, "_");
	PlayerTextDrawLetterSize		(playerid, g_PlayerXPMaxTD[playerid], 0.0, 0.9);
	PlayerTextDrawUseBox			(playerid, g_PlayerXPMaxTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_PlayerXPMaxTD[playerid], COLOR_WHITE - 150);
	PlayerTextDrawTextSize			(playerid, g_PlayerXPMaxTD[playerid], MAX_XP_VALUE, 0.0);

	g_PlayerXPProgressTD[playerid] =
	CreatePlayerTextDraw			(playerid, 500.0, 92.0, "_");
	PlayerTextDrawLetterSize		(playerid, g_PlayerXPProgressTD[playerid], 0.0, 0.9);
	PlayerTextDrawUseBox			(playerid, g_PlayerXPProgressTD[playerid], 1);
	PlayerTextDrawBoxColor			(playerid, g_PlayerXPProgressTD[playerid], COLOR_WHITE);
	PlayerTextDrawTextSize			(playerid, g_PlayerXPProgressTD[playerid], MIN_XP_VALUE, 0.0);

	g_PlayerLevelTextTD[playerid] =
	CreatePlayerTextDraw			(playerid, 499.0, 77.0, "Level");
	PlayerTextDrawFont				(playerid, g_PlayerLevelTextTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_PlayerLevelTextTD[playerid], 0.23, 1.3);
	PlayerTextDrawColor				(playerid, g_PlayerLevelTextTD[playerid], -1);
	PlayerTextDrawSetProportional	(playerid, g_PlayerLevelTextTD[playerid], 1);

	g_PlayerXPTextTD[playerid] =
	CreatePlayerTextDraw			(playerid, 553.0, 90.0, "XP");
	PlayerTextDrawAlignment			(playerid, g_PlayerXPTextTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_PlayerXPTextTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_PlayerXPTextTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_PlayerXPTextTD[playerid], 0.21, 1.2);
	PlayerTextDrawColor				(playerid, g_PlayerXPTextTD[playerid], -1);
	PlayerTextDrawSetOutline		(playerid, g_PlayerXPTextTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_PlayerXPTextTD[playerid], 1);

	#if defined level_OnPlayerConnect
		level_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect level_OnPlayerConnect
#if defined level_OnPlayerConnect
	forward level_OnPlayerConnect(playerid);
#endif
