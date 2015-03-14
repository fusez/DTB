forward OnPlayerAccountCreated(playerid);
public OnPlayerAccountCreated(playerid)
{
	if(cache_affected_rows(g_DBHandle) > 0)
		g_PlayerAccountID[playerid] = cache_insert_id(g_DBHandle);
    return 1;
}
