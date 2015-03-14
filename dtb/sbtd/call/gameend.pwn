public OnGameEnd(reason)
{
	for(new playerid, max_playerid = GetMaxPlayers(); playerid < max_playerid; playerid ++)
	{
		if(!IsPlayerConnected(playerid))
			continue;

		switch(reason)
		{
			case REASON_DESTROYED:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~target destroyed");
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~defeat~n~~w~target destroyed");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~attackers won~n~~w~target destroyed");
				}
			}
			case REASON_DEFUSED:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~defeat~n~~w~bomb defused");
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~bomb defused");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~b~defenders won~n~~w~bomb Defused");
				}
			}
			case REASON_ATTACK_KILLED:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~defeat~n~~w~killed");
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~opponents killed");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~b~defenders won~n~~w~opponents killed");
				}
			}
			case REASON_DEFEND_KILLED:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~opponents killed");
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~defeat~n~~w~killed");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~attackers won~n~~w~opponents killed");
				}
			}
			case REASON_ATTACK_DISCONNECT:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~opponents disconnected");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~b~defenders won~n~~w~opponents disconnected");
				}
			}
			case REASON_DEFEND_DISCONNECT:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~opponents disconnected");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~attackers won~n~~w~opponents disconnected");
				}
			}
			case REASON_NO_PLANT:
			{
				switch(g_PlayerTeam[playerid])
				{
					case TEAM_ATTACK:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~defeat~n~~w~no target was destroyed");
					case TEAM_DEFEND:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~g~victory~n~~w~targets defended");
					default:
						PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~b~defenders won~n~~w~no target was destroyed");
				}
			}
			case REASON_CANCELLED:
				PlayerTextDrawSetString(playerid, g_pScoreboardResultTD[playerid], "~r~no winner~n~~w~round cancelled");
		}
		PlayerTextDrawShow(playerid, g_pScoreboardResultTD[playerid]);
	}

	for(new column; column < 4; column ++)
		TextDrawShowForAll(g_ScoreboardColumnTD[column]);

	for(new teamid; teamid < 2; teamid ++)
	{
		TextDrawShowForAll(g_ScoreboardBoxTD[teamid]);
		TextDrawShowForAll(g_ScoreboardRowTD[teamid]);
		TextDrawShowForAll(g_ScoreboardTeamTD[teamid]);
	}

	for(new ref_playerid, max_playerid = GetMaxPlayers(); ref_playerid < max_playerid; ref_playerid ++)
	{
		if(!IsPlayerConnected(ref_playerid))
			continue;

		new
			ref_teamid = g_PlayerTeam[ref_playerid]
		;

		switch(ref_teamid)
		{
		    case TEAM_ATTACK, TEAM_DEFEND:
				{} // Add this player
			default:
			    continue; // Skip this player
		}

		new
			ref_index,
			Float:ref_health,
			Float:ref_armour,
			Float:ref_accuracy = GetPlayerAccuracy(ref_playerid)
		;

		ac_GetPlayerHealth(ref_playerid, ref_health);
		ac_GetPlayerArmour(ref_playerid, ref_armour);

		for(new cmp_playerid; cmp_playerid < max_playerid; cmp_playerid ++)
		{
			if(!IsPlayerConnected(cmp_playerid))
				continue;

			if(cmp_playerid == ref_playerid)
				continue;

			if(g_PlayerTeam[cmp_playerid] != g_PlayerTeam[ref_playerid])
				continue;

			if(g_PlayerRoundScore[cmp_playerid] >  g_PlayerRoundScore[ref_playerid])
				ref_index ++;
			else if(g_PlayerRoundScore[cmp_playerid] == g_PlayerRoundScore[ref_playerid])
			{
				if(g_PlayerRoundDamage[cmp_playerid] > g_PlayerRoundDamage[ref_playerid])
					ref_index ++;
				else if(g_PlayerRoundDamage[cmp_playerid] == g_PlayerRoundDamage[ref_playerid])
				{
					new
						Float:cmp_health,
						Float:cmp_armour
					;

					ac_GetPlayerHealth(cmp_playerid, cmp_health);
					ac_GetPlayerArmour(cmp_playerid, cmp_armour);

					if( (cmp_health + cmp_armour) > (ref_health + ref_armour) )
						ref_index ++;
					else if( (cmp_health + cmp_armour) == (ref_health + ref_armour) )
					{
						new
							Float:cmp_accuracy = GetPlayerAccuracy(cmp_playerid)
						;

						if(cmp_accuracy > ref_accuracy || (cmp_accuracy == ref_accuracy && ref_playerid > cmp_playerid))
							ref_index ++;
					}
				}
			}
		}

		// Name Column
		TextDrawSetString(g_ScoreboardPlayerTD[ref_teamid][ref_index], g_PlayerName[ref_playerid]);
		TextDrawShowForAll(g_ScoreboardPlayerTD[ref_teamid][ref_index]);

		// Bomb Column
		if((g_IsBombPlanted && g_BombPlanterID == ref_playerid) || (g_IsBombDefused && g_BombDefuserID == ref_playerid))
			TextDrawShowForAll(g_ScoreboardBombTD[ref_teamid][ref_index]);

		// Health Column
		if(g_PlayerRoundKilled{ref_playerid})
			TextDrawSetString(g_ScoreboardHealthTD[ref_teamid][ref_index], "Dead");
		else
		{
			new
				health_str[4]
			;

			format(health_str, sizeof health_str, "%i", floatround(ref_health) + floatround(ref_armour));
			TextDrawSetString(g_ScoreboardHealthTD[ref_teamid][ref_index], health_str);
		}
		TextDrawShowForAll(g_ScoreboardHealthTD[ref_teamid][ref_index]);

		// Score Column
		new
			score[3]
		;

		format(score, sizeof score, "%i", g_PlayerRoundScore[ref_playerid]);
		TextDrawSetString(g_ScoreboardScoreTD[ref_teamid][ref_index], score);
		TextDrawShowForAll(g_ScoreboardScoreTD[ref_teamid][ref_index]);

		// Damage Column
		new
			damage[5]
		;

		format(damage, sizeof damage, "%i", floatround(g_PlayerRoundDamage[ref_playerid]));
		TextDrawSetString(g_ScoreboardDamageTD[ref_teamid][ref_index], damage);
		TextDrawShowForAll(g_ScoreboardDamageTD[ref_teamid][ref_index]);

		// Accuracy Column
		new
			accuracy[8]
		;

		format(accuracy, sizeof accuracy, "%.2f%%", ref_accuracy);
		TextDrawSetString(g_ScoreboardAccuracyTD[ref_teamid][ref_index], accuracy);
		TextDrawShowForAll(g_ScoreboardAccuracyTD[ref_teamid][ref_index]);
	}

	#if defined sb_OnGameEnd
		sb_OnGameEnd(reason);
	#endif
}
#if defined _ALS_OnGameEnd
	#undef OnGameEnd
#else
	#define _ALS_OnGameEnd
#endif
#define OnGameEnd sb_OnGameEnd
#if defined sb_OnGameEnd
	forward sb_OnGameEnd(reason);
#endif
