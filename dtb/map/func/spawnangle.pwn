GetMapSpawnAngle(mapid, teamid, &Float:angle)
{
	switch(teamid)
	{
		case TEAM_ATTACK:
			angle = g_MapData[mapid][e_MapAttackSpawn][3];
		case TEAM_DEFEND:
			angle = g_MapData[mapid][e_MapDefendSpawn][3];
	}
}
