GetMapBombsitePos(mapid, bombsiteid, &Float:x, &Float:y, &Float:z)
{
	switch(bombsiteid)
	{
		case BOMBSITE_A:
		{
			x = g_MapData[mapid][e_MapBombsiteA][0];
			y = g_MapData[mapid][e_MapBombsiteA][1];
			z = g_MapData[mapid][e_MapBombsiteA][2];
		}
		case BOMBSITE_B:
		{
			x = g_MapData[mapid][e_MapBombsiteB][0];
			y = g_MapData[mapid][e_MapBombsiteB][1];
			z = g_MapData[mapid][e_MapBombsiteB][2];
		}
	}
}
