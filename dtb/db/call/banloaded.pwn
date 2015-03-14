forward OnPlayerBanLoaded(playerid);
public OnPlayerBanLoaded(playerid)
{
	if(cache_get_row_count(g_DBHandle) > 0)
	{
		new
			ban_reason[50],
		    kick_reason[64]
		;

        cache_get_field_content(0, "ban_reason", ban_reason, g_DBHandle);
		format(kick_reason, sizeof kick_reason, "Previous Ban (%s)", ban_reason);
		Kick(playerid, kick_reason);
	}
    return 1;
}
