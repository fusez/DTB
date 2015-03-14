LoadPlayerSessions(playerid)
{
	new	query[200];
	mysql_format(g_DBHandle, query, sizeof query,
		"SELECT * FROM sessions WHERE session_account_id = %i OR session_ip = '%e'",
		g_PlayerAccountID[playerid],
		g_PlayerIP[playerid]
	);
    mysql_tquery(g_DBHandle, query, "OnPlayerSessionsLoaded", "i", playerid);
}
