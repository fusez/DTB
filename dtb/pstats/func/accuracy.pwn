Float:GetPlayerAccuracy(playerid)
{
	new
		shots_fired = g_PlayerRoundShotsFired[playerid],
	    shots_hit = g_PlayerRoundShotsHit[playerid],
	    Float:accuracy
	;

	if(shots_fired == 0)
		accuracy = 0.0;
	else
		accuracy = (Float:shots_hit / Float:shots_fired) * 100.0;
	return accuracy;
}

