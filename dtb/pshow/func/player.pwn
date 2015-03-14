ShowPlayerForPlayer(playerid, forplayerid, bool:show)
{
	if(show)
	{
		SetPlayerMarkerForPlayer(forplayerid, playerid, GetPlayerColor(playerid));
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 1);
	}
	else
	{
		SetPlayerMarkerForPlayer(forplayerid, playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
		ShowPlayerNameTagForPlayer(forplayerid, playerid, 0);
	}
}
