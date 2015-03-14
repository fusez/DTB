GetMapLimits(mapid, &Float:minx, &Float:miny, &Float:maxx, &Float:maxy)
{
	minx = g_MapData[mapid][e_MapLimits][0];
	miny = g_MapData[mapid][e_MapLimits][1];
	maxx = g_MapData[mapid][e_MapLimits][2];
	maxy = g_MapData[mapid][e_MapLimits][3];
}
