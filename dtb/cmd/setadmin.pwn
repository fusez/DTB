COMMAND:setadmin(playerid, params[])
{
	if(g_PlayerAdminLevel{playerid} < 2)
	    return 0;

	new id,
	    level;

	if(sscanf(params, "ii", id, level))
	    return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Setadmin <playerid> <level>"), 1;

	if(!IsPlayerConnected(id))
	    return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if(id == playerid)
	    return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	if(level < 0 || level > 2)
	    return SendClientMessage(playerid, COLOR_RED, "You must enter a level between 0 - 2!"), 1;

	if(g_PlayerAdminLevel{playerid} == g_PlayerAdminLevel{id})
	    return SendClientMessage(playerid, COLOR_RED, "You are not authorized to set the admin level of this player!"), 1;

	if(level == g_PlayerAdminLevel{id})
	    return SendClientMessage(playerid, COLOR_RED, "This player already has this admin level!"), 1;

    g_PlayerAdminLevel{id} = level;

	new
		message[128],
		query[200]
	;

	mysql_format(g_DBHandle, query, sizeof query,
		"INSERT INTO setadmin (setadmin_to_account_id, setadmin_by_account_id, setadmin_level, setadmin_date) VALUES (%i, %i, %i, NOW())",
		g_PlayerAccountID[id],
		g_PlayerAccountID[playerid],
		level
	);
    mysql_tquery(g_DBHandle, query);

	format(message, sizeof message,
		"You have set the admin level of %s (ID: %i) to level %i (%s).",
		g_PlayerName[id],
		id,
		level,
		GetAdminLevelName(level)
	);
	SendClientMessage(playerid, COLOR_ORANGE, message);

	format(message, sizeof message,
	    "Your admin level has been set to level %i (%s) by %s (ID: %i).",
		level,
		GetAdminLevelName(level),
		g_PlayerName[playerid],
		playerid
	);
	SendClientMessage(id, COLOR_ORANGE, message);

	format(message, sizeof message,
	    "%s (ID: %i) has set the admin level of %s (ID: %i) to level %i (%s).",
		g_PlayerName[playerid],
		playerid,
		g_PlayerName[id],
		id,
		level,
		GetAdminLevelName(level)
	);

	for(new loop_playerid, max_playerid = GetMaxPlayers(); loop_playerid < max_playerid; loop_playerid ++)
	{
		if(!IsPlayerConnected(loop_playerid))
		    continue;

		if(g_PlayerAdminLevel{loop_playerid} <= 0)
		    continue;

		if(loop_playerid == playerid)
		    continue;

		if(loop_playerid == id)
		    continue;

		SendClientMessage(loop_playerid, COLOR_ORANGE, message);
	}
    return 1;
}
