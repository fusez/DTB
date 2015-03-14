public OnGameStart()
{
	new mapid;
	if(g_NextMapLoaded)
	    mapid = g_NextMapID;
	else
		mapid = GetRandomMap();
	SetMapID(mapid);

	#if defined map_OnGameStart
		map_OnGameStart();
	#endif
}
#if defined _ALS_OnGameStart
	#undef OnGameStart
#else
	#define _ALS_OnGameStart
#endif
#define OnGameStart map_OnGameStart
#if defined map_OnGameStart
	forward map_OnGameStart();
#endif
