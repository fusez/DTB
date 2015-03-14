public OnGameStart()
{
	new
		mapname[MAX_MAP_NAME + 1],
		message[100]
	;

    GetMapName(mapname, sizeof mapname, GetCurrentMapID);

	format(message, sizeof message,
		"1,7A new round starts in %i seconds, map: %s", g_GameTime, mapname
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnGameStart
		irc_OnGameStart();
	#endif
}
#if defined _ALS_OnGameStart
	#undef OnGameStart
#else
	#define _ALS_OnGameStart
#endif
#define OnGameStart irc_OnGameStart
#if defined irc_OnGameStart
	forward irc_OnGameStart();
#endif
