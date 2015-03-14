COMMAND:restart(playerid)
{
	if(g_PlayerAdminLevel{playerid} < 2)
	    return 0;

	SendRconCommand("gmx");
    return 1;
}
