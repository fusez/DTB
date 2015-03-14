COMMAND:getid(playerid, params[])
{
	if(isnull(params))
	    return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Getid <part of name>"), 1;

	new players_found,
	    player_array[MAX_PLAYERS];

	for(new id, max_playerid = GetMaxPlayers(); id < max_playerid; id ++)
	{
		if(!IsPlayerConnected(id))
		    continue;

		if(strfind(g_PlayerName[id], params, true) == -1)
			continue;

        player_array[players_found ++] = id;
	}

	if(players_found == 0)
	    return SendClientMessage(playerid, COLOR_RED, "No players were found with a similar name!"), 1;

	new msg[128];
	format(msg, sizeof msg, "%i player(s) were found with a similar name:", players_found);
	SendClientMessage(playerid, COLOR_GREEN, msg);

	for(new index; index < players_found; index ++)
	{
		new id = player_array[index];
		format(msg, sizeof msg, "%s (ID: %i)", g_PlayerName[id], id);
		SendClientMessage(playerid, COLOR_WHITE, msg);
	}
	return 1;
}
