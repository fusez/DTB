public OnBombDefused(playerid, bombsiteid)
{
	new message[100];
	format(message, sizeof message,
		"1,7%s (ID: %i) has defused the bomb!", g_PlayerName[playerid], playerid
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnBombDefused
		irc_OnBombDefused(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombDefused
	#undef OnBombDefused
#else
	#define _ALS_OnBombDefused
#endif
#define OnBombDefused irc_OnBombDefused
#if defined irc_OnBombDefused
	forward irc_OnBombDefused(playerid, bombsiteid);
#endif
