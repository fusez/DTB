Float:GetPlayerDistanceToSite(playerid, bombsiteid)
{
	new mapid = g_MapID,
		Float:x,
		Float:y,
		Float:z,
		Float:rx,
		Float:ry,
		Float:rz,
		Float:distance;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);
	GetMapBombsiteRot(mapid, bombsiteid, rx, ry, rz);
	x -= (1.5 * floatsin(-rz, degrees));
	y -= (1.5 * floatcos(-rz, degrees));
	distance = GetPlayerDistanceFromPoint(playerid, x, y, z);
	return distance;
}

GetPlayerBombsite(playerid)
{
	for(new bombsiteid; bombsiteid < 2; bombsiteid ++)
	{
		if(g_IsBombsiteCreated{bombsiteid} && GetPlayerDistanceToSite(playerid, bombsiteid) < 1.5)
		    return bombsiteid;
	}
	return INVALID_BOMBSITE_ID;
}
