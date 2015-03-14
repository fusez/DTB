IRCCMD:restart(botid, channel[], user[], host[], params[])
{
	if(botid == g_IRCBotID[0])
	{
		if(!IRC_IsOwner(botid, channel, user))
			return IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "4,1ERROR: You are not authorized to use this command!"), 1;

		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "Restarting Server...");
		SendRconCommand("gmx");
	}
	return 1;
}
