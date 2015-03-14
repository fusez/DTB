public OnPlayerSpawn(playerid)
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

	ResetPlayerWeapons(playerid);

	ResetPlayerMoney(playerid);

	SetPlayerHealth(playerid, 100.0);

	SetPlayerArmour(playerid, 100.0);

	#if defined ac_OnPlayerSpawn
		return ac_OnPlayerSpawn(playerid);
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn ac_OnPlayerSpawn
#if defined ac_OnPlayerSpawn
	forward ac_OnPlayerSpawn(playerid);
#endif
