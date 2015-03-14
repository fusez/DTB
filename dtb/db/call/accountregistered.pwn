forward OnPlayerAccountRegistered(playerid);

public OnPlayerAccountRegistered(playerid)
{
	g_IsPlayerRegistered{playerid} = true;
	g_IsPlayerLoggedIn{playerid} = true;

	new msg[100];
	format(msg, sizeof msg,
		"Account successfully registered! (Account ID: %i)", g_PlayerAccountID[playerid]
	);
    SendClientMessage(playerid, COLOR_GREEN, msg);
    return 1;
}
