public OnPlayerDisconnect(playerid, reason)
{
	switch(reason)
	{
	    case 0:
		{
			new message[100];
			format(message, sizeof message,
				"1,3<< %s (ID: %i) disconnected from the server (Timed Out).", g_PlayerName[playerid], playerid
			);
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
		}
	    case 1:
		{
			new message[100];
			format(message, sizeof message,
				"1,3<< %s (ID: %i) disconnected from the server (Quit).", g_PlayerName[playerid], playerid
			);
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
		}
	}
	#if defined irc_OnPlayerDisconnect
		return irc_OnPlayerDisconnect(playerid, reason);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect irc_OnPlayerDisconnect
#if defined irc_OnPlayerDisconnect
	forward irc_OnPlayerDisconnect(playerid, reason);
#endif
