public OnGameEnd(reason)
{
	switch(reason)
	{
		case REASON_DESTROYED:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: The bombsite has been destroyed; the attacking team has won this round!");
		case REASON_DEFUSED:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: The bomb has been defused; the defending team has won this round!");
		case REASON_ATTACK_KILLED:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: The attacking team has been eliminated; the defending team has won this round!");
		case REASON_DEFEND_KILLED:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: The defending team has been eliminated; the attacking team has won this round!");
		case REASON_ATTACK_DISCONNECT:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: All of the players in the attacking team disconnected; the defending team has won this round!");
		case REASON_DEFEND_DISCONNECT:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: All of the players in the defending team disconnected; the attacking team has won this round!");
		case REASON_NO_PLANT:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: No bombsite was destroyed in time; the defending team has won this round!");
		case REASON_CANCELLED:
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "1,7Round Results: The round has been cancelled; nobody won this round.");
	}

	#if defined irc_OnGameEnd
		irc_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd irc_OnGameEnd
#if defined irc_OnGameEnd
	forward irc_OnGameEnd(reason);
#endif
