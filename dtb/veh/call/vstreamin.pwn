public OnVehicleStreamIn(vehicleid, forplayerid)
{
    SetVehicleParamsForPlayer(vehicleid, forplayerid, 0, 1);

	#if defined veh_OnVehicleStreamIn
		veh_OnVehicleStreamIn(vehicleid, forplayerid);
	#endif
}
#if defined _ALS_OnVehicleStreamIn
	#undef OnVehicleStreamIn
#else
	#define _ALS_OnVehicleStreamIn
#endif
#define OnVehicleStreamIn veh_OnVehicleStreamIn
#if defined veh_OnVehicleStreamIn
	forward veh_OnVehicleStreamIn(vehicleid, forplayerid);
#endif
