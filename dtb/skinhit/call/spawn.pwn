public OnPlayerSpawn(playerid)
{
	SetPlayerTeam(playerid, 0);

	#if defined sh_OnPlayerSpawn
		return sh_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn sh_OnPlayerSpawn
#if defined sh_OnPlayerSpawn
	forward sh_OnPlayerSpawn(playerid);
#endif
