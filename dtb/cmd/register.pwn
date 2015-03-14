COMMAND:register(playerid, const password[])
{
	new accountid = g_PlayerAccountID[playerid];
	if(accountid == 0)
		return SendClientMessage(playerid, COLOR_RED, "This account could not be registered!"), 1;

	if(g_IsPlayerRegistered{playerid})
		return SendClientMessage(playerid, COLOR_RED, "This name is already registered!"), 1;

	if(strlen(password) < MIN_PASSWORD || strlen(password) > MAX_PASSWORD)
	{
		new msg[128];
		format(msg, sizeof msg,
			"Invalid length of password! The valid length is %i - %i characters!",
			MIN_PASSWORD, MAX_PASSWORD
		);
		SendClientMessage(playerid, COLOR_RED, msg);
		return 1;
	}

	RegisterPlayerAccount(playerid, accountid, password);
	return 1;
}
