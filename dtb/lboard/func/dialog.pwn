ShowPlayerLeaderboardDialog(playerid, dialogid)
{
	switch(dialogid)
	{
		case DIALOG_LB_MAIN:
		{
			static
			    info[400],
			    bool:info_set
			;

			if(!info_set)
			{
				strcat(info, "Kills\n");
				strcat(info, "Deaths\n");
				strcat(info, "Best Multi-Kills\n");
				strcat(info, "K/D Ratio\n");
				strcat(info, "Rounds Won\n");
				strcat(info, "Rounds Lost\n");
				strcat(info, "Rounds Played\n");
				strcat(info, "W/L Ratio\n");
				strcat(info, "Bombs Planted\n");
				strcat(info, "Bombs Defused\n");
				strcat(info, "Playtime\n");
				strcat(info, "Level");
			    info_set = true;
			}
			ShowPlayerDialog(playerid, dialogid, DIALOG_STYLE_LIST, "Select Leaderboard", info, "Select", "Close");
		}
		case DIALOG_LB_KILLS:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_kills FROM accounts ORDER BY account_kills DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_DEATHS:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_deaths FROM accounts ORDER BY account_deaths DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_MULTIKILL:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_multikill FROM accounts ORDER BY account_multikill DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_KD:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_kdratio FROM accounts ORDER BY account_kdratio DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_WONGAMES:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_games_won FROM accounts ORDER BY account_games_won DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_LOSTGAMES:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_games_lost FROM accounts ORDER BY account_games_lost DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_ALLGAMES:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_games_played FROM accounts ORDER BY account_games_played DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_WL:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_wlratio FROM accounts ORDER BY account_wlratio DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_PLANTED:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_bombs_planted FROM accounts ORDER BY account_bombs_planted DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_DEFUSED:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_bombs_defused FROM accounts ORDER BY account_bombs_defused DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_TIME:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_playtime FROM accounts ORDER BY account_playtime DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		case DIALOG_LB_LEVEL:
			mysql_tquery(g_DBHandle, "SELECT account_name, account_level, account_xp FROM accounts ORDER BY account_level DESC, account_xp DESC LIMIT 10", "OnLeaderboardLoaded", "ii", playerid, dialogid);
		default:
		    return 0;
	}
	return 1;
}
