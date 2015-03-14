public OnPlayerSpawn(playerid)
{
	new teamid = g_PlayerTeam[playerid];
	switch(teamid)
	{
	    case TEAM_ATTACK, TEAM_DEFEND:
	    {
			new
				mapid = g_MapID,
				Float:x,
				Float:y,
				Float:z,
				Float:angle
			;

			GetMapSpawnPos(mapid, teamid, x, y, z);
			GetMapSpawnAngle(mapid, teamid, angle);
			RandomizeFloat(x, 2);
			RandomizeFloat(y, 2);

			SetPlayerPos(playerid, x, y, z);
			SetPlayerFacingAngle(playerid, angle);
			SetPlayerInterior(playerid, GetMapInterior(mapid));
		}
	}

	#if defined map_OnPlayerSpawn
		return map_OnPlayerSpawn(playerid);
	#else
	    return 1;
	#endif
}
#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif
#define OnPlayerSpawn map_OnPlayerSpawn
#if defined map_OnPlayerSpawn
	forward map_OnPlayerSpawn(playerid);
#endif
