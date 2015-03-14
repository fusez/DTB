COMMAND:stats(playerid, params[])
{
	if(isnull(params))
		return ShowPlayerStatsDialog(playerid, playerid), 1;

	new id;
	if(sscanf(params, "i", id))
		return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Stats <playerid>"), 1;

	if(!IsPlayerConnected(id))
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	return ShowPlayerStatsDialog(playerid, id), 1;
}
