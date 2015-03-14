ShowPlayerBombIcon(playerid, bool:show)
{
	if(show)
	{
		new Float:x, Float:y, Float:z;
		GetBombPickupPos(x, y, z);
		SetPlayerMapIcon(playerid, 2, x, y, z, 0, COLOR_GREEN, MAPICON_GLOBAL);
	}
	else
		RemovePlayerMapIcon(playerid, 2);
}

ShowTeamBombIcon(teamid, bool:show)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(IsPlayerConnected(playerid) && g_PlayerTeam[playerid] == teamid)
			ShowPlayerBombIcon(playerid, show);
	}
}
