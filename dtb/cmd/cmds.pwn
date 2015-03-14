COMMAND:cmds(playerid)
{
	new
		caption		[50],
		info_part	[100],
		info		[1500]
	;

	format(caption, sizeof caption,
		"{%06x}Server Commands:", RGBAtoRGB(COLOR_WHITE)
	);

	format(info_part, sizeof info_part, "{%06x}", RGBAtoRGB(COLOR_ORANGE));
	strcat(info, info_part);

	strcat(info, "/Register <password>\n");
	strcat(info, "/Stats <playerid>\n");
	strcat(info, "/Leaderboard\n");
	strcat(info, "/Kill\n");
	strcat(info, "/Pm <playerid> <message>\n");
	strcat(info, "/Report <playerid> <reason>\n");
	strcat(info, "/Getid <name/part of name>\n");

	if(g_PlayerAdminLevel{playerid} >= 1)
	{
		format(info_part, sizeof info_part,
			"\n{%06x}Admin Level 1 (%s):{%06x}\n",
			RGBAtoRGB(COLOR_WHITE),
			GetAdminLevelName(1),
			RGBAtoRGB(COLOR_ORANGE)
		);
		strcat(info, info_part);

		strcat(info, "/Aka <playerid> <offset>\n");
		strcat(info, "/Kick <playerid> <reason>\n");
		strcat(info, "/Ban <playerid> <reason>\n");
		strcat(info, "/Cancelgame\n");
		strcat(info, "/Clearchat\n");
		strcat(info, "/Goto <playerid>\n");
		strcat(info, "/Get <playerid>\n");
	}

	if(g_PlayerAdminLevel{playerid} >= 2)
	{
		format(info_part, sizeof info_part,
			"\n{%06x}Admin Level 2 (%s):{%06x}\n",
			RGBAtoRGB(COLOR_WHITE),
			GetAdminLevelName(2),
			RGBAtoRGB(COLOR_ORANGE)
		);
		strcat(info, info_part);

		strcat(info, "/Shutdown\n");
		strcat(info, "/Restart\n");
		strcat(info, "/Hostname <hostname>\n");
		strcat(info, "/Password <password>\n");
		strcat(info, "/Loadfs <filterscript>\n");
		strcat(info, "/Unloadfs <filterscript>\n");
		strcat(info, "/Reloadfs <filterscript>\n");
		strcat(info, "/Setadmin <playerid> <level>\n");
	}

	ShowPlayerDialog(
		playerid, DIALOG_CMDS, DIALOG_STYLE_MSGBOX, caption, info, "Close", ""
	);
	return 1;
}
