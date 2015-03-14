IRCCMD:players(botid, channel[], user[], host[], params[])
{
	if(botid == g_IRCBotID[0])
	{
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, "Connected Players:");

		new players;
		for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
		{
			if(!IsPlayerConnected(playerid))
			    continue;

			new message[40];
			format(message, sizeof message, "0,1%s (ID: %i)", g_PlayerName[playerid], playerid);
			IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);

			players ++;
		}

		new message[20];
		format(message, sizeof message, "%i player(s) found.", players);
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
	}
	return 1;
}
