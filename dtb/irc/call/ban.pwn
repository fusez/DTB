public OnPlayerBanned(playerid, by_playerid, by_irc_user[], reason[])
{
	new message[100];
	format(message, sizeof message,
		"1,4<< %s (ID: %i) has gotten banned from the server, reason: %s.",
		g_PlayerName[playerid],
		playerid,
		reason
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnPlayerBanned
		irc_OnPlayerBanned(playerid, by_playerid, by_irc_user, reason);
	#endif
}
#if defined _ALS_OnPlayerBanned
	#undef OnPlayerBanned
#else
	#define _ALS_OnPlayerBanned
#endif
#define OnPlayerBanned irc_OnPlayerBanned
#if defined irc_OnPlayerBanned
	forward irc_OnPlayerBanned(playerid, by_playerid, by_irc_user[], reason[]);
#endif
