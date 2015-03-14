IRCCMD:kick(botid, channel[], user[], host[], params[])
{
	if(botid == g_IRCBotID[0])
	{
		if(!IRC_IsOp(botid, channel, user))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: You are not authorized to use this command!"), 1;

		new playerid, reason[50];
		if(sscanf(params, "iS(None)[50]", playerid, reason))
	    	return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1SYNTAX: !Kick <playerid> <reason>"), 1;

		if(!IsPlayerConnected(playerid))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: This player is not connected!"), 1;

		Kick(playerid, reason, INVALID_PLAYER_ID, user);
	}
	return 1;
}
