public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_SPECTATING)
		ShowPlayerLevelTextdraws(playerid, false);

	#if defined level_OnPlayerStateChange
		level_OnPlayerStateChange(playerid, newstate, oldstate);
	#endif
}
#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange level_OnPlayerStateChange
#if defined level_OnPlayerStateChange
	forward level_OnPlayerStateChange(playerid, newstate, oldstate);
#endif
