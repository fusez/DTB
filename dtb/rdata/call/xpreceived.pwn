public OnPlayerXPReceived(playerid, xp, reason[])
{
    g_PlayerRoundScore[playerid] += xp;
	SetPlayerScore(playerid, g_PlayerRoundScore[playerid]);

	#if defined rstats_OnPlayerXPReceived
		rstats_OnPlayerXPReceived(playerid, xp, reason);
	#endif
}
#if defined _ALS_OnPlayerXPReceived
	#undef OnPlayerXPReceived
#else
	#define _ALS_OnPlayerXPReceived
#endif
#define OnPlayerXPReceived rstats_OnPlayerXPReceived
#if defined rstats_OnPlayerXPReceived
	forward rstats_OnPlayerXPReceived(playerid, xp, reason[]);
#endif
