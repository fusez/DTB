new bool: g_IsPlayerSelectingClass [MAX_PLAYERS char];

/******************************************************************************/

IsPlayerSpawned(playerid)
{
	switch(GetPlayerState(playerid))
	{
		case 1, 2, 3, 8:
			return 1;
		case 7:
			return (g_IsPlayerSelectingClass{playerid}) ? (0) : (1);
	}
	return 0;
}

/******************************************************************************/

public OnPlayerRequestClass(playerid, classid)
{
	g_IsPlayerSelectingClass{playerid} = true;

	#if defined spawned_OnPlayerRequestClass
		return spawned_OnPlayerRequestClass(playerid, classid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerRequestClass
	#undef OnPlayerRequestClass
#else
	#define _ALS_OnPlayerRequestClass
#endif
#define OnPlayerRequestClass spawned_OnPlayerRequestClass
#if defined spawned_OnPlayerRequestClass
	forward spawned_OnPlayerRequestClass(playerid, classid);
#endif

/******************************************************************************/

public OnPlayerSpawn(playerid)
{
	g_IsPlayerSelectingClass{playerid} = false;

	#if defined spawned_OnPlayerSpawn
		return spawned_OnPlayerSpawn(playerid);
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn spawned_OnPlayerSpawn
#if defined spawned_OnPlayerSpawn
	forward spawned_OnPlayerSpawn(playerid);
#endif

/******************************************************************************/
