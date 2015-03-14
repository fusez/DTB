WriteDeathlog(playerid, killerid, reason)
{
	new query[200];
	if(killerid == INVALID_PLAYER_ID)
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO deaths (death_dead_account_id, death_dead_name, death_reason, death_date) VALUES (%i, '%e', %i, NOW())",
			g_PlayerAccountID[playerid],
			g_PlayerName[playerid],
	        reason
		);
	}
	else
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO deaths (death_dead_account_id, death_killer_account_id, death_dead_name, death_killer_name, death_reason, death_date) VALUES (%i, %i, '%e', '%e', %i, NOW())",
			g_PlayerAccountID[playerid],
			g_PlayerAccountID[killerid],
			g_PlayerName[playerid],
			g_PlayerName[killerid],
	        reason
		);
	}
    mysql_tquery(g_DBHandle, query);
}
