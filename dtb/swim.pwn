IsPlayerSwimming(playerid)
{
	switch(GetPlayerAnimationIndex(playerid))
	{
		case 1250, 1538, 1539, 1540, 1541, 1542, 1544:
			return 1;
	}
	return 0;
}

public OnPlayerUpdate(playerid)
{
	if(IsPlayerSpawned(playerid) && IsPlayerSwimming(playerid))
	    SetPlayerHealth(playerid, 0.0);

	#if defined swim_OnPlayerUpdate
		return swim_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate swim_OnPlayerUpdate
#if defined swim_OnPlayerUpdate
	forward swim_OnPlayerUpdate(playerid);
#endif
