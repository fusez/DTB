CreateBombsiteObjects(bombsiteid)
{
	new mapid = g_MapID,
		Float:x,
		Float:y,
		Float:z,
		Float:rx,
		Float:ry,
		Float:rz;

	GetMapBombsitePos(mapid, bombsiteid, x, y, z);
	GetMapBombsiteRot(mapid, bombsiteid, rx, ry, rz);
	switch(random(2))
	{
		case 0: // Single Missile
		{
			g_BombsiteObjects[bombsiteid][0] = CreateObject(3791, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][1] = CreateObject(3788, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][2] = CreateObject(3786, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][3] = CreateObject(3793, x, y, z, rx, ry, rz);
            g_BombsiteObjects[bombsiteid][4] = INVALID_OBJECT_ID;

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][1], g_BombsiteObjects[bombsiteid][0], 0.0, 0.0, 0.69, 0.0, 0.0, 0.0, 1
			);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][2], g_BombsiteObjects[bombsiteid][0], 0.0, 0.0, 0.89, 0.0, 0.0, 0.0, 1
			);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][3], g_BombsiteObjects[bombsiteid][0], 0.0, 0.40, 1.35, 0.0, 0.0, 0.0, 1
			);
		}
		case 1: // Double Missiles
		{
			g_BombsiteObjects[bombsiteid][0] = CreateObject(3791, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][1] = CreateObject(3789, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][2] = CreateObject(3790, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][3] = CreateObject(3790, x, y, z, rx, ry, rz);
			g_BombsiteObjects[bombsiteid][4] = CreateObject(3792, x, y, z, rx, ry, rz);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][1], g_BombsiteObjects[bombsiteid][0], 0.0, 0.0, 0.51, 0.0, 0.0, 0.0, 1
			);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][2], g_BombsiteObjects[bombsiteid][0], 0.0, 0.25, 0.68, 0.0, 0.0, 0.0, 1
			);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][3], g_BombsiteObjects[bombsiteid][0], 0.0, -0.27, 0.68, 0.0, 0.0, 0.0, 1
			);

			AttachObjectToObject(
				g_BombsiteObjects[bombsiteid][4], g_BombsiteObjects[bombsiteid][0], 0.0, 0.34, 1.26, 0.0, 0.0, 0.0, 1
			);

		}
	}
	SetBombsiteObjectsColour(bombsiteid);
}

DestroyBombsiteObjects(bombsiteid)
{
	for(new i; i < 5; i ++)
	{
		if(g_BombsiteObjects[bombsiteid][i] == INVALID_OBJECT_ID)
			continue;

		DestroyObject(g_BombsiteObjects[bombsiteid][i]);
		g_BombsiteObjects[bombsiteid][i] = INVALID_OBJECT_ID;
	}
}

SetBombsiteObjectsColour(bombsiteid)
{
	new rgba = g_SiteColors[bombsiteid],
		argb = RGBAtoARGB(rgba);

	for(new object_index; object_index < 5; object_index ++)
	{
		new objectid = g_BombsiteObjects[bombsiteid][object_index];
		if(objectid == INVALID_OBJECT_ID)
			continue;

		for(new material_index; material_index < 5; material_index ++)
			SetObjectMaterial(objectid, material_index, -1, "none", "none", argb);
	}
}
