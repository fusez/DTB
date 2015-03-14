public OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour)
{
	if(new_armour < old_armour)
		CreatePlayerDamageIcon(playerid, 1242);

	#if defined di_OnPlayerArmourSet
		di_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
	#endif
}
#if defined _ALS_OnPlayerArmourSet
	#undef OnPlayerArmourSet
#else
	#define _ALS_OnPlayerArmourSet
#endif
#define OnPlayerArmourSet di_OnPlayerArmourSet
#if defined di_OnPlayerArmourSet
	forward di_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
#endif
