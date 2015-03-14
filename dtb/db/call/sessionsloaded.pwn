forward OnPlayerSessionsLoaded(playerid);
public OnPlayerSessionsLoaded(playerid)
{
	for(new row, rows = cache_get_row_count(g_DBHandle); row < rows; row ++)
	{
		new
			accountid = cache_get_field_content_int(row, "session_account_id", g_DBHandle),
			query[100]
		;

        mysql_format(g_DBHandle, query, sizeof query,
            "SELECT * FROM bans WHERE ban_to_account_id = %i LIMIT 1", accountid
		);
   	    mysql_tquery(g_DBHandle, query, "OnPlayerBanLoaded", "i", playerid);
	}
    return 1;
}
