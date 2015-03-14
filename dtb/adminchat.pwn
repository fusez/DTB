public OnPlayerText(playerid, text[])
{
	if(text[0] == '#')
	{
		if(text[1] == '\0')
		    return 0;

		if(g_PlayerAdminLevel{playerid} > 0)
		{
			new	message[128];
			format(message, sizeof message,
				"(Admins) %s: %s", g_PlayerName[playerid], text[1]
			);

			for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
			{
				if(IsPlayerConnected(loop_playerid) && g_PlayerAdminLevel{loop_playerid} > 0)
					SendClientMessage(loop_playerid, COLOR_ORANGE, message);
			}
		}
		else
		    SendClientMessage(playerid, COLOR_RED, "This chat is restricted for admins!");
	    return 0;
	}

	#if defined achat_OnPlayerText
		return achat_OnPlayerText(playerid, text);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerText
	#undef OnPlayerText
#else
	#define _ALS_OnPlayerText
#endif
#define OnPlayerText achat_OnPlayerText
#if defined achat_OnPlayerText
	forward achat_OnPlayerText(playerid, text[]);
#endif
