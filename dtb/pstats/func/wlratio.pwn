Float:GetPlayerWLRatio(playerid)
{
	new
		wins = g_PlayerGamesWon[playerid],
		losses = g_PlayerGamesLost[playerid],
		Float:ratio
	;

	if(losses == 0)
		ratio = Float:wins / 1.0;
	else
		ratio = Float:wins / Float:losses;
	return ratio;
}
