UpdatePlayerLevelTextdraws(playerid, bool:level)
{
	if(level)
	{
		new string[10];
		format(string, sizeof string, "Level: %i", g_PlayerLevel{playerid} + 1);
		PlayerTextDrawSetString(playerid, g_PlayerLevelTextTD[playerid], string);
	}

	new
		player_level = g_PlayerLevel{playerid},
		player_xp = g_PlayerXP[playerid],
		level_xp = GetLevelXP(player_level),
		Float:progress = float(player_xp) / float(level_xp),
		Float:final_value = MIN_XP_VALUE + (progress * OFFSET_XP_VALUE),
		string[13]
	;

	format(string, sizeof string, "%i / %i xp", player_xp, level_xp);

	PlayerTextDrawSetString(playerid, g_PlayerXPTextTD[playerid], string);
	PlayerTextDrawTextSize(playerid, g_PlayerXPProgressTD[playerid], final_value, 0.0);
	PlayerTextDrawShow(playerid, g_PlayerXPProgressTD[playerid]);
}
