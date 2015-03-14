public OnGameEnd(reason)
{
    g_NextMapID = GetRandomMap();
	g_NextMapLoaded = true;

	#if defined map_OnGameEnd
		map_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd map_OnGameEnd
#if defined map_OnGameEnd
	forward map_OnGameEnd(reason);
#endif
