bool:IsPlayerInZone(playerid)
{
	new mapid = g_MapID,
		mapinterior = GetMapInterior(mapid),
		interior = GetPlayerInterior(playerid),
		Float:minx,
		Float:miny,
		Float:maxx,
		Float:maxy,
		Float:x,
		Float:y,
		Float:z;

	GetMapLimits(mapid, minx, miny, maxx, maxy);
	GetPlayerPos(playerid, x, y, z);
	if(x > minx && x < maxx && y > miny && y < maxy && interior == mapinterior)
		return true;
	return false;
}
