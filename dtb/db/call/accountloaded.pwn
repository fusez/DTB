forward OnPlayerAccountLoaded(playerid);
public OnPlayerAccountLoaded(playerid)
{
	if(cache_get_row_count(g_DBHandle) == 0)
	{
		SendClientMessage(playerid, COLOR_RED, "This name is not registered! Use /Register to register this name.");

		new	query[100];
		mysql_format(g_DBHandle, query, sizeof query,
			"INSERT INTO accounts (account_name) VALUES ('%e')", g_PlayerName[playerid]
		);
	    mysql_tquery(g_DBHandle, query, "OnPlayerAccountCreated", "i", playerid);
	}
	else
	{
		g_PlayerAccountID[playerid]
			= cache_get_field_content_int(0, "account_id", g_DBHandle);

        g_IsPlayerRegistered{playerid} =
			(cache_get_field_content_int(0, "account_registered", g_DBHandle)) ? (true) : (false);

		if(g_IsPlayerRegistered{playerid} == false)
			SendClientMessage(playerid, COLOR_RED, "This name is not registered! Use /Register to register this name.");
		else
		{
			cache_get_field_content(0, "account_password", g_PlayerPassword[playerid], g_DBHandle);

			cache_get_field_content(0, "account_salt", g_PlayerSalt[playerid], g_DBHandle);

			g_PlayerAdminLevel{playerid}
				= cache_get_field_content_int(0, "account_admin", g_DBHandle);

            g_PlayerKills[playerid]
				= cache_get_field_content_int(0, "account_kills", g_DBHandle);

            g_PlayerDeaths[playerid]
				= cache_get_field_content_int(0, "account_deaths", g_DBHandle);

            g_PlayerGamesWon[playerid] =
				cache_get_field_content_int(0, "account_games_won", g_DBHandle);

			g_PlayerGamesLost[playerid] =
				cache_get_field_content_int(0, "account_games_lost", g_DBHandle);

			g_PlayerBombsPlanted[playerid] =
				cache_get_field_content_int(0, "account_bombs_planted", g_DBHandle);

			g_PlayerBombsDefused[playerid] =
				cache_get_field_content_int(0, "account_bombs_defused", g_DBHandle);

			g_PlayerPlayTime[playerid] =
				cache_get_field_content_int(0, "account_playtime", g_DBHandle);

			g_PlayerLevel{playerid} =
				cache_get_field_content_int(0, "account_level", g_DBHandle);

			g_PlayerXP[playerid] =
				cache_get_field_content_int(0, "account_xp", g_DBHandle);

			new query[100];
			mysql_format(g_DBHandle, query, sizeof query,
			    "SELECT * FROM sessions WHERE session_account_id = %i ORDER BY session_end DESC LIMIT 1",
				g_PlayerAccountID[playerid]
			);
            mysql_tquery(g_DBHandle, query, "OnPlayerAutoLogin", "i", playerid);
		}
	}
    return 1;
}
