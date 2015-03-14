SetMapID(mapid)
{
	new
		weatherid 	= GetMapWeather(mapid),
	    time 		= GetMapTime(mapid),
		mapname		[MAX_MAP_NAME + 1],
		cmd			[MAX_MAP_NAME + 9]
	;

	SetWeather(weatherid);
	SetWorldTime(time);

	GetMapName(mapname, sizeof mapname, mapid);
	format(cmd, sizeof cmd, "mapname %s", mapname);
	SendRconCommand(cmd);

	g_MapID = mapid;
}
