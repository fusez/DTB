public OnPlayerHealthSet(playerid, Float:new_health, Float:old_health)
{
	if(new_health > 0.0)
	{
		new string[7];
		format(string, sizeof(string), "~r~%i", floatround(new_health));
		PlayerTextDrawSetString(playerid, g_PlayerHealthTD[playerid], string);
		PlayerTextDrawShow(playerid, g_PlayerHealthTD[playerid]);
	}
	else
		PlayerTextDrawHide(playerid, g_PlayerHealthTD[playerid]);

	#if defined phtd_OnPlayerHealthSet
		phtd_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
	#endif
}
#if defined _ALS_OnPlayerHealthSet
	#undef OnPlayerHealthSet
#else
	#define _ALS_OnPlayerHealthSet
#endif
#define OnPlayerHealthSet phtd_OnPlayerHealthSet
#if defined phtd_OnPlayerHealthSet
	forward phtd_OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);
#endif
