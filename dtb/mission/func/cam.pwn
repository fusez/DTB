SetPlayerCameraAtBombsite(playerid, bombsiteid)
{
	new	mapid = g_MapID,
		Float:bomb_x,
		Float:bomb_y,
		Float:bomb_z,
		Float:bomb_rx,
		Float:bomb_ry,
		Float:bomb_rz,
		Float:from_x,
		Float:from_y,
		Float:from_z,
		Float:to_x,
		Float:to_y,
		Float:to_z,
		Float:start_offset = 10.0;

	// Bombsite position & rotation
	GetMapBombsitePos(mapid, bombsiteid, bomb_x, bomb_y, bomb_z);
	GetMapBombsiteRot(mapid, bombsiteid, bomb_rx, bomb_ry, bomb_rz);

	from_x = bomb_x - (start_offset * floatsin(-bomb_rz, degrees));
	from_y = bomb_y - (start_offset * floatcos(-bomb_rz, degrees));
	from_z = bomb_z + start_offset;

	to_x = from_x;
	to_y = from_y;
	to_z = bomb_z + 2.0;

	// Move camera position
	InterpolateCameraPos(
		playerid, from_x, from_y, from_z, to_x, to_y, to_z, 5*1000, CAMERA_MOVE
	);

	// Move camera look at
	InterpolateCameraLookAt(
		playerid, bomb_x, bomb_y, bomb_z, bomb_x, bomb_y, bomb_z, 5*1000, CAMERA_MOVE
	);
}
