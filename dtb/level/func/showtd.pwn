ShowPlayerLevelTextdraws(playerid, bool:show)
{
	if(show)
	{
		UpdatePlayerLevelTextdraws(playerid, true);

		PlayerTextDrawShow(playerid, g_PlayerLevelBoxTD		[playerid]);
		PlayerTextDrawShow(playerid, g_PlayerXPMaxTD		[playerid]);
		PlayerTextDrawShow(playerid, g_PlayerLevelTextTD	[playerid]);
		PlayerTextDrawShow(playerid, g_PlayerXPTextTD		[playerid]);
	}
	else
	{
		PlayerTextDrawHide(playerid, g_PlayerLevelBoxTD		[playerid]);
		PlayerTextDrawHide(playerid, g_PlayerXPMaxTD		[playerid]);
		PlayerTextDrawHide(playerid, g_PlayerXPProgressTD	[playerid]);
		PlayerTextDrawHide(playerid, g_PlayerLevelTextTD	[playerid]);
		PlayerTextDrawHide(playerid, g_PlayerXPTextTD		[playerid]);
	}
}
