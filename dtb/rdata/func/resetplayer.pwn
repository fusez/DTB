ResetPlayerRoundVariables(playerid)
{
	g_PlayerRoundKilled		{playerid} = false;
	for(new i; i < 2; i ++)
		g_pChosenWeapons	[playerid][i] = 0;
	g_PlayerRoundScore		[playerid] = 0;
	g_PlayerRoundDamage		[playerid] = 0.0;
	g_PlayerRoundShotsFired	[playerid] = 0;
	g_PlayerRoundShotsHit	[playerid] = 0;

	for(new assistid; assistid < MAX_PLAYERS; assistid ++)
		g_PlayerDamagedBy[playerid][assistid] = false;
}
