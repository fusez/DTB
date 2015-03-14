ac_CheckPlayerRepeatingChat(playerid, const text[])
{
	if(
		!strcmp(text, g_acMessageString[playerid], true) &&
		strlen(g_acMessageString[playerid]) > 0
	){
		if(g_acMessageWarnings{playerid} >= MAX_AC_REPEAT_WARNINGS)
			SendClientMessage(playerid, COLOR_RED, "Stop repeating yourself!");
		else
            g_acMessageWarnings{playerid} ++;
	}
	else
	{
   	    g_acMessageWarnings{playerid} = 0;
		format(g_acMessageString[playerid], MAX_AC_REPEAT_STRING + 1, text);
	}
	return (g_acMessageWarnings{playerid} >= MAX_AC_REPEAT_WARNINGS);
}
