stock ac_ResetPlayerWeapons(playerid)
{
	for(new slot; slot < 13; slot ++)
	{
		g_acWeaponData		[playerid][slot][0] = 0;
		g_acWeaponData		[playerid][slot][1] = 0;
		g_acWeaponWarnings	[playerid][slot] = 0;
		g_acWeaponSynced	[playerid][slot] = false;
	}
    ResetPlayerWeapons(playerid);
}
#if defined _ALS_ResetPlayerWeapons
	#undef ResetPlayerWeapons
#else
	#define _ALS_ResetPlayerWeapons
#endif
#define ResetPlayerWeapons ac_ResetPlayerWeapons
