ShowPlayerLoginDialog(playerid)
{
	new
		attempts = g_PlayerLoginAttempts{playerid},
		info[100]
	;

	if(attempts == 0)
	{
		format(info, sizeof info,
			"{%06x}This name is registered!\n{%06x}Enter the correct password to login.",
			RGBAtoRGB(COLOR_RED), RGBAtoRGB(COLOR_WHITE)
		);
	}
	else
	{
		new attempts_left = MAX_LOGIN_ATTEMPTS - attempts;

		format(info, sizeof info,
			"{%06x}This password is incorrect!\n{%06x}You have %i attempts left.",
			RGBAtoRGB(COLOR_RED), RGBAtoRGB(COLOR_WHITE), attempts_left
		);
	}

	ShowPlayerDialog(
		playerid,
		DIALOG_LOGIN,
		DIALOG_STYLE_PASSWORD,
		"Login",
		info,
		"Login",
		""
	);
	return 1;
}
