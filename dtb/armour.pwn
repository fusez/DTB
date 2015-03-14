// On Player Armour Set: OPAS

forward OnPlayerArmourSet(playerid, Float:new_armour, Float:old_armour);

stock opas_SetPlayerArmour(playerid, Float:armour)
{
	static Float: old_armour [MAX_PLAYERS];

	SetPlayerArmour(playerid, armour);
	CallLocalFunction("OnPlayerArmourSet", "iff", playerid, armour, old_armour[playerid]);

    old_armour[playerid] = armour;
}

#if defined _ALS_SetPlayerArmour
	#undef SetPlayerArmour
#else
	#define _ALS_SetPlayerArmour
#endif
#define SetPlayerArmour opas_SetPlayerArmour
