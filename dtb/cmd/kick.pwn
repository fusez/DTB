COMMAND:kick(playerid, params[])
{
	if(g_PlayerAdminLevel{playerid} < 1)
	    return 0;

	new id, reason[50];
	if(sscanf(params, "iS(None)[50]", id, reason))
	    return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Kick <playerid> <reason>"), 1;

	if(!IsPlayerConnected(id))
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if(playerid == id)
	    return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	Kick(id, reason, playerid);
	return 1;
}
