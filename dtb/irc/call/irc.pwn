public IRC_OnConnect(botid, ip[], port)
{
	for(new i; i < MAX_IRC_BOTS; i ++)
	{
	    if(g_IRCBotID[i] == botid)
	    {
		    IRC_JoinChannel(botid, IRC_CHANNEL);
		    IRC_AddToGroup(g_IRCGroupID, botid);
			break;
		}
	}
}

public IRC_OnDisconnect(botid, ip[], port, reason[])
{
	for(new i; i < MAX_IRC_BOTS; i ++)
	{
	    if(g_IRCBotID[i] == botid)
			{ IRC_RemoveFromGroup(g_IRCGroupID, botid); break; }
	}
}

public IRC_OnJoinChannel(botid, channel[])
{
	for(new i; i < MAX_IRC_BOTS; i ++)
	{
	    if(g_IRCBotID[i] == botid)
		{
			if(strcmp(channel, IRC_CHANNEL) != 0)
				IRC_PartChannel(botid, channel, "I don't belong here!");
			break;
		}
	}
}

public IRC_OnUserSay(botid, recipient[], user[], host[], message[])
{
	if(message[0] == '!')
	    return 1; // A command was typed in, don't echo this message!

	new bool:botfound;
	for(new i; i < MAX_IRC_BOTS; i ++)
	{
		if(botid == g_IRCBotID[i])
		    botfound = true; // An echo bot reported this message; bot found!

		if(!strcmp(user, g_IRCBotNames[i]))
			return 1; // A bot sent this message, don't echo this message!
	}

	if(!botfound)
	    return 1; // An echo bot was not found, don't echo this message!

	new final_message[128];
	format(final_message, sizeof final_message, "%s on IRC: %s", user, message);

	SendClientMessageToAll(COLOR_WHITE, final_message);
	IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, final_message);
	return 1;
}
