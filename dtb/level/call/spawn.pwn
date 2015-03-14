public OnPlayerSpawn(playerid)
{
	ShowPlayerLevelTextdraws(playerid, true);

	#if defined level_OnPlayerSpawn
		return level_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn level_OnPlayerSpawn
#if defined level_OnPlayerSpawn
	forward level_OnPlayerSpawn(playerid);
#endif
