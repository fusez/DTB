// On Player Health Set: OPHS

forward OnPlayerHealthSet(playerid, Float:new_health, Float:old_health);

stock ophs_SetPlayerHealth(playerid, Float:health)
{
	static Float: old_health [MAX_PLAYERS];

	SetPlayerHealth(playerid, health);
	CallLocalFunction("OnPlayerHealthSet", "iff", playerid, health, old_health[playerid]);

    old_health[playerid] = health;
}

#if defined _ALS_SetPlayerHealth
	#undef SetPlayerHealth
#else
	#define _ALS_SetPlayerHealth
#endif
#define SetPlayerHealth ophs_SetPlayerHealth
