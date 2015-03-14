LoginPlayer(playerid, accountid, bool:autologin)
{
	g_IsPlayerLoggedIn{playerid} = true;

	new msg[128];
	if(autologin)
	{
		format(msg, sizeof msg,
			"Account automatically logged in! (Account ID: %i)", accountid
		);
	}
	else
	{
		format(msg, sizeof msg,
			"Account successfully logged in! (Account ID: %i)", accountid
		);
	}
   	SendClientMessage(playerid, COLOR_GREEN, msg);
	TogglePlayerSpectating(playerid, false);
}
