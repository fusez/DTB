forward SkipClass(playerid);
public SkipClass(playerid)
	return SpawnPlayer(playerid);

public OnPlayerRequestClass(playerid, classid)
{
	SetTimerEx("SkipClass", 5, false, "i", playerid);

	#if defined sc_OnPlayerRequestClass
		return sc_OnPlayerRequestClass(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerRequestClass
	#undef OnPlayerRequestClass
#else
	#define _ALS_OnPlayerRequestClass
#endif
#define OnPlayerRequestClass sc_OnPlayerRequestClass
#if defined sc_OnPlayerRequestClass
	forward sc_OnPlayerRequestClass(playerid);
#endif
