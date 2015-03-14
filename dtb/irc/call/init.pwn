public OnGameModeInit()
{
	g_IRCGroupID = IRC_CreateGroup();
	for(new bot, delay; bot < MAX_IRC_BOTS; bot ++)
	{
	    delay += 5;

		g_IRCBotID[bot] = IRC_Connect(IRC_SERVER, IRC_PORT, g_IRCBotNames[bot], g_IRCBotNames[bot], g_IRCBotNames[bot]);
		IRC_SetIntData(g_IRCBotID[bot], E_IRC_CONNECT_DELAY, delay);
	}

	#if defined irc_OnGameModeInit
		irc_OnGameModeInit();
	#endif
}
#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit irc_OnGameModeInit
#if defined irc_OnGameModeInit
	forward irc_OnGameModeInit();
#endif
