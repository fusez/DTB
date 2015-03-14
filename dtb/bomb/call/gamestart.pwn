public OnGameStart()
{
	new mapid = g_MapID,
		Float:x,
		Float:y,
		Float:z;

	GetMapSpawnPos(mapid, TEAM_ATTACK, x, y, z);
	CreateBombPickup(x, y, z);

	for(new bombsite; bombsite < 2; bombsite ++)
	{
		CreateBombsiteIcon(bombsite);
		CreateBombsiteObjects(bombsite);
	}

	#if defined bomb_OnGameStart
		bomb_OnGameStart();
	#endif
}
#if defined _ALS_OnGameStart
	#undef OnGameStart
#else
	#define _ALS_OnGameStart
#endif
#define OnGameStart bomb_OnGameStart
#if defined bomb_OnGameStart
	forward bomb_OnGameStart();
#endif
