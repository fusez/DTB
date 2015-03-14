public OnPlayerHealthSet(playerid, Float:new_health, Float:old_health)
{
    g_acHealth[playerid] = new_health;
	g_acHealthWarnings{playerid} = 0;

	#if defined ac_OnPlayerHealthSet
		ac_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
	#endif
}
#if defined _ALS_OnPlayerHealthSet
	#undef OnPlayerHealthSet
#else
	#define _ALS_OnPlayerHealthSet
#endif
#define OnPlayerHealthSet ac_OnPlayerHealthSet
#if defined ac_OnPlayerHealthSet
	forward ac_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
#endif
