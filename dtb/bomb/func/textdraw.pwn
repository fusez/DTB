SetPlayerBombProgressTextdraw(playerid, Float:progress)
{
	if(progress < 0.0)
	    progress = 0.0;
	else if(progress > 1.0)
	    progress = 1.0;

	new Float:min_size = 259.0,
		Float:max_size = 379.0,
		Float:offset_size = max_size - min_size,
		Float:final_size = min_size + (progress * offset_size);

	PlayerTextDrawTextSize	(playerid, g_BombProgressValueTD[playerid], final_size, 0.0);
	PlayerTextDrawShow		(playerid, g_BombProgressValueTD[playerid]);
}

ShowPlayerBombProgressTextdraw(playerid)
{
	PlayerTextDrawShow(playerid, g_BombProgressBackTD[playerid]);
	PlayerTextDrawShow(playerid, g_BombProgressMaxTD[playerid]);
}

HidePlayerBombProgressTextdraw(playerid)
{
	PlayerTextDrawHide(playerid, g_BombProgressBackTD[playerid]);
	PlayerTextDrawHide(playerid, g_BombProgressMaxTD[playerid]);
	PlayerTextDrawHide(playerid, g_BombProgressValueTD[playerid]);
}
