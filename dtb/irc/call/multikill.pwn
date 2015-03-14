public OnPlayerMultiKill(playerid, kills)
{
	new message[100];
	format(message, sizeof message,
		"1,7%s (ID: %i) has killed %i players in a row!",
		g_PlayerName[playerid],
		playerid,
		kills
	);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

	#if defined irc_OnPlayerMultiKill
		irc_OnPlayerMultiKill(playerid, kills);
	#endif
}
#if defined _ALS_OnPlayerMultiKill
	#undef OnPlayerMultiKill
#else
	#define _ALS_OnPlayerMultiKill
#endif
#define OnPlayerMultiKill irc_OnPlayerMultiKill
#if defined irc_OnPlayerMultiKill
	forward irc_OnPlayerMultiKill(playerid, kills);
#endif
