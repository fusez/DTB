COMMAND:hostname(playerid, params[])
{
	if(g_PlayerAdminLevel{playerid} < 2)
	    return 0;

	if(isnull(params))
		return SendClientMessage(playerid, COLOR_RED, "You did not enter any hostname!"), 1;

	new rcon_cmd[100];
	format(rcon_cmd, sizeof rcon_cmd, "hostname %s", params);

	SendClientMessage(playerid, COLOR_WHITE, rcon_cmd);
	SendRconCommand(rcon_cmd);
    return 1;
}
