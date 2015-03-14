public OnBombPlanted(playerid, bombsiteid)
{
	new message[100];
	format(message, sizeof message,
		"1,7%s (ID: %i) has planted the bomb!", g_PlayerName[playerid], playerid
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnBombPlanted
		irc_OnBombPlanted(playerid, bombsiteid);
	#endif
}
#if defined _ALS_OnBombPlanted
	#undef OnBombPlanted
#else
	#define _ALS_OnBombPlanted
#endif
#define OnBombPlanted irc_OnBombPlanted
#if defined irc_OnBombPlanted
	forward irc_OnBombPlanted(playerid, bombsiteid);
#endif
