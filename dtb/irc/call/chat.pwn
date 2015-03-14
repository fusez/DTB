public OnPlayerText(playerid, text[])
{
	// Neither team or admin chat
	if(text[0] != '!' && text[0] != '#') 
	{
		new message[200];
		format(message, sizeof message,
			"3%s (ID: %i):1 %s", g_PlayerName[playerid], playerid, text
		);
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
	}

	#if defined irc_OnPlayerText
		return irc_OnPlayerText(playerid, text);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerText
	#undef OnPlayerText
#else
	#define _ALS_OnPlayerText
#endif
#define OnPlayerText irc_OnPlayerText
#if defined irc_OnPlayerText
	forward irc_OnPlayerText(playerid, text[]);
#endif
