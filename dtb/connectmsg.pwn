public OnPlayerConnect(playerid)
{
	new message[128];
	format(message, sizeof message,
		">> %s (ID: %i) connected from %s.",
		g_PlayerName[playerid],
		playerid,
		g_PlayerCountry[playerid]
	);
	SendClientMessageToAll(COLOR_GREY, message);

	SetPlayerColor(playerid, COLOR_WHITE);
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 200);

	#if defined cmsg_OnPlayerConnect
		cmsg_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect cmsg_OnPlayerConnect
#if defined cmsg_OnPlayerConnect
	forward cmsg_OnPlayerConnect(playerid);
#endif
