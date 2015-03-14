GetRandomMap()
{
	new
		maps = sizeof g_MapData,
		mapid = random(maps)
	;
	return mapid;
}
