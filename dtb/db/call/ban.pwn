public OnPlayerBanned(playerid, by_playerid, by_irc_user[], reason[])
{
	new query[300];
	if(by_playerid == INVALID_PLAYER_ID)
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO bans (ban_to_account_id, ban_to_name, ban_by_irc_user, ban_date, ban_reason) VALUES (%i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid],
			g_PlayerName[playerid],
			by_irc_user,
	        reason
		);
	}
	else
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO bans (ban_to_account_id, ban_by_account_id, ban_to_name, ban_by_name, ban_date, ban_reason) VALUES (%i, %i, '%e', '%e', NOW(), '%e')",
			g_PlayerAccountID[playerid],
			g_PlayerAccountID[by_playerid],
			g_PlayerName[playerid],
			g_PlayerName[by_playerid],
	        reason
		);
	}
    mysql_tquery(g_DBHandle, query);

	#if defined db_OnPlayerBanned
		db_OnPlayerBanned(playerid, by_playerid, by_irc_user, reason);
	#endif
}
#if defined _ALS_OnPlayerBanned
	#undef OnPlayerBanned
#else
	#define _ALS_OnPlayerBanned
#endif
#define OnPlayerBanned db_OnPlayerBanned
#if defined db_OnPlayerBanned
	forward db_OnPlayerBanned(playerid, by_playerid, by_irc_user[], reason[]);
#endif
