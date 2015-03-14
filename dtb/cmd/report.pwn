COMMAND:report(playerid, params[])
{
	new id,
	    reason[50];

	if(sscanf(params, "is[50]", id, reason))
	    return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Report <playerid> <reason>"), 1;

	if(!IsPlayerConnected(id))
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if(id == playerid)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	new
		send_string		[100],
		admin_string	[100]
	;

	format(send_string, sizeof send_string, "You have reported %s (ID: %i), reason: %s.",
	    g_PlayerName[id], id, reason
	);
	SendClientMessage(playerid, COLOR_ORANGE, send_string);

	format(admin_string, sizeof admin_string, "%s (ID: %i) has reported %s (ID: %i), reason: %s.",
		g_PlayerName[playerid], playerid, g_PlayerName[id], id, reason
	);

	for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
	{
		if(!IsPlayerConnected(loop_playerid))
			continue;

		if(loop_playerid == playerid)
			continue;

		if(loop_playerid == id)
			continue;

		if(g_PlayerAdminLevel{loop_playerid} > 0)
			SendClientMessage(loop_playerid, COLOR_ORANGE, admin_string);
	}
    return 1;
}
