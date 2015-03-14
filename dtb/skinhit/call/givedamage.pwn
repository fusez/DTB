public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if(IsPlayerStreamedIn(playerid, damagedid) && IsPlayerStreamedIn(damagedid, playerid))
		DamagePlayer(damagedid, playerid, amount, weaponid, bodypart);

	#if defined sh_OnPlayerGiveDamage
		sh_OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart);
	#endif
}
#if defined _ALS_OnPlayerGiveDamage
	#undef OnPlayerGiveDamage
#else
	#define _ALS_OnPlayerGiveDamage
#endif
#define OnPlayerGiveDamage sh_OnPlayerGiveDamage
#if defined sh_OnPlayerGiveDamage
	forward sh_OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart);
#endif
