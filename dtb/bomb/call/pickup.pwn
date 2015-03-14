public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == g_BombPickupID && g_BombPickupID != INVALID_PICKUP_ID)
	{
		if(g_PlayerTeam[playerid] != TEAM_ATTACK)
		    return 1;

		if(g_GameState != STATE_STARTED)
		    return 1;

		g_BombCarrierID = playerid;
		DestroyBombPickup();
		AttachPlayerBombToBack(playerid);
		PlayerPlaySound(playerid, 1150, 0.0, 0.0, 0.0);
		return 1;
	}

	#if defined bomb_OnPlayerPickUpPickup
		return bomb_OnPlayerPickUpPickup(playerid, pickupid);
	#else
	    return 0;
	#endif
}
#if defined _ALS_OnPlayerPickUpPickup
	#undef OnPlayerPickUpPickup
#else
	#define _ALS_OnPlayerPickUpPickup
#endif
#define OnPlayerPickUpPickup bomb_OnPlayerPickUpPickup
#if defined bomb_OnPlayerPickUpPickup
	forward bomb_OnPlayerPickUpPickup(playerid, pickupid);
#endif
