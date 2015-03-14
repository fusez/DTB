public OnPlayerConnect(playerid)
{
	g_PlayerHealthTD[playerid] =
	CreatePlayerTextDraw			(playerid, 577.0, 66.0, "health");
	PlayerTextDrawAlignment			(playerid, g_PlayerHealthTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_PlayerHealthTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_PlayerHealthTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_PlayerHealthTD[playerid], 0.21, 1.0);
	PlayerTextDrawColor				(playerid, g_PlayerHealthTD[playerid], COLOR_WHITE);
	PlayerTextDrawSetOutline		(playerid, g_PlayerHealthTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_PlayerHealthTD[playerid], 1);

	g_PlayerArmourTD[playerid] =
	CreatePlayerTextDraw			(playerid, 577.0, 44.0, "armour");
	PlayerTextDrawAlignment			(playerid, g_PlayerArmourTD[playerid], 2);
	PlayerTextDrawBackgroundColor	(playerid, g_PlayerArmourTD[playerid], 255);
	PlayerTextDrawFont				(playerid, g_PlayerArmourTD[playerid], 2);
	PlayerTextDrawLetterSize		(playerid, g_PlayerArmourTD[playerid], 0.21, 1.0);
	PlayerTextDrawColor				(playerid, g_PlayerArmourTD[playerid], COLOR_WHITE);
	PlayerTextDrawSetOutline		(playerid, g_PlayerArmourTD[playerid], 1);
	PlayerTextDrawSetProportional	(playerid, g_PlayerArmourTD[playerid], 1);

	#if defined phtd_OnPlayerConnect
		phtd_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect phtd_OnPlayerConnect
#if defined phtd_OnPlayerConnect
	forward phtd_OnPlayerConnect(playerid);
#endif
