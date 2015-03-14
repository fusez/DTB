public OnGameModeExit()
{
	IRC_DestroyGroup(g_IRCGroupID);
	for(new bot; bot < MAX_IRC_BOTS; bot ++)
	    IRC_Quit(g_IRCBotID[bot], "Server Shutdown");

	#if defined irc_OnGameModeExit
		irc_OnGameModeExit();
	#endif
}
#if defined _ALS_OnGameModeExit
	#undef OnGameModeExit
#else
	#define _ALS_OnGameModeExit
#endif
#define OnGameModeExit irc_OnGameModeExit
#if defined irc_OnGameModeExit
	forward irc_OnGameModeExit();
#endif
