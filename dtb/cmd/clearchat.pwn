COMMAND:clearchat(playerid)
{
	if(g_PlayerAdminLevel{playerid} < 1)
	    return 0;

	ClearChatForAll();
    return 1;
}
