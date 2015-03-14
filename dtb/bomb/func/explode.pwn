forward ExplodeBombsite();
public ExplodeBombsite()
{
	new mapid = g_MapID,
		bombsiteid = g_BombPlantSite,
		Float:x,
		Float:y,
		Float:z;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);
	RandomizeFloat(x, 5);
	RandomizeFloat(y, 5);
	RandomizeFloat(z, 5);

	if(g_BombObject != INVALID_OBJECT_ID)
	{
		CreateExplosion(x, y, z, 7, 500.0);
		DestroyBombObject();
		return 1;
	}

	for(new i = 4; i >= 0; i --)
	{
		if(g_BombsiteObjects[bombsiteid][i] == INVALID_OBJECT_ID)
			continue;

		CreateExplosion(x, y, z, 7, 500.0);
		DestroyObject(g_BombsiteObjects[bombsiteid][i]);
		g_BombsiteObjects[bombsiteid][i] = INVALID_OBJECT_ID;
		return 1;
	}

	DestroyBombsiteIcon(bombsiteid);
	g_IsBombExploding = false;
	KillTimer(g_BombExplodeTimer);
	return 0;
}
