GetZoneLimits(direction, &Float:minx, &Float:miny, &Float:maxx, &Float:maxy)
{
	new Float:map_minx, Float:map_miny, Float:map_maxx, Float:map_maxy;
	GetMapLimits(g_MapID, map_minx, map_miny, map_maxx, map_maxy);

	switch(direction)
	{
		case ZONE_WEST:
		{
			minx = MIN_WARZONE_LIMIT;
			miny = MIN_WARZONE_LIMIT;
			maxx = map_minx;
			maxy = MAX_WARZONE_LIMIT;
		}
		case ZONE_EAST:
		{
			minx = map_maxx;
			miny = MIN_WARZONE_LIMIT;
			maxx = MAX_WARZONE_LIMIT;
			maxy = MAX_WARZONE_LIMIT;
		}
		case ZONE_NORTH:
		{
			minx = map_minx;
			miny = map_maxy;
			maxx = map_maxx;
			maxy = MAX_WARZONE_LIMIT;
		}
		case ZONE_SOUTH:
		{
			minx = map_minx;
			miny = MIN_WARZONE_LIMIT;
			maxx = map_maxx;
			maxy = map_miny;
		}
		default:
		    return 0;
	}
	return 1;
}
