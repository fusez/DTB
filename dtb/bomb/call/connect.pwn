public OnPlayerConnect(playerid)
{
	g_BombProgressBackTD[playerid] =
	CreatePlayerTextDraw		(playerid, 320.0, 403.0, "_");
	PlayerTextDrawAlignment		(playerid, g_BombProgressBackTD[playerid], 2);
	PlayerTextDrawLetterSize	(playerid, g_BombProgressBackTD[playerid], 0.0, 1.2);
	PlayerTextDrawUseBox		(playerid, g_BombProgressBackTD[playerid], 1);
	PlayerTextDrawBoxColor		(playerid, g_BombProgressBackTD[playerid], 255);
	PlayerTextDrawTextSize		(playerid, g_BombProgressBackTD[playerid], 0.0, 122.0);

	g_BombProgressMaxTD[playerid] =
	CreatePlayerTextDraw		(playerid, 261.0, 405.0, "_");
	PlayerTextDrawAlignment		(playerid, g_BombProgressMaxTD[playerid], 1);
	PlayerTextDrawLetterSize	(playerid, g_BombProgressMaxTD[playerid], 0.0, 0.7);
	PlayerTextDrawUseBox		(playerid, g_BombProgressMaxTD[playerid], 1);
	PlayerTextDrawBoxColor		(playerid, g_BombProgressMaxTD[playerid], COLOR_WHITE - 155);
	PlayerTextDrawTextSize		(playerid, g_BombProgressMaxTD[playerid], 379.0, 0.0);

	g_BombProgressValueTD[playerid] =
	CreatePlayerTextDraw		(playerid, 261.0, 405.0, "_");
	PlayerTextDrawAlignment		(playerid, g_BombProgressValueTD[playerid], 1);
	PlayerTextDrawLetterSize	(playerid, g_BombProgressValueTD[playerid], 0.0, 0.7);
	PlayerTextDrawUseBox		(playerid, g_BombProgressValueTD[playerid], 1);
	PlayerTextDrawBoxColor		(playerid, g_BombProgressValueTD[playerid], COLOR_WHITE);

	g_BombTextTD[playerid] =
	CreatePlayerTextDraw			(playerid, 320.0, 401.0, "Planting Bomb");
	PlayerTextDrawAlignment			(playerid, g_BombTextTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_BombTextTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_BombTextTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_BombTextTD[playerid], 0.26, 1.4);
	PlayerTextDrawColor				(playerid, g_BombTextTD[playerid], COLOR_WHITE);
	PlayerTextDrawSetOutline		(playerid, g_BombTextTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_BombTextTD[playerid], 1);

	#if defined bomb_OnPlayerConnect
		bomb_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect bomb_OnPlayerConnect
#if defined bomb_OnPlayerConnect
	forward bomb_OnPlayerConnect(playerid);
#endif
