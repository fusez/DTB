GetMapCenter(mapid, &Float:x, &Float:y)
{
	new
		Float:minx,
		Float:miny,
		Float:maxx,
		Float:maxy
	;

    GetMapLimits(mapid, minx, miny, maxx, maxy);
	x = minx + (0.5 * (maxx - minx));
	y = miny + (0.5 * (maxy - miny));
}
