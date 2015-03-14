CreateBombObject(bombsiteid)
{
	if(g_BombObject != INVALID_OBJECT_ID)
		DestroyObject(g_BombObject);

	new mapid = g_MapID,
		Float:x,
		Float:y,
		Float:z,
		Float:rx,
		Float:ry,
		Float:rz;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);
	GetMapBombsiteRot(mapid, bombsiteid, rx, ry, rz);

	g_BombObject = CreateObject(1252, x, y, z, 0.0, 0.0, 0.0);
	AttachObjectToObject(
		g_BombObject, g_BombsiteObjects[bombsiteid][0], 0.0, -0.68, 0.50, 0.0, 0.0, 0.0
	);
}

DestroyBombObject()
{
	if(g_BombObject == INVALID_OBJECT_ID)
	    return 0;

	DestroyObject(g_BombObject);
    g_BombObject = INVALID_OBJECT_ID;
	return 1;
}
