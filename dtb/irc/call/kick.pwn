public OnPlayerKicked(playerid, by_playerid, by_irc_user[], reason[])
{
	new message[100];
	format(message, sizeof message,
		"1,4<< %s (ID: %i) has gotten kicked from the server, reason: %s.", g_PlayerName[playerid], playerid, reason
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnPlayerKicked
		irc_OnPlayerKicked(playerid, by_playerid, by_irc_user, reason);
	#endif
}
#if defined _ALS_OnPlayerKicked
	#undef OnPlayerKicked
#else
	#define _ALS_OnPlayerKicked
#endif
#define OnPlayerKicked irc_OnPlayerKicked
#if defined irc_OnPlayerKicked
	forward irc_OnPlayerKicked(playerid, by_playerid, by_irc_user[], reason[]);
#endif
