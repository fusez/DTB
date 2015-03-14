public OnPlayerConnect(playerid)
{
	new message[150];
	format(message, sizeof message, "1,3>> %s (ID: %i) connected to the server from %s.",
		g_PlayerName[playerid],
		playerid,
		g_PlayerCountry[playerid]
	);
    IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnPlayerConnect
		irc_OnPlayerConnect(playerid);
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect irc_OnPlayerConnect
#if defined irc_OnPlayerConnect
	forward irc_OnPlayerConnect(playerid);
#endif
