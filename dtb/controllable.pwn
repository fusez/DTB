// Is Player Controllable: IPC

new bool: g_IsPlayerControllable [MAX_PLAYERS char];

#define IsPlayerControllable(%0) \
    g_IsPlayerControllable{%0}

stock ipc_TogglePlayerControllable(playerid, bool:toggle)
{
	new success = TogglePlayerControllable(playerid, toggle);
	if(success)
		g_IsPlayerControllable{playerid} = toggle;
	return success;
}
#if defined _ALS_TogglePlayerControllable
	#undef TogglePlayerControllable
#else
	#define _ALS_TogglePlayerControllable
#endif
#define TogglePlayerControllable ipc_TogglePlayerControllable
