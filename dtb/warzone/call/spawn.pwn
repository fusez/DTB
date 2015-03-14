public OnPlayerSpawn(playerid)
{
	for(new warzone; warzone < 4; warzone ++)
		GangZoneShowForPlayer(playerid, g_ZoneID[warzone], WARZONE_ALPHA);

	#if defined wz_OnPlayerSpawn
		return wz_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn wz_OnPlayerSpawn
#if defined wz_OnPlayerSpawn
	forward wz_OnPlayerSpawn(playerid);
#endif
