public OnPlayerDeath(playerid, killerid, reason)
{
	new reason_name[20];
	GetWeaponName(reason, reason_name, sizeof reason_name);

	if(killerid == INVALID_PLAYER_ID)
	{
		new message[100];
		format(message, sizeof message,
			"1,7%s (ID: %i) has died, reason: %s", g_PlayerName[playerid],	playerid, reason_name
		);
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
	}
	else
	{
		new message[150];
		format(message, sizeof message,
			"1,2%s (ID: %i) was killed by %s (ID: %i), reason: %s",
			g_PlayerName[playerid], playerid,
			g_PlayerName[killerid], killerid,
			reason_name
		);
		IRC_GroupSay(g_IRCGroupID, IRC_CHANNEL, message);
	}

	#if defined irc_OnPlayerDeath
		irc_OnPlayerDeath(playerid, killerid, reason);
	#endif
}
#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif
#define OnPlayerDeath irc_OnPlayerDeath
#if defined irc_OnPlayerDeath
	forward irc_OnPlayerDeath(playerid, killerid, reason);
#endif
