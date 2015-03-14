COMMAND:shutdown(playerid)
{
	if(g_PlayerAdminLevel{playerid} < 2)
	    return 0;

	SendRconCommand("exit");
    return 1;
}
