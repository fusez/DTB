public OnPlayerKicked(playerid, by_playerid, by_irc_user[], reason[])
{
	new query[300];
	if(by_playerid == INVALID_PLAYER_ID)
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO kicks (kick_to_account_id, kick_to_name, kick_by_irc_user, kick_date, kick_reason) VALUES (%i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid],
			g_PlayerName[playerid],
			by_irc_user,
	        reason
		);
	}
	else
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO kicks (kick_to_account_id, kick_by_account_id, kick_to_name, kick_by_name, kick_date, kick_reason) VALUES (%i, %i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid],
			g_PlayerAccountID[by_playerid],
			g_PlayerName[playerid],
			g_PlayerName[by_playerid],
	        reason
		);
	}
	mysql_tquery(g_DBHandle, query);

	#if defined db_OnPlayerKicked
		db_OnPlayerKicked(playerid, by_playerid, by_irc_user, reason);
	#endif
}
#if defined _ALS_OnPlayerKicked
	#undef OnPlayerKicked
#else
	#define _ALS_OnPlayerKicked
#endif
#define OnPlayerKicked db_OnPlayerKicked
#if defined db_OnPlayerKicked
	forward db_OnPlayerKicked(playerid, by_playerid, by_irc_user[], reason[]);
#endif
