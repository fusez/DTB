new g_PlayerFramerate [MAX_PLAYERS];

#define GetPlayerFramerate(%0) \
	(g_PlayerFramerate[%0])

public OnPlayerUpdate(playerid)
{
	static old_drunk [MAX_PLAYERS];

	new new_drunk = GetPlayerDrunkLevel(playerid);
	if(new_drunk <= 100)
		SetPlayerDrunkLevel(playerid, 2000);
	else if(new_drunk != old_drunk[playerid])
	{
		new framerate = old_drunk[playerid] - new_drunk;
		if(framerate > 0)
			g_PlayerFramerate[playerid] = framerate;

		old_drunk[playerid] = new_drunk;
	}

	#if defined fps_OnPlayerUpdate
		return fps_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate fps_OnPlayerUpdate
#if defined fps_OnPlayerUpdate
	forward fps_OnPlayerUpdate(playerid);
#endif
