GetMapSpawnPos(mapid, teamid, &Float:x, &Float:y, &Float:z)
{
	switch(teamid)
	{
		case TEAM_ATTACK:
		{
			x = g_MapData[mapid][e_MapAttackSpawn][0];
			y = g_MapData[mapid][e_MapAttackSpawn][1];
			z = g_MapData[mapid][e_MapAttackSpawn][2];
		}
		case TEAM_DEFEND:
		{
			x = g_MapData[mapid][e_MapDefendSpawn][0];
			y = g_MapData[mapid][e_MapDefendSpawn][1];
			z = g_MapData[mapid][e_MapDefendSpawn][2];
		}
	}
}
