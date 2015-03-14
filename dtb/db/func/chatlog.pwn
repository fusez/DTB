WriteChatlog(by_playerid, message[], to_playerid = INVALID_PLAYER_ID)
{
	new
		message_len = strlen(message),
		query[400]
	;

	if(message_len > 200)
	    strdel(message, 200, message_len);

	if(to_playerid == INVALID_PLAYER_ID)
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO chat (chat_by_account_id, chat_by_name, chat_message, chat_date) VALUES (%i, '%e', '%e', NOW())",
			g_PlayerAccountID[by_playerid],
			g_PlayerName[by_playerid],
	        message
		);
	}
	else
	{
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO chat (chat_by_account_id, chat_to_account_id, chat_by_name, chat_to_name, chat_message, chat_date) VALUES (%i, %i, '%e', '%e', '%e', NOW())",
			g_PlayerAccountID[by_playerid],
			g_PlayerAccountID[to_playerid],
			g_PlayerName[by_playerid],
			g_PlayerName[to_playerid],
	        message
		);
	}
	mysql_tquery(g_DBHandle, query);
}
