public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(
		issuerid == INVALID_PLAYER_ID ||
		(weaponid == 37 || weaponid == 49 || weaponid == 50 || weaponid == 51) ||
		(GetPlayerState(issuerid) == PLAYER_STATE_DRIVER && (weaponid == 31 || weaponid == 38))
	){
		DamagePlayer(playerid, issuerid, amount, weaponid, bodypart);
	}

	#if defined sh_OnPlayerTakeDamage
		return sh_OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart);
	#endif
}
#if defined _ALS_OnPlayerTakeDamage
	#undef OnPlayerTakeDamage
#else
	#define _ALS_OnPlayerTakeDamage
#endif
#define OnPlayerTakeDamage sh_OnPlayerTakeDamage
#if defined sh_OnPlayerTakeDamage
	forward sh_OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart);
#endif
