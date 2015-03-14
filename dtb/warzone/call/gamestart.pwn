public OnGameStart()
{
	for(new warzone; warzone < 4; warzone ++)
	{
		new Float:minx, Float:miny, Float:maxx, Float:maxy;
		GetZoneLimits(warzone, minx, miny, maxx, maxy);
		g_ZoneID[warzone] = GangZoneCreate(minx, miny, maxx, maxy);
		GangZoneShowForAll(g_ZoneID[warzone], WARZONE_ALPHA);
	}

	#if defined wz_OnGameStart
		wz_OnGameStart();
	#endif
}
#if defined _ALS_OnGameStart
	#undef OnGameStart
#else
	#define _ALS_OnGameStart
#endif
#define OnGameStart wz_OnGameStart
#if defined wz_OnGameStart
	forward wz_OnGameStart();
#endif
