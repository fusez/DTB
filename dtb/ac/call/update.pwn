public OnPlayerUpdate(playerid)
{
	static
	    previous_tick		[MAX_PLAYERS],
		previous_vehicle	[MAX_PLAYERS]
	;

	if(GetTickCount() - previous_tick[playerid] > 1000)
	{
		ac_CheckPlayerMoney(playerid);
		ac_CheckPlayerArmour(playerid);
        ac_CheckPlayerHealth(playerid);
        ac_CheckPlayerJetpack(playerid);
        ac_CheckPlayerWeapons(playerid);
		ac_IsPlayerFlyhacking(playerid);

        previous_tick[playerid] = GetTickCount();
	}

	new vehicleid = GetPlayerVehicleID(playerid);
	if(vehicleid != previous_vehicle[playerid])
	{
		ac_CheckPlayerFlooding(playerid);
	    previous_vehicle[playerid] = vehicleid;
	}

	#if defined ac_OnPlayerUpdate
		return ac_OnPlayerUpdate(playerid);
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate ac_OnPlayerUpdate
#if defined ac_OnPlayerUpdate
	forward ac_OnPlayerUpdate(playerid);
#endif
