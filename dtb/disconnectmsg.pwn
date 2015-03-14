public OnPlayerDisconnect(playerid, reason)
{
	switch(reason)
	{
	    case 0:
		{
			new message[128];
			format(message, sizeof message,
				"<< %s (ID: %i) disconnected (Timed Out).",
				g_PlayerName[playerid],
				playerid
			);
			SendClientMessageToAll(COLOR_GREY, message);
		}
	    case 1:
		{
			new message[128];
			format(message, sizeof message,
				"<< %s (ID: %i) disconnected (Quit).",
				g_PlayerName[playerid],
				playerid
			);
			SendClientMessageToAll(COLOR_GREY, message);
		}
	}

	// Death Message
	SetPlayerColor(playerid, COLOR_WHITE);
	SendDeathMessage(INVALID_PLAYER_ID, playerid, 201);

	#if defined dcmsg_OnPlayerDisconnect
		return dcmsg_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect dcmsg_OnPlayerDisconnect
#if defined dcmsg_OnPlayerDisconnect
	forward dcmsg_OnPlayerDisconnect(playerid, reason);
#endif
