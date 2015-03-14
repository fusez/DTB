Float:GetPlayerKDRatio(playerid)
{
	new
		kills = g_PlayerKills[playerid],
		deaths = g_PlayerDeaths[playerid],
		Float:ratio
	;

	if(deaths == 0)
		ratio = Float:kills / 1.0;
	else
		ratio = Float:kills / Float:deaths;
	return ratio;
}
