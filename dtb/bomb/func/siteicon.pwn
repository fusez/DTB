ShowPlayerBombsiteIcon(playerid, bombsiteid, bool:show)
{
	if(show)
	{
		new mapid = g_MapID,
			color = g_SiteColors[bombsiteid],
			Float:x,
			Float:y,
			Float:z;

		GetMapBombsitePos(mapid, bombsiteid, x, y, z);
		SetPlayerMapIcon(playerid, bombsiteid, x, y, z, 0, color, MAPICON_GLOBAL);
	}
	else
		RemovePlayerMapIcon(playerid, bombsiteid);
}

CreateBombsiteIcon(bombsiteid)
{
	g_IsBombsiteCreated{bombsiteid} = true;
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(IsPlayerConnected(playerid))
			ShowPlayerBombsiteIcon(playerid, bombsiteid, true);
	}
}

DestroyBombsiteIcon(bombsiteid)
{
	g_IsBombsiteCreated{bombsiteid} = false;
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(IsPlayerConnected(playerid))
			ShowPlayerBombsiteIcon(playerid, bombsiteid, false);
	}
}
