public OnPlayerText(playerid, text[])
{
	if(text[0] == '!')
	{
		if(text[1] == '\0')
		    return 0;

		new teamid = g_PlayerTeam[playerid];
		if(teamid == TEAM_ATTACK || teamid == TEAM_DEFEND)
		{
			new	message[128];
			format(message, sizeof message,
				"(%s) %s: %s", g_TeamNames[teamid], g_PlayerName[playerid], text[1]
			);

			for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
			{
				if(IsPlayerConnected(loop_playerid) && g_PlayerTeam[loop_playerid] == teamid)
					SendClientMessage(loop_playerid, COLOR_AQUA, message);
			}
		}
		else
		    SendClientMessage(playerid, COLOR_RED, "This chat is restricted for teams!");
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
