GetMapBombsiteRot(mapid, bombsiteid, &Float:rx, &Float:ry, &Float:rz)
{
	switch(bombsiteid)
	{
		case BOMBSITE_A:
		{
			rx = g_MapData[mapid][e_MapBombsiteA][3];
			ry = g_MapData[mapid][e_MapBombsiteA][4];
			rz = g_MapData[mapid][e_MapBombsiteA][5];
		}
		case BOMBSITE_B:
		{
			rx = g_MapData[mapid][e_MapBombsiteB][3];
			ry = g_MapData[mapid][e_MapBombsiteB][4];
			rz = g_MapData[mapid][e_MapBombsiteB][5];
		}
	}
}
