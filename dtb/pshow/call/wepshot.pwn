public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid)
	{
		case 22, 24, 25, 26, 27, 28, 32, 29, 30, 31, 33, 34, 38:
			ShowPlayerForOpponents(playerid, true);
	}

	#if defined pshow_OnPlayerWeaponShot
		return pshow_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif
#define OnPlayerWeaponShot pshow_OnPlayerWeaponShot
#if defined pshow_OnPlayerWeaponShot
	forward pshow_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
