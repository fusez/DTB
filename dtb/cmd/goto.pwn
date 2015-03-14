COMMAND:goto(playerid, params[])
{
	if(g_PlayerAdminLevel{playerid} < 1)
	    return 0;

	new id;
	if(sscanf(params, "i", id))
	    return SendClientMessage(playerid, COLOR_RED, "SYNTAX: /Goto <playerid>"), 1;

	if(!IsPlayerConnected(id))
		return SendClientMessage(playerid, COLOR_RED, "This player is not connected!"), 1;

	if(id == playerid)
		return SendClientMessage(playerid, COLOR_RED, "You cannot use this on yourself!"), 1;

	if(!IsPlayerSpawned(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "You are not spawned!"), 1;

	if(!IsPlayerSpawned(id))
	    return SendClientMessage(playerid, COLOR_RED, "This player is not spawned!"), 1;

	new Float:x,
		Float:y,
		Float:z,
		vehicleid = GetPlayerVehicleID(id);

	if(vehicleid)
		GetVehiclePos(vehicleid, x, y, z);
	else
		GetPlayerPos(id, x, y, z);
	SetPlayerPos(playerid, x, y, z);
	return 1;
}
