stock ac_GivePlayerWeapon(playerid, weaponid, ammo)
{
	new slot = GetWeaponSlot(weaponid);

    g_acWeaponData		[playerid][slot][0] = weaponid;
    g_acWeaponData		[playerid][slot][1] += ammo;
	g_acWeaponWarnings	[playerid][slot] = 0;
	g_acWeaponSynced	[playerid][slot] = false;

	if(weaponid == 39)
	    ac_GivePlayerWeapon(playerid, 40, 1);

	GivePlayerWeapon(playerid, weaponid, ammo);
}
#if defined _ALS_GivePlayerWeapon
	#undef GivePlayerWeapon
#else
	#define _ALS_GivePlayerWeapon
#endif
#define GivePlayerWeapon ac_GivePlayerWeapon
