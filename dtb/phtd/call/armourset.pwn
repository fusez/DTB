public OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour)
{
	if(new_armour > 1.0)
	{
		new string[4];
		format(string, sizeof(string), "%i", floatround(new_armour));
		PlayerTextDrawSetString(playerid, g_PlayerArmourTD[playerid], string);
		PlayerTextDrawShow(playerid, g_PlayerArmourTD[playerid]);
	}
	else
	    PlayerTextDrawHide(playerid, g_PlayerArmourTD[playerid]);

	#if defined phtd_OnPlayerArmourSet
		phtd_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
	#endif
}
#if defined _ALS_OnPlayerArmourSet
	#undef OnPlayerArmourSet
#else
	#define _ALS_OnPlayerArmourSet
#endif
#define OnPlayerArmourSet phtd_OnPlayerArmourSet
#if defined phtd_OnPlayerArmourSet
	forward phtd_OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);
#endif
