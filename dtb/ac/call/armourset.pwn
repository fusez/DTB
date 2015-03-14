public OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour)
{
    g_acArmour[playerid] = new_armour;
	g_acArmourWarnings{playerid} = 0;

	#if defined ac_OnPlayerArmourSet
		ac_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
	#endif
}
#if defined _ALS_OnPlayerArmourSet
	#undef OnPlayerArmourSet
#else
	#define _ALS_OnPlayerArmourSet
#endif
#define OnPlayerArmourSet ac_OnPlayerArmourSet
#if defined ac_OnPlayerArmourSet
	forward ac_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
#endif
