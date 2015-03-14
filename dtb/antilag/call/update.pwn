public OnPlayerUpdate(playerid)
{
	static
		previous_tick[MAX_PLAYERS]
	;

	if(GetTickCount() - previous_tick[playerid] > 1000)
	{
		new
			ping = GetPlayerPing(playerid),
			Float:packetloss = GetPlayerPacketloss(playerid),
			fps	= GetPlayerFramerate(playerid),
			ping_string[10],
			pl_string[19]
		;

		format(ping_string, sizeof ping_string, "Ping: %i", ping);
		format(pl_string, sizeof pl_string, "Packetloss: %.1f%%", packetloss);

		PlayerTextDrawSetString(playerid, g_PingTD[playerid], ping_string);
		PlayerTextDrawSetString(playerid, g_PacketlossTD[playerid], pl_string);

		// Ping
		if(ping > MAX_PING && ping != INVALID_PING)
		{
			if(g_PingWarnings[playerid] > 10)
			{
				new reason[30];
				format(reason, sizeof reason,
					"High Ping (%i ms)", ping
				);
				Kick(playerid, reason);
			}
			else if(g_PingWarnings[playerid] ++ == 0)
				PlayerTextDrawColor(playerid, g_PingTD[playerid], COLOR_RED);
		}
		else if(g_PingWarnings[playerid] > 0)
		{
			PlayerTextDrawColor(playerid, g_PingTD[playerid], COLOR_WHITE);
		    g_PingWarnings[playerid] = 0;
		}

		// Framerate
		if(!IsPlayerSpawned(playerid))
		{
			PlayerTextDrawSetString(playerid, g_FramerateTD[playerid], "FPS: -");
			if(g_FpsWarnings[playerid] > 0)
			{
				PlayerTextDrawColor(playerid, g_FramerateTD[playerid], COLOR_WHITE);
			    g_FpsWarnings[playerid] = 0;
			}
		}
		else
		{
			new fps_string[9];
			format(fps_string, sizeof(fps_string), "FPS: %i", fps);
			PlayerTextDrawSetString(playerid, g_FramerateTD[playerid], fps_string);

			if(fps < MIN_FPS)
			{
				if(g_FpsWarnings[playerid] > 10)
				{
					new reason[40];
					format(reason, sizeof reason,
						"Low Framerate (%i FPS)", fps
					);
					Kick(playerid, reason);
				}
				else if(g_FpsWarnings[playerid] ++ == 0)
					PlayerTextDrawColor(playerid, g_FramerateTD[playerid], COLOR_RED);
			}
			else if(g_FpsWarnings[playerid] > 0)
			{
				PlayerTextDrawColor(playerid, g_FramerateTD[playerid], COLOR_WHITE);
			    g_FpsWarnings[playerid] = 0;
			}
		}

		// Packetloss
		if(packetloss > MAX_PACKETLOSS)
		{
			if(g_PacketLossWarnings[playerid] > 10)
			{
				new reason[40];
				format(reason, sizeof reason,
					"Packetloss (%.1f %%)", packetloss
				);
				Kick(playerid, reason);
			}
			else if(g_PacketLossWarnings[playerid] ++ == 0)
				PlayerTextDrawColor(playerid, g_PacketlossTD[playerid], COLOR_RED);
		}
		else if(g_PacketLossWarnings[playerid] > 0)
		{
			PlayerTextDrawColor(playerid, g_PacketlossTD[playerid], COLOR_WHITE);
			g_PacketLossWarnings[playerid] = 0;
		}

        previous_tick[playerid] = GetTickCount();
	}

	#if defined al_OnPlayerUpdate
		return al_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif
#define OnPlayerUpdate al_OnPlayerUpdate
#if defined al_OnPlayerUpdate
	forward al_OnPlayerUpdate(playerid);
#endif
