public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	switch(weaponid)
	{
		case 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 38:
			ac_CheckPlayerNoReload(playerid, weaponid);
		default: // spoof data
			return Ban(playerid, "Spoof Weapon Data"), 0;
	}


	#if defined ac_OnPlayerWeaponShot
		return ac_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, fX, fY, fZ);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif
#define OnPlayerWeaponShot ac_OnPlayerWeaponShot
#if defined ac_OnPlayerWeaponShot
	forward ac_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
