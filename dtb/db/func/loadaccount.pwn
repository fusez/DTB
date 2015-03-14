LoadPlayerAccount(playerid)
{
	new query[100];
	mysql_format(g_DBHandle, query, sizeof query,
		"SELECT * FROM accounts WHERE account_name = '%e'", g_PlayerName[playerid]
	);
    mysql_tquery(g_DBHandle, query, "OnPlayerAccountLoaded", "i", playerid);
}
