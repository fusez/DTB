SetPlayerSpectateMap(playerid)
{
	new
		mapid = g_MapID,
		interiorid = GetMapInterior(mapid),
		Float:midx,
		Float:midy,
		Float:x,
		Float:y,
		Float:z
	;

	GetMapCenter(mapid, midx, midy);

	switch(random(4))
	{
		case 0:
			GetMapBombsitePos(mapid, BOMBSITE_A, x, y, z);
		case 1:
			GetMapBombsitePos(mapid, BOMBSITE_B, x, y, z);
		case 2:
			GetMapSpawnPos(mapid, TEAM_ATTACK, x, y, z);
		case 3:
			GetMapSpawnPos(mapid, TEAM_DEFEND, x, y, z);
	}

	SetPlayerCameraPos(playerid, x, y, z + 50.0);
	SetPlayerCameraLookAt(playerid, midx, midy, z);
	SetPlayerInterior(playerid, interiorid);
}
