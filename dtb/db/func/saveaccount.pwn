SavePlayerAccount(playerid, accountid)
{
	new query[500];
	mysql_format(g_DBHandle, query, sizeof query,
		"UPDATE accounts SET account_admin = %i, account_kills = %i, account_multikill = %i, account_deaths = %i, account_kdratio = %f, account_games_won = %i, account_games_lost = %i, account_games_played = %i, account_wlratio = %f, account_bombs_planted = %i, account_bombs_defused = %i, account_level = %i, account_xp = %i, account_playtime = %i WHERE account_id = %i",
		g_PlayerAdminLevel{playerid},
        g_PlayerKills[playerid],
        g_PlayerBestMultiKill{playerid},
        g_PlayerDeaths[playerid],
        GetPlayerKDRatio(playerid),
        g_PlayerGamesWon[playerid],
        g_PlayerGamesLost[playerid],
        (g_PlayerGamesWon[playerid] + g_PlayerGamesLost[playerid]),
        GetPlayerWLRatio(playerid),
        g_PlayerBombsPlanted[playerid],
        g_PlayerBombsDefused[playerid],
        g_PlayerLevel{playerid},
        g_PlayerXP[playerid],
        (GetPlayerSessionTime(playerid) + g_PlayerPlayTime[playerid]),
		accountid
	);
	mysql_tquery(g_DBHandle, query);
}
