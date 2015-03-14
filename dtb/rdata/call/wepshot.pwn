public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	g_PlayerRoundShotsFired[playerid] ++;
	if(hittype == BULLET_HIT_TYPE_PLAYER && g_PlayerTeam[playerid] != g_PlayerTeam[hitid])
		g_PlayerRoundShotsHit[playerid] ++;

	#if defined rstats_OnPlayerWeaponShot
		return rstats_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif
#define OnPlayerWeaponShot rstats_OnPlayerWeaponShot
#if defined rstats_OnPlayerWeaponShot
	forward rstats_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif
