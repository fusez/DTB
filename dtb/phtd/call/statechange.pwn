public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_SPECTATING)
	{
		PlayerTextDrawHide(playerid, g_PlayerHealthTD[playerid]);
	    PlayerTextDrawHide(playerid, g_PlayerArmourTD[playerid]);
	}

	#if defined phtd_OnPlayerStateChange
		phtd_OnPlayerStateChange(playerid, newstate, oldstate);
	#endif
}
#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif
#define OnPlayerStateChange phtd_OnPlayerStateChange
#if defined phtd_OnPlayerStateChange
	forward phtd_OnPlayerStateChange(playerid, newstate, oldstate);
#endif
