ShowPlayerStatsDialog(playerid, statsid)
{
	new
		info				[1000],
		info_part			[100],
		caption     		[100],
		registered_string	[4]
	;

	format(caption, sizeof caption,
		"{%06x}Stats: {%06x}%s (ID: %i)",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerName[statsid],
		statsid
	);

	registered_string = (g_IsPlayerRegistered{statsid}) ? ("Yes") : ("No");
	format(info_part, sizeof info_part,
		"{%06x}Registered: {%06x}%s\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		registered_string
	);
	strcat(info, info_part);

	if(g_IsPlayerRegistered{statsid})
	{
		new login[4];
		login = (g_IsPlayerLoggedIn{statsid}) ? ("Yes") : ("No");

		format(info_part, sizeof info_part,
			"{%06x}Account ID: {%06x}%i\n",
			RGBAtoRGB(COLOR_ORANGE),
			RGBAtoRGB(COLOR_WHITE),
			g_PlayerAccountID[statsid]
		);
		strcat(info, info_part);

		format(info_part, sizeof info_part,
			"{%06x}Logged In: {%06x}%s\n",
			RGBAtoRGB(COLOR_ORANGE),
			RGBAtoRGB(COLOR_WHITE),
			login
		);
		strcat(info, info_part);
	}

	if(g_PlayerAdminLevel{playerid} > 0)
	{
		format(info_part, sizeof info_part,
			"{%06x}Admin Level: {%06x}%i\n",
			RGBAtoRGB(COLOR_ORANGE),
			RGBAtoRGB(COLOR_WHITE),
			g_PlayerAdminLevel{statsid}
		);
		strcat(info, info_part);
	}

	new spawned_string[4];
	spawned_string = (IsPlayerSpawned(statsid)) ? ("Yes") : ("No");
	format(info_part, sizeof info_part,
		"{%06x}Spawned: {%06x}%s\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		spawned_string
	);
	strcat(info, info_part);

	if(IsPlayerSpawned(statsid))
	{
		format(info_part, sizeof info_part,
			"{%06x}Framerate: {%06x}%i FPS\n",
			RGBAtoRGB(COLOR_ORANGE),
			RGBAtoRGB(COLOR_WHITE),
			GetPlayerFramerate(statsid)
		);
		strcat(info, info_part);
	}

	new bool:paused = IsPlayerPaused(statsid),
		paused_string[4];

	paused_string = (paused) ? ("Yes") : ("No");
	format(info_part, sizeof info_part,
		"{%06x}Paused: {%06x}%s\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		paused_string
	);
	strcat(info, info_part);

	if(paused)
	{
		new paused_sec = GetPlayerPausedSeconds(statsid);

		format(info_part, sizeof info_part,
			"{%06x}Paused Time: {%06x}%s\n",
			RGBAtoRGB(COLOR_ORANGE),
			RGBAtoRGB(COLOR_WHITE),
			TimeToString(paused_sec)
		);
		strcat(info, info_part);
	}

	format(info_part, sizeof info_part,
		"{%06x}Kills: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerKills[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Deaths: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerDeaths[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}K/D Ratio: {%06x}%.2f\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		GetPlayerKDRatio(statsid)
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Games Played: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerGamesWon[statsid] + g_PlayerGamesLost[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Games Won: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerGamesWon[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Games Lost: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerGamesLost[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}W/L Ratio: {%06x}%.2f\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		GetPlayerWLRatio(statsid)
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Bombs Planted: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerBombsPlanted[statsid]
	);
	strcat(info, info_part);

	format(info_part, sizeof info_part,
		"{%06x}Bombs Defused: {%06x}%i\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		g_PlayerBombsDefused[statsid]
	);
	strcat(info, info_part);

	new level = g_PlayerLevel{statsid},
	    xp = g_PlayerXP[statsid],
	    level_xp = GetLevelXP(level)
	;

	format(info_part, sizeof info_part,
		"{%06x}Level: {%06x}%i (%i / %i XP)\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		level + 1, xp, level_xp
	);
	strcat(info, info_part);

	new
		session_time = GetPlayerSessionTime(statsid),
		total_time = session_time + g_PlayerPlayTime[statsid]
	;

	format(info_part, sizeof info_part,
		"{%06x}Playtime: {%06x}%s\n",
		RGBAtoRGB(COLOR_ORANGE),
		RGBAtoRGB(COLOR_WHITE),
		TimeToString(total_time)
	);
	strcat(info, info_part);

	ShowPlayerDialog(
		playerid,
		DIALOG_STATS,
		DIALOG_STYLE_MSGBOX,
		caption,
		info,
		"Close",
		""
	);
	return 1;
}
