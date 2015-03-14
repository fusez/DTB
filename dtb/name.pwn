/******************************************************************************/

new g_PlayerName[MAX_PLAYERS][MAX_PLAYER_NAME + 1];

/******************************************************************************/

stock name_SetPlayerName(playerid, name[])
{
	new ret_value = SetPlayerName(playerid, name);
	if(ret_value == 1)
		format(g_PlayerName[playerid], MAX_PLAYER_NAME + 1, name);
	return ret_value;
}
#if defined _ALS_SetPlayerName
	#undef SetPlayerName
#else
	#define _ALS_SetPlayerName
#endif
#define SetPlayerName name_SetPlayerName

/******************************************************************************/

public OnPlayerConnect(playerid)
{
	GetPlayerName(playerid, g_PlayerName[playerid], MAX_PLAYER_NAME + 1);

	#if defined name_OnPlayerConnect
		name_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect name_OnPlayerConnect
#if defined name_OnPlayerConnect
	forward name_OnPlayerConnect(playerid);
#endif

/******************************************************************************/
