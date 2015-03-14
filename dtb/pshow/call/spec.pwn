public OnPlayerSpectatePlayer(playerid, targetplayerid, mode)
{
	if(IsPlayerStreamedIn(targetplayerid, playerid))
		ShowPlayerForPlayer(targetplayerid, playerid, true);

	#if defined pshow_OnPlayerSpectatePlayer
		pshow_OnPlayerSpectatePlayer(playerid, targetplayerid, mode);
	#endif
}
#if defined _ALS_OnPlayerSpectatePlayer
	#undef OnPlayerSpectatePlayer
#else
	#define _ALS_OnPlayerSpectatePlayer
#endif
#define OnPlayerSpectatePlayer pshow_OnPlayerSpectatePlayer
#if defined pshow_OnPlayerSpectatePlayer
	forward pshow_OnPlayerSpectatePlayer(playerid, targetplayerid, mode);
#endif
