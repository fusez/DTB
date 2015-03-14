public OnPlayerUpdate(playerid)
{
	static previous_tick[MAX_PLAYERS];
	if(GetTickCount() - previous_tick[playerid] > 1000)
	{
		new
			check_zone = IsPlayerSpawned(playerid) && g_GameState == STATE_STARTED,
			bool: in_zone = (check_zone) ? (IsPlayerInZone(playerid)) : (true)
		;

		if(in_zone != g_IsPlayerInZone{playerid})
		{
			if(in_zone)
			{
				PlayerTextDrawHide(playerid, g_ZoneTextTD[playerid]);
				PlayerTextDrawHide(playerid, g_ZoneBackgroundTD[playerid]);
				g_PlayerZoneWarnings{playerid} = 0;
			}
			else
			{
				PlayerTextDrawShow(playerid, g_ZoneTextTD[playerid]);
				PlayerTextDrawShow(playerid, g_ZoneBackgroundTD[playerid]);
			}
			g_IsPlayerInZone{playerid} = in_zone;
		}

		if(!in_zone)
		{
			new warningsleft = MAX_WARZONE_WARNINGS - g_PlayerZoneWarnings{playerid};
			if(warningsleft > 0)
			{
				new string[32];
				format(string, sizeof string, "leaving warzone~n~in %i seconds", warningsleft);
				PlayerTextDrawSetString(playerid, g_ZoneTextTD[playerid], string);
				g_PlayerZoneWarnings{playerid} ++;
			}
			else
			{
				SetPlayerHealth(playerid, 0.0);
				PlayerTextDrawSetString(playerid, g_ZoneTextTD[playerid], "you left the warzone");
				g_PlayerZoneWarnings{playerid} = 0;
			}
		}
		previous_tick[playerid] = GetTickCount();
	}

	#if defined wz_OnPlayerUpdate
		return wz_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate wz_OnPlayerUpdate
#if defined wz_OnPlayerUpdate
	forward wz_OnPlayerUpdate(playerid);
#endif
