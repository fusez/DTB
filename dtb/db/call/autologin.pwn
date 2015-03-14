forward OnPlayerAutoLogin(playerid);
public OnPlayerAutoLogin(playerid)
{
	if(cache_get_row_count(g_DBHandle) > 0)
	{
		new
			last_ip[MAX_IPV4 + 1],
			last_gpci[MAX_GPCI + 1]
		;

	    cache_get_field_content(0, "session_ip", last_ip, g_DBHandle);
	    cache_get_field_content(0, "session_gpci", last_gpci, g_DBHandle);

		if(
			!strcmp(g_PlayerIP[playerid], last_ip) &&
			!strcmp(g_PlayerGPCI[playerid], last_gpci)
		){
			LoginPlayer(playerid, g_PlayerAccountID[playerid], true);
		}
		else
	        ShowPlayerLoginDialog(playerid);
	}
	else
        ShowPlayerLoginDialog(playerid);
    return 1;
}
