CreatePlayerSession(playerid)
{
	new query[500];
	mysql_format(g_DBHandle, query, sizeof query,
	    "INSERT INTO sessions (session_account_id, session_name, session_ip, session_gpci, session_country, session_city, session_isp, session_start, session_end, session_login, session_login_attempt) VALUES (%i, '%e', '%e', '%e', '%e', '%e', '%e', FROM_UNIXTIME(%i), NOW(), %i, %i)",
		g_PlayerAccountID[playerid],
		g_PlayerName[playerid],
		g_PlayerIP[playerid],
		g_PlayerGPCI[playerid],
		g_PlayerCountry[playerid],
		g_PlayerCity[playerid],
		g_PlayerISP[playerid],
		GetPlayerJoinTime(playerid),
		g_IsPlayerLoggedIn{playerid},
		(g_PlayerLoginAttempts{playerid} > 0)
	);
	mysql_tquery(g_DBHandle, query);
}
