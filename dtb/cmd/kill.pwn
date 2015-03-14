COMMAND:kill(playerid)
{
	if(!IsPlayerSpawned(playerid))
	    return SendClientMessage(playerid, COLOR_RED, "You are not spawned!"), 1;

	SetPlayerHealth(playerid, 0.0);
	return 1;
}
