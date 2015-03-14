new g_PlayerSpectating[MAX_PLAYERS] = {INVALID_PLAYER_ID, ...};

forward OnPlayerSpectatePlayer(playerid, targetplayerid, mode);

#define GetPlayerSpectatePlayer(%0) \
	(g_PlayerSpectating[%0])

#define IsPlayerSpectating(%0) \
	(GetPlayerState(%0) == PLAYER_STATE_SPECTATING)

/******************************************************************************/

stock spec_TogglePlayerSpectating(playerid, toggle)
{
	new success = TogglePlayerSpectating(playerid, toggle);
	if(success)
		g_PlayerSpectating[playerid] = INVALID_PLAYER_ID;
	return success;
}
#if defined _ALS_TogglePlayerSpectating
	#undef TogglePlayerSpectating
#else
	#define _ALS_TogglePlayerSpectating
#endif
#define TogglePlayerSpectating spec_TogglePlayerSpectating

/******************************************************************************/

stock spec_PlayerSpectatePlayer(playerid, targetplayerid, mode = SPECTATE_MODE_NORMAL)
{
	new success = PlayerSpectatePlayer(playerid, targetplayerid, mode);
	if(success)
	{
		new vehicleid = GetPlayerVehicleID(targetplayerid);
		if(vehicleid)
	    	PlayerSpectateVehicle(playerid, vehicleid, mode);

		g_PlayerSpectating[playerid] = targetplayerid;
		CallLocalFunction("OnPlayerSpectatePlayer", "iii", playerid, targetplayerid, mode);
	}
	return success;
}
#if defined _ALS_PlayerSpectatePlayer
	#undef PlayerSpectatePlayer
#else
	#define _ALS_PlayerSpectatePlayer
#endif
#define PlayerSpectatePlayer spec_PlayerSpectatePlayer

/******************************************************************************/
