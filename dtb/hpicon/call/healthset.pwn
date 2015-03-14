public OnPlayerHealthSet(playerid, Float:new_health, Float:old_health)
{
	if(new_health < old_health)
		CreatePlayerDamageIcon(playerid, 1240);

	#if defined di_OnPlayerHealthSet
		di_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
	#endif
}
#if defined _ALS_OnPlayerHealthSet
	#undef OnPlayerHealthSet
#else
	#define _ALS_OnPlayerHealthSet
#endif
#define OnPlayerHealthSet di_OnPlayerHealthSet
#if defined di_OnPlayerHealthSet
	forward di_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
#endif
