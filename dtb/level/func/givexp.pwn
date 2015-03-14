GivePlayerXP(playerid, xp, reason[])
{
	new
		level = g_PlayerLevel{playerid},
		level_xp = GetLevelXP(level),
		msg[128]
	;

	if(xp > 1)
		format(msg, sizeof msg, "XP Earned: +%i Points (%s)", xp, reason);
	else
		format(msg, sizeof msg, "XP Earned: +%i Point (%s)", xp, reason);
	SendClientMessage(playerid, COLOR_GREEN, msg);

	g_PlayerXP[playerid] += xp;
	if(g_PlayerXP[playerid] >= level_xp)
	{
		SendClientMessage(playerid, COLOR_GREEN, "Level Up!");

		g_PlayerLevel{playerid} ++;
		g_PlayerXP[playerid] -= level_xp;
		UpdatePlayerLevelTextdraws(playerid, true);
	}
	else
		UpdatePlayerLevelTextdraws(playerid, false);

	return CallLocalFunction("OnPlayerXPReceived", "iis", playerid, xp, reason), 1;
}
