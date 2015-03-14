UpdateTeamHealthTextdraws(teamid)
{
	new current_health,
		max_health,
		Float:percent_health,
		string[5];

	GetTeamHealth(teamid, current_health, max_health);
	percent_health = float(current_health) / float(max_health);
	format(string, sizeof string, "%i", floatround(current_health));

	TextDrawSetString	(g_TeamTextHealthTD[teamid], string);
	TextDrawShowForAll	(g_TeamTextHealthTD[teamid]);

	if(percent_health < 0)
	    percent_health = 0;
	else if(percent_health > 1.0)
        percent_health = 1.0;

	if(current_health > 0.0)
	{
		new	Float:min_size = TEAM_HEALTH_BAR_MIN[teamid],
			Float:max_size = TEAM_HEALTH_BAR_MAX[teamid],
			Float:offset_size = max_size - min_size,
			Float:final_size = min_size + (percent_health * offset_size);

		TextDrawTextSize		(g_TeamCurrentHealthTD[teamid], final_size, 0.0);
		TextDrawShowForAll		(g_TeamCurrentHealthTD[teamid]);
	}
	else
		TextDrawHideForAll		(g_TeamCurrentHealthTD[teamid]);
	TextDrawShowForAll			(g_TeamMaxHealthTD[teamid]);
	return 1;
}
